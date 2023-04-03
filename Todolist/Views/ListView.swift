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
                    
                    TextField("Enter a to-do item", text: Binding.constant(""))
                    
                    Button(action: {
                    }, label: {
                        Text("ADD")
                            .font(.caption)
                    })
                }
                .padding(20)
                
                List(existingToDoItems) { currentItem in
                    
                    }
                    }
                }
            }
        }


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
