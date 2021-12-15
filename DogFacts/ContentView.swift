//
//  ContentView.swift
//  DogFacts
//
//  Created by Alberto Juarbe on 12/15/21.
//

import SwiftUI

struct FactModel: Identifiable, Codable {
    let id = UUID()
    let fact: String
}


class RandomDog: ObservableObject {
    
    @Published var fact: [FactModel] = []
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        
        guard let url = URL(string: "https://dog-facts-api.herokuapp.com/api/v1/resources/dogs/all") else { return } //We got this url from /post1 from jsonplaceholder
        
        downloadData(fromURL: url) { (returnedData) in
            if let data = returnedData {
                guard let newFacts = try? JSONDecoder().decode([FactModel].self, from: data) else { return }
                DispatchQueue.main.async { [weak self] in
                    self?.fact = newFacts
                    
                }
            }else {
                print("No data returned")
            }
        }
    }
    
    func downloadData(fromURL url: URL, completionHandler: @escaping (_ data: Data?) -> ()) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in //Check if there is data, check if there is a response, check that there are no errors. This sets up the task. But it wont start until we get to resume
            //All the checks to ensure we have the data... Once the checks have been completed, you can merge like this:
            
         guard
            let data = data,
                error == nil,
                let response = response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
                print("Error downloading data.")
                completionHandler(nil)
                return
            }
            
            completionHandler(data)
            
        }.resume()
    }
                          }



    



struct ContentView: View {
    
    @StateObject var random = RandomDog()
    var body: some View {
        NavigationView {
        List{
            ForEach(random.fact) { facts in
                VStack(alignment: .leading) {
                    Text(facts.fact)
                        .font(.headline)
                        .foregroundColor(.black)
                    
                }
                //.frame(maxWidth: .infinity)
            }
        } .navigationTitle("🐶 Dog Facts 🐶")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
