//
//  basicUserViewController.swift
//  jsonParse
//
//  Created by Apple on 08/07/19.
//  Copyright © 2019 RoxAI. All rights reserved.
//

import UIKit
var dab = [adata]()
class basicUserViewController: UIViewController {

    
    @IBOutlet weak var ttl: UINavigationItem!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var phn: UILabel!
    @IBOutlet weak var webs: UILabel!
    @IBOutlet weak var cname: UILabel!
    @IBOutlet weak var cp: UILabel!
    @IBOutlet weak var bs: UILabel!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
       
        fillDatainLabel()
    }
    func fillDatainLabel(){
        ttl.title = dab[0].name
        name.text = dab[0].name
        username.text = dab[0].username
        email.text = dab[0].email
        phn.text = dab[0].phone
        webs.text = dab[0].website
        cname.text = dab[0].company.name
        cp.text = dab[0].company.catchPhrase
        bs.text = dab[0].company.bs
        
    }
    
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
