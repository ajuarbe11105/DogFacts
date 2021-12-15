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
    
    var body: some View {
       
        NavigationView {
        List{
            ForEach(random.fact) { facts in
                VStack(alignment: .leading) {
                    Text(facts.fact)
                        .font(.headline)
                       // .background(Color(UIColor.systemBackground))
                        
                    
                }
            }
        } .navigationTitle("🐶 Dog Facts 🐶")
                .navigationViewStyle(StackNavigationViewStyle())
        }
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.light)
    }
}
