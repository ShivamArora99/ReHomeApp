//
//  Add Item to list.swift
//  ReHomeApp
//
//  Created by Archie Osborne on 3/6/2024.
//

import SwiftUI

struct Add_Item_to_list: View {
    var body: some View {
        VStack{
            Text("Add item to list")
            Divider()
            Text("Item Name")
                .font(.title)
            ScrollView(.horizontal){
            HStack{
                    Spacer()
                    .frame(minWidth: 100)
                    Image("IMG_9867")
                        .resizable()
                        .frame(maxWidth: 200, maxHeight: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                    Spacer()
                    .frame(minWidth: 30)
                Image("IMG_9901")
                    .resizable()
                    .frame(maxWidth: 200, maxHeight: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                Spacer()
                .frame(minWidth: 30)
                    Image("Plus")
                        .resizable()
                        .frame(maxWidth: 50, maxHeight: 50)
                        .clipShape(Circle())
                    Spacer()
                }
            }
            Spacer()
                .frame(maxHeight: 50)
            Text("Description")
                .font(.title2)
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. At varius vel pharetra vel. Quis vel eros donec ac odio tempor orci dapibus ultrices. Erat pellentesque adipiscing commodo elit at imperdiet dui accumsan. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Lacus sed viverra tellus in hac. Ut placerat orci nulla pellentesque dignissim.")
                .padding(20)
            Button("ReHome") {
                
            }
            .foregroundStyle(.blue)
            .font(.title3)
         
            // Tab Bar
            Spacer()
            TabView {
            Spacer()
                    .frame(maxHeight: 50)
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }

                Text("Add Item")
                    .tabItem {
                        Image(systemName: "plus.circle.fill")
                        Text("Add Item")
                    }

                Text("Listing")
                    .tabItem {
                        Image(systemName: "list.bullet")
                        Text("Listing")
                    }
            }
            .frame(maxHeight: 80)
            
            
            
            
            
        }

        
    }
}

#Preview {
    Add_Item_to_list()
}
