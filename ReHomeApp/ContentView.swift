//
//  ContentView.swift
//  ReHomeApp
//
//  Created by Shivam Arora on 30/5/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var itemNameText: String = ""
    @State var descriptionText: String = ""
    var body: some View {
       
            TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                            
                    }
                
                AddItemView(descriptionText: descriptionText, itemNameText: itemNameText)
                    .tabItem {
                        Image(systemName: "plus.circle.fill")
                        Text("Add Item")
                    }
                
                MyListingsView(itemNameText: itemNameText)
                    .tabItem {
                        Image(systemName: "list.bullet")
                        Text("Listing")
                    }
            }
        }
    }

#Preview {
    ContentView(itemNameText: "", descriptionText: "")
}
