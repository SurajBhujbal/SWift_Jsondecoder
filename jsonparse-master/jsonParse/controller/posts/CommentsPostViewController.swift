//
//  CommentsPostViewController.swift
//  jsonParse
//
//  Created by Apple on 08/07/19.
//  Copyright © 2019 RoxAI. All rights reserved.
//

import UIKit
class CommentsPostCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var body: UILabel!
    
}
class CommentsPostViewController: UIViewController {

    
    @IBOutlet weak var CommentsPostTBL: UITableView!
    @IBOutlet weak var active: UIActivityIndicatorView!
    var postID:Int!
    var da = [com]()
    override func viewDidLoad() {
        super.viewDidLoad()
        GetJSONdata()
    }
  
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func GetJSONdata(){
        CommentsPostTBL.isHidden = true
        active.isHidden = false
        active.startAnimating()
        let id = "\(postID!)"
        let urlString = "https://jsonplaceholder.typicode.com/comments?postId=" + id
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { (data, response, err) in
            guard let data = data else{return}
            do{
                let json = try JSONDecoder().decode([com].self, from: data)
                self.da = json
                DispatchQueue.main.async {
                    self.CommentsPostTBL.reloadData()
                    self.CommentsPostTBL.isHidden = false
                    self.active.isHidden = true
                    self.active.stopAnimating()
                }
            }catch let error{
                print(error)
            }
        }.resume()
    }
}
extension CommentsPostViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return da.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentsPostCell", for: indexPath) as? CommentsPostCell
        let index = da[indexPath.row]
        cell?.body.text = index.body
        cell?.name.text = index.name
        cell?.email.text = index.email
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 177
    }
}
