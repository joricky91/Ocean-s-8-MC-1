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
    
    let movieArray: [Movie] = [
        Movie(title: "Spiderman No Way Home", releaseDate: "2021", genre: "Action", synopsis: "With Spider-Man's identity now revealed, Peter asks Doctor Strange for help. When a spell goes wrong, dangerous foes from other worlds start to appear, forcing Peter to discover what it truly means to be Spider-Man.", location: [])
    ]
    
    let locationArray: [LocationModel] = [
        LocationModel(locationName: "Tokyo", street: "Shibuya No. 17", hours: "-", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras bibendum mi vitae metus pulvinar ullamcorper. Maecenas dapibus tristique rutrum. Donec auctor, nisi sed condimentum rutrum, augue elit convallis eros, sed faucibus est odio sit amet tortor.", image: "tokyo", imageCollection: ["indonesia", "korea"], restriction: "No restriction, but be careful if you visit this place on night", access: "Anyone could access this place, because this place is a public facility", price: "Free", movie: "Spiderman No Way Home", bookmark: false),
        LocationModel(locationName: "Korea", street: "Shibuya No. 17", hours: "-", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras bibendum mi vitae metus pulvinar ullamcorper. Maecenas dapibus tristique rutrum. Donec auctor, nisi sed condimentum rutrum, augue elit convallis eros, sed faucibus est odio sit amet tortor.", image: "korea", imageCollection: ["indonesia", "korea"], restriction: "No restriction, but be careful if you visit this place on night", access: "Anyone could access this place, because this place is a public facility", price: "Free", movie: "Spiderman No Way Home", bookmark: false)
    ]
    
//    let data: [Bookmark] = [
//        Bookmark(imageName: "tokyo", location: "Tokyo", movie: "Kimi no na Wa"),
//        Bookmark(imageName: "indonesia", location: "Indonesia", movie: "Laskar Pelangi"),
//        Bookmark(imageName: "korea", location: "Korea", movie: "Drakor")
//    ]
    
    var filteredData: [LocationModel]!
    
    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    
        //filter array masih salah
        filteredData = locationArray.filter {
            $0.bookmark == true
        }
        table.dataSource = self
        table.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if filteredData.count == 0 {
            tableView.setEmptyView(title: "Oops.. You haven't added any Bookmarks yet :(")
        } else {
            tableView.restore()
        }
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let bookmark = filteredData[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.tableImage.image = UIImage(named: bookmark.image)
        cell.locationLabel.text = bookmark.locationName
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
            filteredData = locationArray
        }
        
        for locationName in locationArray {
            if locationName.locationName.lowercased().contains(searchText.lowercased()) {
                filteredData.append(locationName)
            }
        }
        
        self.table.reloadData()
    }
    
    //location detail
    
}

extension UITableView {
    func setEmptyView(title: String) {
        let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
        
        let titleLabel = UILabel()
        titleLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 150)
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.center = CGPoint(x: 200, y: 265)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 3
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        
        emptyView.addSubview(titleLabel)
        
        titleLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor).isActive = true
        
        titleLabel.text = title
        
        self.backgroundView = emptyView
        self.separatorStyle = .none
    }
    
    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
}

