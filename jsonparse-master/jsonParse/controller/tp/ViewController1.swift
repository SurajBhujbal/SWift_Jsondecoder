//
//  ViewController1.swift
//  jsonParse
//
//  Created by Apple on 05/07/19.
//  Copyright © 2019 RoxAI. All rights reserved.
//

import UIKit




class viewCell1:UITableViewCell{
    
    @IBOutlet weak var imgview: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var lession: UILabel!
    
}
class ViewController1: UIViewController {

    var abc = [course]()
   
    @IBOutlet weak var tbl: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchdata()
        
    }
    
    func fetchdata(){
        let jsonUrl = "https://api.letsbuildthatapp.com/jsondecodable/courses"
        guard let url = URL(string: jsonUrl) else{return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else{return}
            do {
                let cour = try JSONDecoder().decode([course].self, from: data)
                print(cour)
                self.abc = cour
                DispatchQueue.main.async {
                    self.tbl.reloadData()
                }
            }catch let jsonERR{
                print("error fatching data", jsonERR)
            }
            
            }.resume()
    }
}

    extension ViewController1:UITableViewDelegate,UITableViewDataSource{
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            print(abc.count)
            return abc.count
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? viewCell1
            let index = abc[indexPath.row]
            if index.imageUrl != nil{
                let url = URL(string: index.imageUrl!)
                if let data = try? Data(contentsOf: url!)
                {
                    let image: UIImage = UIImage(data: data)!
                    cell?.imgview.image = image
                }
            }
            cell?.name.text = index.name
            let less = index.number_of_lessons
            cell?.lession.text = "\(less!)"
            return cell!
        }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 237
        }
    }


