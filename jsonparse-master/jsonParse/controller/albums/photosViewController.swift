//
//  photosViewController.swift
//  jsonParse
//
//  Created by Apple on 08/07/19.
//  Copyright © 2019 RoxAI. All rights reserved.
//

import UIKit
class photosViewCell: UICollectionViewCell {
    @IBOutlet weak var lbl:UILabel!
    @IBOutlet weak var imgview: UIImageView!
    
}
class photosViewController: UIViewController {

    @IBOutlet weak var coll: UICollectionView!
    @IBOutlet weak var active: UIActivityIndicatorView!
    
    var ID :Int!
    var jsom = [photoss]()
    var img = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDataFromJSON()
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func fetchDataFromJSON(){
        coll.isHidden = true
        active.isHidden = false
        active.startAnimating()
        let id = "\(ID!)"
        let stringUrl =  "https://jsonplaceholder.typicode.com/photos?albumId=" + id
        let url = URL(string: stringUrl)
        URLSession.shared.dataTask(with: url!) { (data, response, err) in
            do{
                let json = try JSONDecoder().decode([photoss].self, from: data!)
                self.jsom = json
                DispatchQueue.main.async {
                    self.getImage()
                    self.coll.reloadData()
                    self.coll.isHidden = false
                    self.active.isHidden = true
                    self.active.stopAnimating()
                }
            }catch let error {
                print(error)
            }
        }.resume()
        
    }
    
   
    func getImage(){
        for inf in jsom{
             let url = URL(string: inf.url)
            if let data = try? Data(contentsOf: url!)
            {
                let image:UIImage = UIImage(data: data)!
                img.append(image)
            }
        }
    }
    

}
extension photosViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return jsom.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photosViewCell", for: indexPath) as? photosViewCell
        let inf = jsom[indexPath.item]
        let im = img[indexPath.row]
        cell?.lbl.text = inf.title
        cell?.imgview.image = im
        
        cell?.imgview.image
        
        return cell!
    }
}
