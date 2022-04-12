//
//  LocationDetailsViewController.swift
//  Oceans 8 MC 1
//
//  Created by Haris Fadhilah on 06/04/22.
//

import UIKit
import MapKit

class LocationDetailsViewController: UIViewController {

    @IBOutlet weak var nameLocation: UILabel!
    @IBOutlet weak var descLocation: UILabel!
    @IBOutlet weak var hourLocation: UILabel!
    @IBOutlet weak var streetLocation: UILabel!
    @IBOutlet weak var imageLocation: UIImageView!
    @IBOutlet weak var subImageLocation1: UIImageView!
    @IBOutlet weak var subImageLocation2: UIImageView!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var restrictionText: UITextView!
    @IBOutlet weak var accessText: UITextView!
    @IBOutlet weak var estimatedPriceText: UILabel!
    
    
//    let locationArray: [LocationModel] = [
//        LocationModel(locationName: "Tokyo", street: "Shibuya No. 17", hours: "-", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras bibendum mi vitae metus pulvinar ullamcorper. Maecenas dapibus tristique rutrum. Donec auctor, nisi sed condimentum rutrum, augue elit convallis eros, sed faucibus est odio sit amet tortor.", image: "tokyo", imageCollection: ["indonesia", "korea"], restriction: "No restriction, but be careful if you visit this place on night", access: "Anyone could access this place, because this place is a public facility", price: "Free", movie: "Spiderman No Way Home", bookmark: true)
//    ]
    
    @IBOutlet weak var bookmarkButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
        mapView.centerToLocation(initialLocation)
            // Do any additional setup after loading the view.
         // Make the navigation bar's title with red text.
         let appearance = UINavigationBarAppearance()
         appearance.configureWithOpaqueBackground()
         appearance.backgroundColor = UIColor.systemBackground
         appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
         navigationItem.standardAppearance = appearance
         navigationItem.scrollEdgeAppearance = appearance
         navigationItem.compactAppearance = appearance // For iPhone small navigation bar in landscape.
        
        imageLocation.image = UIImage(named: locationArray[0].image)
        subImageLocation1.image = UIImage(named: locationArray[0].image)
        subImageLocation2.image = UIImage(named: locationArray[0].image)
        nameLocation.text = locationArray[0].locationName
        streetLocation.text = locationArray[0].street
        hourLocation.text = locationArray[0].hours
        descLocation.text = locationArray[0].description
        
    }
    
    @IBAction func bookmarkTapped(_ sender: Any) {
        DispatchQueue.main.async {
            self.bookmarkButton.image = UIImage(systemName: "bookmark.fill")
            locationArray[0].bookmark = true
        }
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

@IBDesignable private extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set {
              layer.cornerRadius = newValue
              layer.masksToBounds = (newValue > 0)
        }
    }
}

private extension MKMapView {
  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 1000
  ) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}
