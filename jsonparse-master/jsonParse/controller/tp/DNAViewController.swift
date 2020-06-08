//
//  DNAViewController.swift
//  jsonParse
//
//  Created by Apple on 09/07/19.
//  Copyright © 2019 RoxAI. All rights reserved.
//

import UIKit

class DNAViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    func getDAta1(){
        let url = URL(string: "http://api.plos.org/search?q=title:DNA")
        URLSession.shared.dataTask(with: url!) { (data, res, err) in
            guard let data = data else{return}
            
            do {
                print(data)
                //                let js = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                let js = try? JSONDecoder().decode(Title.self, from: data)
                print(js)
            }catch let err{
                print(err)
            }
            }.resume()
    }
    func getDAta2()  {
        let url = URL(string: "https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts%7Cpageimages&exintro=&explaintext=&titles=rose&indexpageids=&redirects=1&pithumbsize=500")
        
        URLSession.shared.dataTask(with: url!) { (data, res,err ) in
            do {
                guard let dat = data else{return}
//                let json = try? JSONSerialization.jsonObject(with:dat, options: .mutableContainers)
              let json = try? JSONDecoder().decode(WikiData.self, from: data!)
                print(json)
            }
        }.resume()
    }
    
   
}
