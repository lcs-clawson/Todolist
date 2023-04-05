//
//  TodolistApp.swift
//  Todolist
//
//  Created by Cooper Lawson on 2023-04-03.
//

import Blackbird
import SwiftUI

@main
struct TodolistApp: App {
    var body: some Scene {
        WindowGroup {
            ListView()
         //Making the database available to other views.
                .environment(\.blackbirdDatabase, AppDatabase.instance)
        }
    }
}
