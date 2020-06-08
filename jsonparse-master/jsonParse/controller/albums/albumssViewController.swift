//
//  albumssViewController.swift
//  jsonParse
//
//  Created by Apple on 08/07/19.
//  Copyright © 2019 RoxAI. All rights reserved.
//

import UIKit
class albumssViewCell :UITableViewCell{
    @IBOutlet weak var LblTitle: UILabel!
}

class albumssViewController: UIViewController {

    @IBOutlet weak var albTBL: UITableView!
    @IBOutlet weak var active: UIActivityIndicatorView!
    
    var jsom = [albms]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataFromJSON()
    }
    
    func getDataFromJSON(){
        albTBL.isHidden = true
        active.isHidden = false
        active.startAnimating()
    let urlString = "https://jsonplaceholder.typicode.com/albums"
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { (data, response, err) in
            guard let data = data else {return}
            do{
                let json = try JSONDecoder().decode([albms].self, from: data)
               self.jsom = json
                DispatchQueue.main.async {
                    self.albTBL.reloadData()
                    self.albTBL.isHidden = false
                    self.active.isHidden = true
                    self.active.stopAnimating()
                }
            }catch let error{
                print(error)
            }
        }.resume()
    }

}
extension albumssViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jsom.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ind = jsom[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "albumssViewCell", for: indexPath) as? albumssViewCell
        cell?.LblTitle.text = ind.title
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ind = jsom[indexPath.row]
        let story = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "photosViewController") as? photosViewController
        vc?.ID = ind.id
        present(vc!, animated: true, completion: nil)
    }
}
