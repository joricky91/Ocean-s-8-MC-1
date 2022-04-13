//
//  MovieDetailsScreen.swift
//  MoviePin
//
//  Created by Victor Hartanto on 06/04/22.
//

import Foundation
import UIKit

var selectedIndex = 0

class LocationCell: UITableViewCell {

    @IBOutlet weak var LocationImageView: UIImageView!
    @IBOutlet weak var LocationNameTxt: UILabel!
    @IBOutlet weak var StreetNameTxt: UILabel!

}

class MovieDetailsScreen: UIViewController {
    
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var genre: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieSynopsis: UITextView!
    
    var movie = Movie(id: 0, title: "", releaseDate: "", genre: "", synopsis: "", moviePoster: "", city: "", locationImage: [], locationName: [])

    var locations: [LocationModel] = []

    @IBOutlet weak var TableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locations = createArray()
        
        TableView.delegate = self
        TableView.dataSource = self
        
        moviePoster.image = UIImage(named: movie.moviePoster)
        movieSynopsis.text = movie.synopsis
        movieTitle.text = movie.title
        genre.text = movie.genre
        releaseDate.text = movie.releaseDate
        
    }
    
    func createArray() -> [LocationModel] {
        
        var tempLocations: [LocationModel] = []
        let locations = locationArray.filter {location in
            return location.movie == movie.title}
       
        tempLocations.append(locations[0])
        tempLocations.append(locations[1])
        
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
        cell.LocationImageView.image = UIImage(named: location.image)
        cell.LocationNameTxt.text = location.locationName
        cell.StreetNameTxt.text = location.street
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? LocationDetailsViewController {
            destination.location = locations[selectedIndex]
        }
    }
}

