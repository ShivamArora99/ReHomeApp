//
//  StoryView.swift
//  ReHomeApp
//
//  Created by Lindsey Nguyen on 4/6/2024.
//

import SwiftUI

// Define the data model
struct UserData: Identifiable{
    let id: Int
    let fullName: String
    let profilePicture: [String]
    let email: String
    let stories: String
}

//Define StoryView
struct StoryCardView: View {
    let id: Int
    @State private var currentCardIndex = 0
    @State private var Card: [UserData]
    
    init(id: Int, cards: [UserData]) {
        self.id = id
        self.Card = cards
    }
    
    var body: some View {
        NavigationStack {
            VStack{
                ZStack{
                    VStack{
                        if let profilePicture = Card[currentCardIndex].profilePicture.first {
                            Image(profilePicture)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 96)
                                .clipShape(Circle())
                            Text(Card[currentCardIndex].fullName)
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                            Text(Card[currentCardIndex].email)
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .foregroundColor(Color(red: 0.89, green: 0.59, blue: 0.48))
                                .padding(10)
                            Text(Card[currentCardIndex].stories)
                                .fontWeight(.regular)
                                .foregroundColor(Color(red: 0.19, green: 0.18, blue: 0.3))
                                .frame(width: 297, alignment:.topLeading)
                        }
                    }
                }
                .frame(width: 321, height: 485)
                .background(Color(red: 0.97, green: 20, blue: 1))
                .cornerRadius(50)
                .shadow(color: Color(red: 0.07, green: 0.05, blue: 0.19).opacity(0.54), radius: 2, x: 0, y: 4)
                HStack{
                    Button(action: {
                        // Update to next card
                        currentCardIndex = (currentCardIndex + 1) % Card.count
                    }) {
                        Image(systemName: "xmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40)
                            .foregroundColor(.white)
                            .frame(width: 89.13918, height: 89.13918)
                            .background(Circle().fill(Color(red: 0.07, green: 0.05, blue: 0.19)).shadow(color: .gray, radius: 5))
                            .padding(35)
                    }
                    NavigationLink(destination: Destination(profilePicture: Card[currentCardIndex].profilePicture.first ?? "", fullName: Card[currentCardIndex].fullName))  {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40)
                            .foregroundColor(.white)
                            .frame(width: 89.13918, height: 89.13918)
                            .background(Circle().fill(Color(red: 0.07, green: 0.05, blue: 0.19)).shadow(color: .gray, radius: 5))
                            .padding(35)
                    }
                    .navigationViewStyle(StackNavigationViewStyle())
                    .edgesIgnoringSafeArea(.all)
                }
                
            }
        }
        .onAppear{
            for(idx, element) in Card.enumerated() {
                if(element.id == id)
                {
                    //print("Index: ",idx)
                    currentCardIndex = idx
                    break
                }
            }
        }
    }
}
//Define Destination of Heart button
struct Destination: View {
    let profilePicture: String
    let fullName: String
    
    var body: some View {
        VStack {
            Spacer()
            Spacer()
            if let profileImage = UIImage(named: profilePicture) {
                Image(uiImage: profileImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 121, height: 122)
                    .clipShape(Circle())
            }
            Text(fullName)
                .font(Font.custom("Inter", size: 24)
                    .weight(.medium))
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
            Spacer()
            Spacer()
            NavigationLink(destination: Destination1(fullName: fullName)) {
                Text("Rehome")
                    .font(Font.custom("SF Pro", size: 17).weight(.semibold))
                    .foregroundColor(Color(red: 0.96, green: 0.99, blue: 0.99))
                    .frame(width: 160, height: 40, alignment: .center)
                    .background(Color(red: 0.07, green: 0.05, blue: 0.19))
                    .cornerRadius(8)
                    .shadow(color: Color(red: 0.07, green: 0.05, blue: 0.19), radius: 2, x: 0, y: 4)
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .padding(5)
            Button("Chat") {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
            }
            .font(Font.custom("SF Pro", size: 17).weight(.semibold))
            .foregroundColor(Color(red: 0.07, green: 0.05, blue: 0.19))
            .frame(width: 160, height: 40, alignment: .center)
            .cornerRadius(8)
            .overlay(RoundedRectangle(cornerRadius: 8).inset(by: 1).stroke(Color(red: 0.07, green: 0.05, blue: 0.19), lineWidth: 2))
            Spacer()
            Spacer()
            Spacer()
            Spacer()
        }
        .padding()
        
    }
}

//Define Destination of ReHome button
struct Destination1: View {
    let fullName: String
    @EnvironmentObject var dataProvider: DataProvider
    @State private var isHomeViewActive = false
    
    var body: some View {
        VStack {
            Spacer()
            Spacer()
            Text("Approval message sent for \(fullName)’s Story")
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 0.19, green: 0.18, blue: 0.3))
                .frame(width: 335, height: 75, alignment: .top)
            Spacer()
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 253, height: 253)
                .background(
                    Image("Done")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                )
            Spacer()
            Button("Back to Home") {
                isHomeViewActive = true
            }
            .font(Font.custom("SF Pro", size: 17).weight(.semibold))
            .foregroundColor(Color(red: 0.96, green: 0.99, blue: 0.99))
            .frame(width: 160, height: 40, alignment: .center)
            .background(Color(red: 0.07, green: 0.05, blue: 0.19))
            .cornerRadius(8)
            .shadow(color: Color(red: 0.07, green: 0.05, blue: 0.19), radius: 2, x: 0, y: 4)
            .padding(5)
            .navigationDestination(isPresented: $isHomeViewActive) {
                HomeView()
                    .environmentObject(dataProvider)
            }
            
            Spacer()
            Spacer()
            Spacer()
            Spacer()
        }
        .padding()
        
    }
}

//Define Preview
#Preview {
    StoryCardView(id: 1, cards: [
        UserData(id: 1, fullName: "Helena Hills", profilePicture: ["Helena"], email: "helena.hills@student.uts.edu.au", stories: "“I'm a new Marketing student at UTS and came across your headphone listing. The color and features are exactly what I'm looking for! As I embark on my academic journey, having a reliable pair of headphones is essential for my coursework and study sessions. Could we discuss the possibility of me acquiring them from you?“"),
        UserData(id: 2, fullName: "Varun Bhatia", profilePicture: ["Varun"], email: "varun.bhatia@student.uts.edu.au", stories: "I just commenced my first semester at UTS and need a headphone for my Marketing degree. Will be appreciate if I can receive it from someone. Really like the color and function of your headphone.“"),
        UserData(id: 3, fullName: "Carina Morente", profilePicture: ["Carina"], email: "carina.morente@student.uts.edu.au", stories: "I just commenced my first semester at UTS and need a headphone for my Marketing degree. Will be appreciate if I can receive it from someone. Really like the color and function of your headphone.“"),
        UserData(id: 5, fullName: "Charles Brown", profilePicture: ["Charles"], email: "charles.brown@student.uts.edu.au", stories: "I need this because..."),
        UserData(id: 6, fullName: "Wang Lee", profilePicture: ["Wang"], email: "wang.lee@student.uts.edu.au", stories: "I need this because...")
    ])
}