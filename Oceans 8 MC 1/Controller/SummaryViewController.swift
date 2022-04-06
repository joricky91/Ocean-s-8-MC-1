//
//  SummaryViewController.swift
//  Oceans 8 MC 1
//
//  Created by anggidast on 06/04/22.
//

import UIKit

class SummaryViewController: UIViewController, UISearchBarDelegate, UISearchResultsUpdating {
    private var carouselView: CarouselView?
    private var carouselData = [CarouselView.CarouselData]()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        
        carouselView = CarouselView(pages: 3, delegate: self)
        carouselData.append(.init(image: UIImage(named: "indonesia"), text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"))
        carouselData.append(.init(image: UIImage(named: "korea"), text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"))
        carouselData.append(.init(image: UIImage(named: "tokyo"), text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"))
        
        setupUI()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        carouselView?.configureView(with: carouselData)
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text!
    }

}



// MARK: - Setups
private extension SummaryViewController {
    func setupUI() {
//        view.backgroundColor = backgroundColors.first
        
        guard let carouselView = carouselView else { return }
        view.addSubview(carouselView)
        carouselView.translatesAutoresizingMaskIntoConstraints = false
        carouselView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        carouselView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        carouselView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        carouselView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

// MARK: - CarouselViewDelegate
extension SummaryViewController: CarouselViewDelegate {
    func currentPageDidChange(to page: Int) {
//        UIView.animate(withDuration: 0.7) {
//            self.view.backgroundColor = self.backgroundColors[page]
//        }
    }
}
