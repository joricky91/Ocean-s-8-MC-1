//
//  LocationDetailsViewController.swift
//  Oceans 8 MC 1
//
//  Created by Haris Fadhilah on 06/04/22.
//

import UIKit

class LocationDetailsViewController: UIViewController {

    @IBOutlet weak var nameLocation: UILabel!
    @IBOutlet weak var accessLocation: UILabel!
    @IBOutlet weak var restrictLocation: UILabel!
    @IBOutlet weak var descLocation: UILabel!
    @IBOutlet weak var hourLocation: UILabel!
    @IBOutlet weak var streetLocation: UILabel!
    @IBOutlet weak var imageLocation: UIImageView!
    
    let locationArray: [LocationModel] = [
        LocationModel(locationName: "Tokyo", street: "Shibuya No. 17", hours: "-", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras bibendum mi vitae metus pulvinar ullamcorper. Maecenas dapibus tristique rutrum. Donec auctor, nisi sed condimentum rutrum, augue elit convallis eros, sed faucibus est odio sit amet tortor.", image: "tokyo", imageCollection: ["indonesia", "korea"], restriction: "No restriction, but be careful if you visit this place on night", access: "Anyone could access this place, because this place is a public facility", price: "Free", movie: "Spiderman No Way Home", bookmark: true)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        nameLocation.text = locationArray[0].locationName
        streetLocation.text = locationArray[0].street
        hourLocation.text = locationArray[0].hours
        descLocation.text = locationArray[0].description
        restrictLocation.text = locationArray[0].restriction
        accessLocation.text = locationArray[0].access
        
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
