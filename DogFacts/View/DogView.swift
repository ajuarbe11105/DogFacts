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
           
            
            ForEach(random.fact) { facts in
                
                VStack(alignment: .center) {
               
                    
                    Text("🐶 Dogs 🐶")
                        .font(.title)
                    
                    Spacer()
                    Text(facts.fact)
                        .font(.largeTitle)
                        .padding()
                    
                    Spacer()
                    //NEXT FACT BUTTON
                    HStack(alignment: .center) {
                    Button(action: {
                        withAnimation(.spring()) {
                            random.getPosts()
                            
                        }
                      
                    }, label: {
//
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
//
                                            
                        .navigationBarItems(
                            trailing:
                                withAnimation(.spring()) {
                                NavigationLink(destination: CatView(), label: {
                                        HStack {
                                            Text("Click here for cat facts🐱")
                                        
                                    }
                                    })
                                }
                        )
                                    
                                }
                
                                }
                                               
                }
                    
            
        .navigationViewStyle(StackNavigationViewStyle())
            }
        }
        
    
//    func actionSheet() {
//        guard let urlShare = URL(string: random.fact) else { return }
//           let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
//           UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
//       }
    
        


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DogView().preferredColorScheme(.light)
    }
}
                                          
