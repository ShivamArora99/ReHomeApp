import PhotosUI
import SwiftUI

struct ListingView: View {
    @State var itemNameText: String
    @State var Item = []
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            Button(action: {
                // Action to remove this listing
            }) {
                Image(systemName: "multiply.circle")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundStyle(Color(red: 0.71, green: 0.71, blue: 0.71))
            }

            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 50, height: 50)
                .background(
                    Image("IMG_9866")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)

                )
                .cornerRadius(5)

            Text(itemNameText)
                .font(
                    Font.custom("SF Pro", size: 23)
                        .weight(.medium)
                )
                .foregroundColor(.black)
                .frame(width: 160, alignment: .topLeading)
            
            VStack{
                Text("#")
                Image(systemName: "ellipsis.message")
            }

            NavigationLink(destination: EditItemView(descriptionText: "", itemNameText: itemNameText)) {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 70, height: 50)
                        .foregroundStyle(Color(red: 0.03, green: 0.49, blue: 0.55))
                    Text("Edit")
                        .font(
                            Font.custom("SF Pro", size: 23)
                                .weight(.bold)
                        )
                        .foregroundStyle(Color(red: 0.96, green: 0.99, blue: 0.99))
                }
            }
        }
        .frame(height: 70)
        .padding(.horizontal)
    }
}

struct MyCategories: View {
    var body: some View {
        VStack {
            Rectangle()
                .frame(height: 10)
                .foregroundStyle(.clear)
            HStack {
                Spacer()
                Text("Category")
                    .font(
                        Font.custom("SF Pro", size: 25)
                            .weight(.bold)
                    )
                    .foregroundColor(Color(red: 0.19, green: 0.18, blue: 0.3))
                Spacer(minLength: 250)
            }
        }
    }
}

struct MyListingsView: View {
    @State var itemNameText: String

    var body: some View {
        NavigationStack {
                VStack(spacing: 10) {
                    Spacer()
                    Text("My Listings")
                        .font(
                            Font.custom("SF Pro", size: 25)
                                .weight(.semibold)
                        )
                        .foregroundColor(.black)
                    ScrollView {
                    MyCategories()
                    
                    ListingView(itemNameText: itemNameText)
                    ListingView(itemNameText: itemNameText)
                    ListingView(itemNameText: itemNameText)
                    
                    MyCategories()
                    
                    ListingView(itemNameText: itemNameText)
                    ListingView(itemNameText: itemNameText)
                    
                    MyCategories()
                    
                    ListingView(itemNameText: itemNameText)
                    ListingView(itemNameText: itemNameText)
                }
                .padding()

            }

        }
    }
}

#Preview {
    MyListingsView(itemNameText: "Sample Item")
}
