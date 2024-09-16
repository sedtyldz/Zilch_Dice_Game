//
//  GamePage.swift
//  Zilch_Dice_Game
//
//  Created by Sedat Yıldız on 15.09.2024.
//

import SwiftUI

struct GamePage: View {
    @Binding var user1:String
    @Binding var user2:String
    @State var user1score:Int = 0
    @State var user2score:Int = 0
    @State var dice1:Int = 0
    @State var dice2:Int = 0
    @State var sıra:Int = 1
    @State var winner:String = ""
    @State var durum:Bool = false
    var body: some View {
        NavigationView{
        ZStack{
            ContainerRelativeShape()
                .fill(LinearGradient(colors: [Color.blue,Color.white], startPoint:.topLeading, endPoint: .bottomTrailing))
                .ignoresSafeArea()
            
            VStack{
                
                Text("Zilch Dice Game")
                    .font(.title)
                    .bold()
                    .padding()
                    .foregroundColor(.black)
                
                
                HStack{
                    Text(user1)
                        .bold()
                        .font(.title)
                        .frame(width:130,height: 50)
                        .background(sıra == 1 ? Color.green : Color.gray)
                    Spacer()
                        .frame(width: 40)
                    
                    Text(user2)
                        .bold()
                        .font(.title)
                        .frame(width:130,height: 50)
                        .background(sıra == -1 ? Color.green : Color.gray)
                    
                    
                }
                .padding()
                
                HStack{
                    Text(user1score.description)
                        .bold()
                        .font(.title)
                        .frame(width:130,height: 50)
                    
                    Spacer()
                        .frame(width: 40)
                    
                    Text(user2score.description)
                        .bold()
                        .font(.title)
                        .frame(width:130,height: 50)
                    
                    
                    
                }
                .padding()
                HStack{
                    if sıra == 1{
                        
                        Image(systemName: "arrow.up")
                            .resizable()
                            .frame(width: 40,height: 40)
                        Spacer()
                            .frame(width:170)
                        
                    }
                    else{
                        Spacer()
                            .frame(width:170)
                        Image(systemName: "arrow.up")
                            .resizable()
                            .frame(width: 40,height: 40)
                        
                    }
                }
                
                
                Spacer()
                    .frame(height: 100)
                
                
                HStack{
                    Image(String(dice1))
                        .resizable()
                        .frame(width: 100,height: 100)
                    Image(String(dice2))
                        .resizable()
                        .frame(width: 100,height: 100)
                    
                    
                }
                Spacer()
                    .frame(height:50)
                
                
                Button(action:{
                    rolldice()
                    update(toplam: dice1+dice2 , sıra: sıra)
                    let deger = (sıra==1 ? user1score : user2score)
                    let final = gamefinish(score: deger)
                    if final {
                        if sıra==1{
                            self.winner = user1
                        }
                        else{
                            self.winner = user2
                        }
                        self.durum = true
                        
                    }
                    usleep(500000)

                    sıra *= -1
                    
                    
                }){
                    Text("Roll")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                        .padding(.vertical,10)
                        .padding(.horizontal,10)
                        .frame(width:120,height: 80)
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .clipShape(.capsule)
                        
                }
            }
            .navigationBarBackButtonHidden(true)
           
            .onAppear(perform: {
                user1score = 0
                user2score = 0
                let randomInt = Int.random(in: 0..<100)
                if randomInt % 2 == 0 {
                    sıra = 1
                }
                else{
                    sıra = -1
                }
            })
            
        }
    }
        .navigationBarBackButtonHidden(true)
        .navigationDestination(isPresented: $durum){
            WinnerPage(Winner: $winner,user1:$user1,user2: $user2 )
        }
        
        
        
    }
    
    
    // functions
    
    

    func rolldice(){
        self.dice1 = Int.random(in: 1..<7)
        self.dice2 = Int.random(in: 1..<7)
        
    }
    
    func update(toplam:Int,sıra:Int){
        if sıra == 1{
            if toplam == 7 {
                self.user1score = 0
            }
            else{
                self.user1score += toplam
                
            }
            
        }
        else if sıra == -1{
            if toplam == 7 {
                self.user2score = 0
            }
            else{
                self.user2score += toplam
            }
            
            
        }
    }
    func gamefinish(score:Int) -> Bool{
        if score>=70{
            return true
        }
        else{
            return false
        }
            
    }
    
}

#Preview {
    GamePage(user1: .constant("name1"), user2: .constant("name2"))
}
