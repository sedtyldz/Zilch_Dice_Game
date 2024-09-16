//
//  WinnerPage.swift
//  Zilch_Dice_Game
//
//  Created by Sedat Yıldız on 16.09.2024.
//

import SwiftUI

struct WinnerPage: View {
    @Binding var Winner:String
    @Binding var user1:String
    @Binding var user2:String
    @State var durum:Bool = false
    @State var main:Bool = false
    var body: some View {
        NavigationView{
            ZStack{
                ContainerRelativeShape()
                    .fill(LinearGradient(colors: [Color.blue,Color.white], startPoint: .topLeading, endPoint:.bottomTrailing))
                    .ignoresSafeArea()
                VStack{
                    
                    Text("Thank you for playing")
                        .bold()
                        .padding()
                        .font(.title)
                        .foregroundColor(.black)
                    
                    
                    Spacer()
                        .frame(height:100)
                    
                    Text("Winner is \(Winner)")
                        .bold()
                        .padding()
                        .font(.title)
                        .foregroundColor(.black)
                    
                    Image(systemName:"face.smiling")
                        .resizable()
                        .frame(width: 100,height: 100)
                        .foregroundColor(.green)
                    Spacer()
                        .frame(height:100)
                    
                    HStack{
                        Button(action:{
                            main = true
                            
                        }){
                            Text("Main Page")
                                .bold()
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.black)
                                .frame(width: 140,height: 100)
                                .background(Color.red)
                                .cornerRadius(60)
                        }
                        Spacer()
                            .frame(width:50)
                        Button(action:{
                            durum = true
                        }){
                            Text("Play Again")
                                .bold()
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.black)
                                .frame(width: 140,height: 100)
                                .background(Color.green)
                                .cornerRadius(60)
                        }
                    }
                    
                    
                    
                }
                
                
            }
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationDestination(isPresented:$main){
            ContentView()
        }
        .navigationDestination(isPresented:$durum){
          
            GamePage(user1:$user1 , user2:$user2 )
        }
    }
        
}

#Preview {
    WinnerPage(Winner:.constant("Sedat"),user1:.constant("deneme"),user2:.constant("basarılı"))
}
