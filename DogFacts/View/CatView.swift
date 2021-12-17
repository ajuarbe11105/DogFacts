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
            
            ForEach(cat.cat) { catFact in
                
                VStack(alignment: .center) {
                    
                    Spacer()
                    
                    Text(catFact.fact)
                        .font(.title2)
                        .padding()
                    
                    Spacer()
                    
                    HStack(alignment: .center) {
                        Button(action: {
                            cat.getCatPosts()
                        }, label: {
                            Text("Next Cat Fact")
                                .bold()
                                .font(.title3)
                                .frame(width: 280, height: 50, alignment: .center)
                                .background(Color(.systemBlue))
                                .foregroundColor(.white)
                                .cornerRadius(15)
                                .padding(60)
                        })
                    }
                    .navigationTitle("🐱 Cats 🐱")
                    .font(.title)
                }
                
        }
        }
    }
        
    }


struct CatView_Previews: PreviewProvider {
    static var previews: some View {
        CatView()
    }
}
