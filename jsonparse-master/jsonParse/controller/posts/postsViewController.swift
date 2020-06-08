//
//  postsViewController.swift
//  jsonParse
//
//  Created by Apple on 08/07/19.
//  Copyright © 2019 RoxAI. All rights reserved.
//

import UIKit



class postViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var bodyLbl: UILabel!
    
    
}

class postsViewController: UIViewController {

    
    @IBOutlet weak var postTbl: UITableView!
    
    @IBOutlet weak var active: UIActivityIndicatorView!
    
    
    var abc = [postdata]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonParse()
        
    }
    
    func jsonParse(){
        postTbl.isHidden = true
        active.isHidden = false
        active.startAnimating()
        let StingUrl = "https://jsonplaceholder.typicode.com/posts"
        
       guard let url = URL(string: StingUrl) else{return}
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let da = data else{return}
            do{
                let json = try JSONDecoder().decode([postdata].self, from: da)
               // print(json)
                self.abc = json
                DispatchQueue.main.async {
                    self.postTbl.reloadData()
                    self.postTbl.isHidden = false
                    self.active.isHidden = true
                    self.active.stopAnimating()
                }
            }catch let error{
                print(error)
            }
            
        }.resume()
    }
    
    

}
extension postsViewController :UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return abc.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? postViewCell
        let index = abc[indexPath.row]
        cell?.bodyLbl.text = index.body
        cell?.titleLbl.text = index.title
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 134
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ind = abc[indexPath.row]
        let story = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "CommentsPostViewController") as? CommentsPostViewController
        vc!.postID = ind.id
        present(vc!, animated: true, completion: nil)
    }
}
