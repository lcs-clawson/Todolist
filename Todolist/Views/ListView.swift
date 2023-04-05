//
//  ListView.swift
//  Todolist
//
//  Created by Cooper Lawson on 2023-04-03.
//

import SwiftUI

struct ListView: View {

    // MARK Stored Properties
@State var todoItems: [Todoitem] = existingToDoItems
    
    @State var newitemDescription: String = ""
    
    // MARK Computed Properties
    var body: some View {

        NavigationView {
            
            VStack {
                
                HStack {
                    
                    TextField("Enter a to-do item", text: $newitemDescription)
                    
                    Button(action: {
                        let lastID = todoItems.last!.id
                        
                        let newID = lastID + 1
                        
                        let newToDoItem = Todoitem(id: newID, description: newitemDescription, completed: false)
                        
                        todoItems.append(newToDoItem)
                        
                        newitemDescription = ""
                        
                        
                    }, label: {
                        Text("ADD")
                            .font(.caption)
                    })
                }
                
                .padding(20)
                
                List(todoItems) {currentItem in
                    Label(title: {
                        Text(currentItem.description)
                    }, icon: {
                        if currentItem.completed == true {
                            Image(systemName: "checkmark.circle")
                        } else {
                            Image (systemName: "circle")
                        }
                    })
                }
                
            }
            .navigationTitle("To do")
            
        }
       
    }
    
}
        


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
