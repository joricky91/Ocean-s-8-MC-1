//
//  ViewController.swift
//  Oceans 8 MC 1
//
//  Created by Jonathan Ricky Sandjaja on 04/04/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchResultsUpdating {
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    struct Bookmark {
        let imageName: String
        let location: String
        let movie: String
    }
    
    let data: [Bookmark] = [
        Bookmark(imageName: "tokyo", location: "Tokyo", movie: "Kimi no na Wa"),
        Bookmark(imageName: "indonesia", location: "Indonesia", movie: "Laskar Pelangi"),
        Bookmark(imageName: "korea", location: "Korea", movie: "Drakor")
    ]
    
    var filteredData: [Bookmark]!
    
    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    
        filteredData = data
        table.dataSource = self
        table.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let bookmark = filteredData[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.tableImage.image = UIImage(named: bookmark.imageName)
        cell.locationLabel.text = bookmark.location
        cell.movieLabel.text = bookmark.movie
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text!
        
        filteredData = []
        
        if searchText == "" {
            filteredData = data
        }
        
        for locationName in data {
            if locationName.location.lowercased().contains(searchText.lowercased()) {
                filteredData.append(locationName)
            }
        }
        
        self.table.reloadData()
    }
    
    //location detail
    
}


