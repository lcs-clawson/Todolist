//
//  TodoItem.swift
//  Todolist
//
//  Created by Cooper Lawson on 2023-04-03.
//

import Blackbird
import Foundation

struct Todoitem: BlackbirdModel {
    @BlackbirdColumn var id: Int
    @BlackbirdColumn var description: String
    @BlackbirdColumn var completed: Bool
}
