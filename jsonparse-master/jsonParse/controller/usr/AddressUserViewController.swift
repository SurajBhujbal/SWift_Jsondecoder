//
//  AddressUserViewController.swift
//  jsonParse
//
//  Created by Apple on 08/07/19.
//  Copyright © 2019 RoxAI. All rights reserved.
//

import UIKit
import MapKit

class AddressUserViewController: UIViewController {

    
    @IBOutlet weak var street: UILabel!
    @IBOutlet weak var suite: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var zip: UILabel!
    
     @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var ttl: UINavigationItem!
    
    
    let manager = CLLocationManager()
    
    var lat:Double?
    var lang:Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ttl.title = dab[0].name
        street.text = dab[0].address.street
        suite.text = dab[0].address.suite
        city.text = dab[0].address.city
        zip.text = dab[0].address.zipcode
        
        lat = Double(dab[0].address.geo.lat!)
        lang = Double(dab[0].address.geo.lng!)
       map()
    }
    

    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
 
    func map(){
        mapView.delegate = self
        
//        guard let val: CLLocation = manager.location else {return}
        let myLocation = CLLocation(latitude: lat!, longitude: lang!)
        let regionRadius:CLLocationDistance = 1000.0
        let region = MKCoordinateRegion(center: myLocation.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        manager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        
        mapView.setRegion(region, animated: true)
    }
    
}

extension AddressUserViewController: MKMapViewDelegate{
    func mapViewWillStartRenderingMap(_ mapView: MKMapView) {
//        print("rendring")
    }
}

