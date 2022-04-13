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
    
    var filteredData: [LocationModel] = []
    var temp: [LocationModel] = []
    let searchController = UISearchController(searchResultsController: nil)
    
    var location = LocationModel(locationName: "", street: "", hours: "", description: "", image: "", imageCollection: ["", ""], restriction: "", access: "", price: "", movie: "", bookmark: false, latitude: 0, longitude: 0)

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
        
        temp = filteredData
        
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
            filteredData = temp
        }
        
        for locationName in temp {
            if locationName.locationName.lowercased().contains(searchText.lowercased()) {
                filteredData.append(locationName)
            }
        }
        
        self.table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "showLocDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? LocationDetailsViewController {
            destination.location = locationArray[selectedIndex]
            print(selectedIndex)
        }
    }
    
}

extension UITableView {
    func setEmptyView(title: String) {
        let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
        
        let titleLabel = UILabel()
        let imageEmpty = UIImage(named: "film_rolls")
        let noDataImage = UIImageView(image: imageEmpty)
        
        titleLabel.frame = CGRect(x: 100, y: 305, width: 200, height: 150)
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        titleLabel.center = CGPoint(x: 200, y: 290)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 3
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        
        noDataImage.frame = CGRect(x: 25, y: 0, width: 350, height: 350)
        
        emptyView.addSubview(noDataImage)
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

