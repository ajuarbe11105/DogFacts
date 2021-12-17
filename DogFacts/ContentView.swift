//
//  ContentView.swift
//  DogFacts
//
//  Created by Alberto Juarbe on 12/15/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var random = RandomDog()
    @Environment(\.colorScheme) var colorScheme
    @State var isSelected: Bool = false
    
    var body: some View {
       
        NavigationView {
        //List{
            ForEach(isSelected ? random.fact : random.fact) { facts in
                VStack(alignment: .leading) {
                    
                    
                    Toggle("Select Dog or Cat", isOn: $isSelected)
                    
                        .font(.title2)
                        .foregroundColor(isSelected ? .blue : .red)
                        .padding()
                  //  Text(isSelected ? "Cat" : "Dog")
                    Spacer()
                    Text(facts.fact)
                        .font(.title2)
                        .padding()
                    
                    Spacer()
                    //NEXT FACT BUTTON
                    Button(action: {
                        random.getPosts()
                    }, label: {
                        //Image(systemName: "arrow.clockwise")
                        Text("Next Dog Fact")
                        
                            .bold()
                            .font(.title3)
                            .frame(width: 280, height: 50)
                            .background(Color(.systemBlue))
                            .foregroundColor(.white)
                            .cornerRadius(15)
                        //.frame(width: 300, height: 300)
                            .padding(60)
                    })
                        .navigationTitle(isSelected ? "🐶 Dog 🐶" : "🐱 Cat 🐱")
                        .font(.title)
                }
                    
            
            }
        }
                .navigationViewStyle(StackNavigationViewStyle())
        }
    }
        


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.light)
    }
}
