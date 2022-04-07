//
//  MovieDetailsScreen.swift
//  MoviePin
//
//  Created by Victor Hartanto on 06/04/22.
//

import Foundation
import UIKit

class Location {
    
    var image: UIImage
    var locationname: String
    var streetname: String
    
    init(image: UIImage, locationname: String, streetname: String){
        self.image = image
        self.locationname = locationname
        self.streetname = streetname
        
    }
}

class LocationCell: UITableViewCell {

    @IBOutlet weak var LocationImageView: UIImageView!
    @IBOutlet weak var LocationNameTxt: UILabel!
    @IBOutlet weak var StreetNameTxt: UILabel!
    
    func setLocation(location: Location) {
        LocationImageView.image = location.image
        LocationNameTxt.text = location.locationname
        StreetNameTxt.text = location.streetname
    }
    

}

class MovieDetailsScreen: UIViewController {
    
    var locations: [Location] = []

    @IBOutlet weak var TableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locations = createArray()
        
        TableView.delegate = self
        TableView.dataSource = self

        
    }
    
    func createArray() -> [Location] {
        
        var tempLocations: [Location] = []
        
        let location1 = Location(image: UIImage(named: "sofitelshanghai.jpeg")! , locationname: "Sofitel Shanghai", streetname: "Blabla")
        let location2 = Location(image: UIImage(named: "cafekacao.jpeg")! , locationname: "Cafe Kacao", streetname: "Blabla")
        let location3 = Location(image: UIImage(named: "xujiahuipark.jpeg")! , locationname: "XuJiaHui Park", streetname: "Blabla")
        let location4 = Location(image: UIImage(named: "nanpubridgexujiahuipark.jpeg")! , locationname: "Nanpu Bridge", streetname: "Blabla")
        let location5 = Location(image: UIImage(named: "waibaidubridge.jpeg")! , locationname: "Waibaidu Bridge", streetname: "Blabla")
        
        tempLocations.append(location1)
        tempLocations.append(location2)
        tempLocations.append(location3)
        tempLocations.append(location4)
        tempLocations.append(location5)
        
        return tempLocations
    }
    

}

extension MovieDetailsScreen: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let location = locations[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell") as! LocationCell
        
        cell.setLocation(location: location)
        
        return cell
    }
}

