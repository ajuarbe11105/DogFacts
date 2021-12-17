//
//  CatDownloadModel.swift
//  DogFacts
//
//  Created by Alberto Juarbe on 12/16/21.
//

import SwiftUI

class RandomCat: ObservableObject {
    
    @Published var cat: [CatFactModel] = []
    
    init() {
        getCatPosts()
        
    }
    
    
    
    func getCatPosts() {
        
        guard let url = URL(string: "https://catfact.ninja/fact") else { return } //We got this url from /post1 from jsonplaceholder
        
        downloadData(fromURL: url) { (returnedData) in
            if let data = returnedData {
                guard let newPosts = try? JSONDecoder().decode(CatFactModel.self, from: data) else { return }
                DispatchQueue.main.async { [weak self] in
                    self?.cat = [newPosts]
                    
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
