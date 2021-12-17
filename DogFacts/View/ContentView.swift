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
    
    @StateObject var doggiePic = DogImage()
    
   // @State var isSelected: Bool = false
    
   // @State var catRandom = ApiTest()
    
    var body: some View {
       
        NavigationView {
    
            
            ForEach(random.fact) { facts in
                
                VStack(alignment: .leading) {
                
                    
                    Spacer()
                    Text(facts.fact)
                        .font(.title2)
                        .padding()
                    
                    Spacer()
                    //NEXT FACT BUTTON
                    HStack(alignment: .center) {
                    Button(action: {
                        random.getPosts()
                      
                    }, label: {
//                        Image(systemName: "arrow.clockwise")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 50, height: 75)
//                            .padding()
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
//                        Button(action: actionSheet) {
//                                       Image(systemName: "square.and.arrow.up")
//                                           .resizable()
//                                           .aspectRatio(contentMode: .fit)
//                                           .frame(width: 36, height: 36)
                                            //.padding()
//                                   }
                        
                    }
                        .navigationTitle("🐶 Dogs 🐶")
                        .font(.title)
                    
                    
                
                    
                }
                    
            
            }
        }
                .navigationViewStyle(StackNavigationViewStyle())
        }
    
//    func actionSheet() {
//        guard let urlShare = URL(string: random.fact) else { return }
//           let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
//           UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
//       }
    }
        


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.light)
    }
}
