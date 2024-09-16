//
//  ContentView.swift
//  Zilch_Dice_Game
//
//  Created by Sedat Yıldız on 15.09.2024.
//

import SwiftUI



struct myText: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View{
        configuration
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.blue,lineWidth: 5)
            )
    }
    
}

struct ContentView: View {
    @State var user1:String = ""
    @State var user2:String = ""
    @State var durum:Bool = false
    var body: some View {
        NavigationStack{
            ZStack{
                ContainerRelativeShape()
                    .fill(LinearGradient(colors: [Color.white,Color.blue],startPoint: .topLeading, endPoint: .bottomTrailing))
                    .ignoresSafeArea()
                
                VStack(spacing:10){
                   
                    Text("Zilch Dice Game")
                        .font(.title)
                        .bold()
                        .padding()
                        .foregroundColor(.black)
                    

                    TextField("User1", text: $user1)
                        .padding()
                        .bold()
                        .font(.title)
                        .foregroundColor(.black)
                        .textFieldStyle(myText())
                        
                    TextField("User2", text: $user2)
                        .padding()
                        .bold()
                        .font(.title)
                        .foregroundColor(.black)
                        .textFieldStyle(myText())
                    Spacer()
                        .frame(height:40)
                    Button(action:{
                        if check(user1: user1, user2: user2){
                            durum = true
                            
                        }
                    }){
                        Text("Start The Game")
                            .frame(width: 130,height: 20)
                            .padding()
                            .background(Color.purple)
                            .foregroundColor(.white)
                            .cornerRadius(20.0)
                    }
                    Spacer()
                    
                    
                    Image("bg")
                        .resizable()
                        .frame(width: 200,height: 200,alignment: .center)
                        
                    Spacer()
                    
                    
                    
                }
                .navigationBarBackButtonHidden(true)
                .padding()
                .navigationDestination(isPresented: $durum){
                    GamePage(user1:$user1, user2:$user2)
                };
               
                
               
                
            }
            .preferredColorScheme(.light)
            
        }
        
        
        
       
    }

    func check(user1:String,user2:String)->Bool{
        if user1 != "" && user2 != "" {
            if user1 != user2 {
                return true
                
            }
            return false
        }
        else{
            return false
        }
    }
        
}
    

#Preview {
    ContentView()
}
