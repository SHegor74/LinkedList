// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

// Узел
class Node<T> {
    var value: T
    weak var previous: Node?
    var next: Node?
    
    init(_ value: T) {
        self.value = value
    }
}

class LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
}

// Базовые свойства
extension LinkedList {
    var isEmpty: Bool { head == nil }
    var first: T? { head?.value }
    var last: T? { tail?.value }
}

// Основные методы
extension LinkedList {
    // Поиск по индексу
    private func nodeBy(_ index: Int) -> Node<T>? {
        guard index >= 0 else { return nil }
        var currentNode = head
        var teporaryElement = index
        
        while currentNode != nil {
            if teporaryElement == 0 {
                return currentNode
            }
            teporaryElement -= 1
            currentNode = currentNode?.next
        }
        return nil
    }

    // Добавление в конец
    func append(_ value: T) {
        let newNode = Node(value)
        
        if let tail {
            newNode.previous = tail
            tail.next = newNode
        } else {
            head = newNode
        }
        tail = newNode
    }
    
    // Получение значения по индексу
    func value(_ index: Int) -> T? {
        let node = nodeBy(index)
        return node?.value
    }
    
    // Удаление по индексу
    @discardableResult
    func remove(at index: Int) -> T? {
        guard let removedNode = nodeBy(index) else { return nil }
        
        let previous = removedNode.previous
        let next = removedNode.next
        
        if let previous {
            previous.next = next
        }  else {
            head = next
        }
        if let next {
            next.previous = previous
        } else {
            tail = previous
        }
        removedNode.previous = nil
        removedNode.next = nil
        return removedNode.value
    }
}

// Печать значений
extension LinkedList: CustomStringConvertible {
    var description: String {
        var text = "["
        var currentNode = head
        
        while currentNode != nil {
            text += "\(currentNode!.value)"
            currentNode = currentNode?.next
            if currentNode != nil {
                text += " <-> "
            }
        }
        text += "]"
        return text
    }
}
