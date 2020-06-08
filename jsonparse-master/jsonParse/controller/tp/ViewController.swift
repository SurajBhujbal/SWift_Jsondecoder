//
//  ViewController.swift
//  jsonParse
//
//  Created by Apple on 05/07/19.
//  Copyright © 2019 RoxAI. All rights reserved.
//

import UIKit

struct web:Decodable {
    let name:String?
    let description: String?
    let courses:[course]
}
struct course:Decodable{
    let id: Int?
    let name:String?
    let link:String?
    let imageUrl:String?
    let number_of_lessons : Int?
}



class ViewController: UIViewController {
    
    
    @IBOutlet weak var imagview: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var lession: UILabel!
    
    
    var abc = [course]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchData1()
    }
    func fetchData1(){
        let jsonUrl = "https://api.letsbuildthatapp.com/jsondecodable/course"
        guard let url = URL(string: jsonUrl) else{return}
         URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else{return}
            
            do {
                let cour = try JSONDecoder().decode(course.self, from: data)
                self.abc.append(cour)
                DispatchQueue.main.async {
                   self.getImage()
                }
                
            }catch let jsonERR{
                print("error fatching data", jsonERR)
            }
        }.resume()
    }
    
    func getImage(){
        for data in abc{
            name.text = data.name
            lession.text = "\(data.number_of_lessons!)"
            if (data.imageUrl) != nil{
                let url = URL(string: data.imageUrl!)
                if let data = try? Data(contentsOf: url!)
                {
                    let image: UIImage = UIImage(data: data)!
                    self.imagview.image = image
                }
            }
        }
        
        
        
    }
    
    func fetchdata2(){
        let jsonUrl = "https://api.letsbuildthatapp.com/jsondecodable/courses"
        guard let url = URL(string: jsonUrl) else{return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else{return}
            do {
                let cour = try JSONDecoder().decode([course].self, from: data)
                print(cour)
                print(cour.count)
            }catch let jsonERR{
                print("error fatching data", jsonERR)
            }
            }.resume()
    }
    
    
    func fetchdata3(){
        let jsonUrl = "https://api.letsbuildthatapp.com/jsondecodable/website_description"
        guard let url = URL(string: jsonUrl) else{return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else{return}
            do {
            let descWEB = try JSONDecoder().decode(web.self, from: data)
                print(descWEB)
                for a in descWEB.courses{
                    print(a.name)
                }
            }catch let jsonERR{
                print("error fatching data:- ", jsonERR)
            }
            }.resume()
    }

    func fetchdata4(){
        let jsonUrl = "https://api.letsbuildthatapp.com/jsondecodable/courses_missing_fields"
        guard let url = URL(string: jsonUrl) else{return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else{return}
            do {
                let cour = try JSONDecoder().decode([course].self, from: data)
                print(cour)
                print(cour.count)
            }catch let jsonERR{
                print("error fatching data:- ", jsonERR)
            }
            }.resume()
    }
    
    
    func fetchData5(){
        let jsonUrl = "https://api.letsbuildthatapp.com/appstore/featured"
        guard let url = URL(string: jsonUrl) else{return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else{return}
            do {
                let jso = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                print(jso)
            }catch let jsonERR{
                print("error fatching data:- ", jsonERR)
            }
            }.resume()
        
    }
    
}

