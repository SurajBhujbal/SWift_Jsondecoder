//
//  TodoViewController.swift
//  jsonParse
//
//  Created by Apple on 10/07/19.
//  Copyright © 2019 RoxAI. All rights reserved.
//

import UIKit

var id:Int?
class ToDocell:UITableViewCell{
    
    @IBOutlet weak var name: UILabel!
}
class TodoViewController: UIViewController {
    var a = [todos]()
    
    @IBOutlet weak var active: UIActivityIndicatorView!
    @IBOutlet weak var todotbl: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    func getData(){
        todotbl.isHidden = true
        active.startAnimating()
        let urll = "https://jsonplaceholder.typicode.com/todos?userId=\(id!)"
        guard let url = URL(string: urll) else{return}
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            do{
                guard let data = data else{return}
                let json = try? JSONDecoder().decode([todos].self, from: data)
                self.a = json!
                DispatchQueue.main.async {
                    self.todotbl.reloadData()
                    self.todotbl.isHidden = false
                    self.active.stopAnimating()
                }
            }catch let err{
                print(err)
            }
        }.resume()
    }
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
extension TodoViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return a.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDocell", for: indexPath) as? ToDocell
        let ind = a[indexPath.row]
        cell?.name.text = ind.title
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 77
    }
}
