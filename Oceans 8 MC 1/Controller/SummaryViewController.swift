//
//  SummaryViewController.swift
//  Oceans 8 MC 1
//
//  Created by anggidast on 06/04/22.
//
import UIKit

class SummaryViewController: UIViewController, UISearchBarDelegate, UISearchResultsUpdating, UITableViewDataSource, UITableViewDelegate {
    let searchController = UISearchController(searchResultsController: nil)
    var selectedMovie = Movie(id: 0, title: "", releaseDate: "", genre: "", synopsis: "", moviePoster: "", city: "", locationImage: [], locationName: [])
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(CollectionTableViewCell.self, forCellReuseIdentifier: CollectionTableViewCell.identifier)
        return table
    }()

    private var viewModels: [CollectionTableViewCellViewModel] = [
        CollectionTableViewCellViewModel(viewModels: [], category: "TRENDING OF THE WEEK"),
        CollectionTableViewCellViewModel(viewModels: [], category: "ANIME"),
        CollectionTableViewCellViewModel(viewModels: [], category: "DRAMA"),
        CollectionTableViewCellViewModel(viewModels: [], category: "MOVIES")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        contentLoop()
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
    
    func contentLoop() {
        for movie in movieArray {
            viewModels[0].viewModels.append(TileCollectionViewCellViewModel(title: "", image: UIImage(named: movie.moviePoster), city: "", id: movie.id ))
            if movie.genre == "Anime" {
                viewModels[1].viewModels.append(TileCollectionViewCellViewModel(title: movie.title, image: UIImage(named: movie.moviePoster), city: movie.city, id: movie.id ))
            } else if movie.genre == "Drama" {
                viewModels[2].viewModels.append(TileCollectionViewCellViewModel(title: movie.title, image: UIImage(named: movie.moviePoster), city: movie.city, id: movie.id ))
            } else {
                viewModels[3].viewModels.append(TileCollectionViewCellViewModel(title: movie.title, image: UIImage(named: movie.moviePoster), city: movie.city, id: movie.id ))
            }
        }
    }
}

extension SummaryViewController: CollectionTableViewCellDelegate {
    func currentPageDidChange(to page: Int) {
//        <#code#>
    }
    
    func collectionTableViewCellDidTapItem(with viewModel: TileCollectionViewCellViewModel) {
        selectedMovie = movieArray.first(where: {$0.id == viewModel.id})!
        performSegue(withIdentifier: "movieDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? MovieDetailsScreen {
            destination.movie = selectedMovie
        }
    }
}
