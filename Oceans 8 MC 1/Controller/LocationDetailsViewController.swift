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
    @IBOutlet weak var estimatedPriceText: UILabel!
    @IBOutlet weak var accessText: UITextView!
    @IBOutlet weak var bookmarkButton: UIBarButtonItem!
    
    var location = LocationModel(locationName: "", street: "", hours: "", description: "", image: "", imageCollection: [""], restriction: "", access: "", price: "", movie: "", bookmark: false, latitude: 0, longitude: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let initialLocation = CLLocation(latitude: locationArray[selectedIndex].latitude, longitude: locationArray[selectedIndex].longitude)
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
        
        imageLocation.image = UIImage(named: locationArray[selectedIndex].image)
        subImageLocation1.image = UIImage(named: locationArray[selectedIndex].imageCollection[0])
        subImageLocation2.image = UIImage(named: locationArray[selectedIndex].imageCollection[1])
        nameLocation.text = locationArray[selectedIndex].locationName
        streetLocation.text = locationArray[selectedIndex].street
        hourLocation.text = locationArray[selectedIndex].hours
        descLocation.text = locationArray[selectedIndex].description
        restrictionText.text = locationArray[selectedIndex].restriction
        estimatedPriceText.text = locationArray[selectedIndex].price
        accessText.text = locationArray[selectedIndex].access
        
    }
    
    @IBAction func bookmarkTapped(_ sender: Any) {
        DispatchQueue.main.async {
            self.bookmarkButton.image = UIImage(systemName: "bookmark.fill")
            locationArray[selectedIndex].bookmark = true
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
