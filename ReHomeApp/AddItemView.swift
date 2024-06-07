//
//  AddItemView.swift
//  ReHomeApp
//
//  Created by Archie Osborne on 4/6/2024.
//

import PhotosUI
import SwiftUI


class AddItemViewModel: ObservableObject {
    @Published var descriptionText: String = ""
    @Published var itemNameText: String = ""
    @Published var pickerItems: [PhotosPickerItem] = []
    @Published var selectedImages: [Image] = []
}



struct AddItemView: View {
    @State var descriptionText: String
    @State var itemNameText: String
    @State var pickerItems = [PhotosPickerItem]()
    @State var selectedImages = [Image]()
    @StateObject private var viewModel = AddItemViewModel()
    @State private var isSheetPresented = false
    
    
    
    
    
    
    func addItem() {
        _ = Item(id: UUID().uuidString, itemName: itemNameText, description: descriptionText, imageName: "", categoryId: "", ownerId: "")
    }
    
    var body: some View {
        
        NavigationStack{
            VStack(spacing: 10) {
                Text("Add item to list")
                    .padding()
                Divider()
                
                TextField("Name item", text: $viewModel.itemNameText)
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                PhotosPicker("Select images", selection: $pickerItems, matching: .images)
                    .padding()
                    .foregroundStyle(Color(red: 0.03, green: 0.49, blue: 0.55))
                
                ScrollView(.horizontal) {
                    HStack {
                        if selectedImages.isEmpty {
                            Rectangle()
                                .frame(width: 45, height: 250)
                                .foregroundStyle(.clear)
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(.systemGray6))
                                .frame(width: 250, height: 250)
                                .overlay(Text("No Images Selected")
                                    .foregroundColor(.black)
                                    .font(.subheadline))
                        } else {
                            ForEach(0..<selectedImages.count, id: \.self) { i in
                                selectedImages[i]
                                    .resizable()
                                    .frame(width: 250, height: 250)
                                    .cornerRadius(10)
                            }
                        }
                    }
                }
                .onChange(of: pickerItems) {
                    Task {
                        selectedImages.removeAll()
                        
                        for item in pickerItems {
                            if let loadedImage = try await item.loadTransferable(type: Image.self) {
                                selectedImages.append(loadedImage)
                            }
                        }
                    }
                }
                
                HStack {
                    Spacer()
                    Text("Description")
                        .font(.title2)
                    Spacer(minLength: 235)
                }
                .padding(.top)
                
                TextField("Add description here", text: $descriptionText)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                Rectangle()
                    .frame(width: 300, height:10)
                    .foregroundStyle(.clear)
                HStack{
                    NavigationLink{
                        HomeView()
                    }
                label: {
                    Text("Cancel")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(red: 0.71, green: 0.71, blue: 0.71))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                    Button(action: {
                        addItem();
                        isSheetPresented.toggle()
                    })
                    {
                        Text("Rehome")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(red: 0.03, green: 0.49, blue: 0.55))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                }
                .frame(width: 330)
                .sheet(isPresented: $isSheetPresented) {
                    SheetView()
                        
                }
                Rectangle()
                    .frame(width: 300, height:20)
                    .foregroundStyle(.clear)
            }
            .padding()
            .frame(width: 393, height: 852)

        }
    }
}


struct Item: Identifiable {
    let id: String
    let itemName: String
    let description: String
    let imageName: String
    let categoryId: String
    let ownerId: String
}




struct SheetView: View {
    var body: some View {
        NavigationStack{
            VStack(spacing: 20){
                Rectangle()
                    .foregroundStyle(.clear)
                    .frame(maxHeight: 10)
                Image(systemName: "chevron.compact.down")
                    .resizable()
                    .frame(width: 60, height: 15)
                Spacer()
                Text("Congratulations!")
                    .font(.title)
                Text("Item added to your list.")
                    .font(.subheadline)
                NavigationLink{
                    MyListingsView(itemNameText: "")
                }
            label: {
                Text("My Listings")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding()
                    .frame(width: 300)
                    .background(Color(red: 0.03, green: 0.49, blue: 0.55))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                
            }
                Spacer()
            }
        }
    }
}



#Preview {
    
    
    AddItemView(descriptionText: "", itemNameText: "")
    
}
////
//
//class AddItemViewModel: ObservableObject {
//    // Other properties and methods...
//
//    // Save item to the database
//    func saveItem() {
//        let newItem = Item(id: UUID().uuidString, itemName: itemNameText, description: descriptionText, imageName: "", categoryId: "", ownerId: "")
//        // Call database save operation
//        // Example: DatabaseManager.shared.save(item: newItem)
//    }
//
//    // Retrieve items from the database
//    func retrieveItems() -> [Item] {
//        // Call database retrieve operation
//        // Example: return DatabaseManager.shared.retrieveItems()
//        return []
//    }
//
//    // Update item in the database
//    func updateItem(_ item: Item) {
//        // Call database update operation
//        // Example: DatabaseManager.shared.update(item: item)
//    }
//
//    // Delete item from the database
//    func deleteItem(_ item: Item) {
//        // Call database delete operation
//        // Example: DatabaseManager.shared.delete(item: item)
//    }
//}
