//
//  UsersViewController.swift
//  jsonParse
//
//  Created by Apple on 08/07/19.
//  Copyright © 2019 RoxAI. All rights reserved.
//

import UIKit

class userViewCell: UITableViewCell {
    
}

class UsersViewController: UIViewController {

    var abc = [adata]()
    
    
    @IBOutlet weak var usrTBL: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FetchJSON()
    }
    func FetchJSON(){
        let urlString = "https://jsonplaceholder.typicode.com/users"
        guard let url = URL(string: urlString) else{return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let bdata = data else{return}
            do {
                let cour = try JSONDecoder().decode([adata].self, from: bdata)
                self.abc = cour
                DispatchQueue.main.async {
                    self.usrTBL.reloadData()
                }
            
            }catch let jsonERR{
                print("error fatching data:- ", jsonERR)
            }
            }.resume()
    }

}

extension UsersViewController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return abc.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let inf = abc[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "userViewCell", for: indexPath) as? userViewCell
        cell?.textLabel?.text = inf.name
        cell?.textLabel?.textColor = UIColor.red
        cell?.textLabel?.textAlignment = .center
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let story = UIStoryboard.init(name: "Main", bundle: nil)
        let ind = abc[indexPath.row]
        let vc = story.instantiateViewController(withIdentifier: "tab")
        dab = [ind]
        id = ind.id
        present(vc, animated: true, completion: nil)
    }
}

