//
//  ListView.swift
//  Todolist
//
//  Created by Cooper Lawson on 2023-04-03.
//

import Blackbird
import SwiftUI

struct ListView: View {
    
    
    @Environment (\.blackbirdDatabase) var db: Blackbird.Database?

    // MARK Stored Properties
    
    @BlackbirdLiveModels ({ db in
        try await Todoitem.read(from: db)
    }) var todoItems
    
    
    @State var newitemDescription: String = ""
    
    // MARK Computed Properties
    var body: some View {

        NavigationView {
            
            VStack {
                
                HStack {
                    
                    TextField("Enter a to-do item", text: $newitemDescription)
                    
                    Button(action: {
//                        let lastID = todoItems.last!.id
//
//                        let newID = lastID + 1
//
//                        let newToDoItem = Todoitem(id: newID, description: newitemDescription, completed: false)
//
//                        todoItems.append(newToDoItem)
//
//                        newitemDescription = ""
                        Task {
                            try await db!.transaction { core in
                                try core.query("INSERT INTO TodoItem (description) VALUES (?)", newitemDescription)
                            }
                            newitemDescription = ""
                        }
                        
                    }, label: {
                        Text("ADD")
                            .font(.caption)
                    })
                }
                
                .padding(20)
                
                List(todoItems.results) {currentItem in
                    
                    Label(title: {
                        Text(currentItem.description)
                    }, icon: {
                        if currentItem.completed == true {
                            Image(systemName: "checkmark.circle")
                        } else {
                            Image (systemName: "circle")
                        }
                    })
                    .onTapGesture {
                        Task {
                            try await db!.transaction { core in
                                
                                try core.query("UPDATE ToDoItem SET completed set = (?) WHERE id = (?)",
                                !currentItem.completed,
                                currentItem.id)
                            }
                        }
                    }
                }
            }
            .navigationTitle("To do")
            
        }
       
    }
    
}
        


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
        //Making the database available to other views.
               .environment(\.blackbirdDatabase, AppDatabase.instance)
    }
}
