//
//  SummaryViewController.swift
//  Oceans 8 MC 1
//
//  Created by anggidast on 06/04/22.
//
import UIKit

class SummaryViewController: UIViewController, UISearchBarDelegate, UISearchResultsUpdating, UITableViewDataSource, UITableViewDelegate {
    let searchController = UISearchController(searchResultsController: nil)
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(CollectionTableViewCell.self, forCellReuseIdentifier: CollectionTableViewCell.identifier)
        return table
    }()

    private let viewModels: [CollectionTableViewCellViewModel] = [
        CollectionTableViewCellViewModel(viewModels: [
            TileCollectionViewCellViewModel(title: "", image: UIImage(named: "indonesia"), city: ""),
            TileCollectionViewCellViewModel(title: "", image: UIImage(named: "korea"), city: ""),
            TileCollectionViewCellViewModel(title: "", image: UIImage(named: "tokyo"), city: "")
        ], category: "TRENDING OF THE WEEK"), CollectionTableViewCellViewModel(viewModels: [
            TileCollectionViewCellViewModel(title: "Indonesia", image: UIImage(named: "indonesia"), city: "Bali"),
            TileCollectionViewCellViewModel(title: "South Korea", image: UIImage(named: "korea"), city: "Seoul"),
            TileCollectionViewCellViewModel(title: "Japan", image: UIImage(named: "tokyo"), city: "Tokyo")
        ], category: "ANIME"), CollectionTableViewCellViewModel(viewModels: [
            TileCollectionViewCellViewModel(title: "Indonesia", image: UIImage(named: "indonesia"), city: "Bali"),
            TileCollectionViewCellViewModel(title: "South Korea", image: UIImage(named: "korea"), city: "Seoul"),
            TileCollectionViewCellViewModel(title: "Japan", image: UIImage(named: "tokyo"), city: "Tokyo")
        ], category: "DRAMA"), CollectionTableViewCellViewModel(viewModels: [
            TileCollectionViewCellViewModel(title: "Indonesia", image: UIImage(named: "indonesia"), city: "Bali"),
            TileCollectionViewCellViewModel(title: "South Korea", image: UIImage(named: "korea"), city: "Seoul")
        ], category: "MOVIES")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorColor = UIColor.clear
    }
    
    @objc func imageClicked(sender: UIImage) {
        performSegue(withIdentifier: "goToMovieDetail", sender: UIImage.self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let _ = searchController.searchBar.text!
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = viewModels[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as? CollectionTableViewCell else {
            fatalError()
        }
        cell.delegate = self
        
        cell.configure(with: viewModel)
        cell.layoutMargins = UIEdgeInsets.zero
        cell.separatorInset = UIEdgeInsets.zero
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath[1] == 0 {
            return 200
        }
        return 245
    }

}

extension SummaryViewController: CollectionTableViewCellDelegate {
    func currentPageDidChange(to page: Int) {
//        <#code#>
    }
    
    func collectionTableViewCellDidTapItem(with viewModel: TileCollectionViewCellViewModel) {
        let alert = UIAlertController(title: viewModel.title, message: "clicked", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style:. cancel, handler: nil))
        present(alert, animated: true)
    }
}
