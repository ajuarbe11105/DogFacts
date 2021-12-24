//
//  CatView.swift
//  DogFacts
//
//  Created by Alberto Juarbe on 12/17/21.
//

import SwiftUI



struct CatView: View {
    
    @StateObject var cat = RandomCat()

    
    var body: some View {
        
        NavigationView {
            
            ZStack {
            
//                Color.green
//                    .ignoresSafeArea()
//                
                
            ForEach(cat.cat) { catFact in
                
                VStack(alignment: .center) {
                    
                    
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.white)
                        .shadow(color: .purple, radius: 10)
                        
                        .padding()
                        .overlay(
                    Text(catFact.fact)
                        .font(.largeTitle)
                        .foregroundColor(.black)
                        .padding()
                        .padding()
                    )
                    Spacer()
                    
                    HStack(alignment: .center) {
                        Button(action: {
                
                            cat.getCatPosts()
                        }, label: {
                            Text("Next Cat Fact")
                                .bold()
                                .font(.title3)
                                .frame(width: 280, height: 50, alignment: .center)
                                .background(Color(.systemPurple))
                                .foregroundColor(.white)
                                .cornerRadius(15)
                                .padding(60)
                        })
                    }
                    .navigationTitle("🐱 Cats 🐱")
                    .font(.title)
                }
                
        }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
        
    }

}
struct CatView_Previews: PreviewProvider {
    static var previews: some View {
        CatView()
    }
}
