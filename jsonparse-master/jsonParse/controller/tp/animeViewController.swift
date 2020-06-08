//
//  animeViewController.swift
//  jsonParse
//
//  Created by Apple on 09/07/19.
//  Copyright © 2019 RoxAI. All rights reserved.
//

import UIKit

class animViewCell:UITableViewCell{
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var LbL: UILabel!
    
}

class animeViewController: UIViewController {

    
    @IBOutlet weak var activ: UIActivityIndicatorView!
    @IBOutlet weak var anTbl: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
 

}
extension animeViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "animViewCell", for: indexPath) as? animViewCell
      
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 86
    }
}
