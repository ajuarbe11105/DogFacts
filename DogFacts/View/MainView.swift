//
//  MainView.swift
//  DogFacts
//
//  Created by Alberto Juarbe on 12/17/21.
//

import SwiftUI



struct MainView: View {
    
    @State var selectedTab: Int = 0
    let icons: [String] = [ "🐶" , "🐱"]
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            
            MainView(selectedTab: selectedTab)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                        .foregroundColor(.black)
                }
                .tag(0)
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
