//
//  TodoItem.swift
//  Todolist
//
//  Created by Cooper Lawson on 2023-04-03.
//

import Foundation

struct Todoitem: Identifiable {
    var id: Int
    var description: String
    var completed: Bool
}

var existingToDoItems = [
Todoitem(id: 1, description: "Study for phisycs quiz", completed: false)

,

Todoitem(id: 2, description: "Finish computer science assignment", completed: true)

,


Todoitem(id: 3, description: "Go for a run", completed: false)

,

]
