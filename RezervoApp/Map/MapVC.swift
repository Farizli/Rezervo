//
//  MapVC.swift
//  RezervoApp
//
//  Created by Ali  Farizli  on 15.03.23.
//

import UIKit
import MapKit

class MapVC: UIViewController {
    
    
    
    @IBOutlet weak var topView: UIView! {
        didSet {
            topView.layer.cornerRadius = 20
            topView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        }
    }
    @IBOutlet weak var map: MKMapView! {
        didSet {
            map.delegate = self
            map.showsUserLocation = true
        }
    }
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    
    let bakuLocation = CLLocationCoordinate2D(latitude: 40.4093, longitude: 49.8671)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        map.centerCoordinate = bakuLocation
        // Do any additional setup after loading the view.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MapVC: MKMapViewDelegate {
    
}
