//
//  ContentView.swift
//  DogFacts
//
//  Created by Alberto Juarbe on 12/15/21.
//

import SwiftUI

struct DogView: View {
    
    @StateObject var random = RandomDog()
    @Environment(\.colorScheme) var colorScheme
    
    @StateObject var doggiePic = DogImage()
    
    var body: some View {
        
        
        NavigationView {
            ZStack {
                Color.green
                    .ignoresSafeArea()
                
                
                ForEach(random.fact) { facts in
                    
                    VStack(alignment: .center) {
                        
                        
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.white)
                            .shadow(color: .blue, radius: 25)
                        
                            .padding()
                            .overlay(
                                Text(facts.fact)
                                    .font(.largeTitle)
                                    .foregroundColor(.black)
                                    .padding()
                                    .padding()
                                
                                
                            )
                        
                        Spacer()
                        
                        //NEXT FACT BUTTON
                        HStack(alignment: .center) {
                            
                            Button(action: {
                                random.getPosts()
                                
                                
                                
                            }, label: {
                                
                                Text("Next Dog Fact")
                                
                                    .bold()
                                    .font(.title3)
                                    .frame(width: 280, height: 50, alignment: .center)
                                    .background(Color(.systemBlue))
                                    .foregroundColor(.white)
                                    .cornerRadius(15)
                                //.frame(width: 300, height: 300)
                                    .padding(60)
                                
                            })
                            
                            
                            
                        }
                        
                        
                        .navigationBarItems(
                            trailing:
                                NavigationLink(destination: CatView(), label: {
                                    
                                    HStack {
                                        Text("🐱 Cat Facts 🐱")
                                            .foregroundColor(.black)
                                        
                                    }
                                })
                            
                        )
                        
                    }
                    .navigationTitle("🐶 Dogs 🐶")
                    
                }
            }
            
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DogView().preferredColorScheme(.light)
    }
}

