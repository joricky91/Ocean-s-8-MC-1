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
    private var carouselView1: CarouselView?
    private var carouselData1 = [CarouselView.CarouselData]()
    private var carouselView2: CarouselView?
    private var carouselData2 = [CarouselView.CarouselData]()
    private var carouselView3: CarouselView?
    private var carouselData3 = [CarouselView.CarouselData]()
    let searchController = UISearchController(searchResultsController: nil)
    var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        
        scrollView.contentSize = CGSize(width: scrollView.contentSize.width, height: UIScreen.main.bounds.height*100)
        view.addSubview(scrollView)
        
        carouselView = CarouselView(pages: 3, delegate: self, pageControl: true, landscape: true)
        carouselData.append(.init(image: UIImage(named: "indonesia"), title: "", city: ""))
        carouselData.append(.init(image: UIImage(named: "korea"), title: "", city: ""))
        carouselData.append(.init(image: UIImage(named: "tokyo"), title: "", city: ""))
        
        carouselView1 = CarouselView(pages: 3, delegate: self, pageControl: false, landscape: false)
        carouselData1.append(.init(image: UIImage(named: "indonesia"), title: "Indonesia", city: "Jakarta"))
        carouselData1.append(.init(image: UIImage(named: "korea"), title: "South Korea", city: "Seoul"))
        carouselData1.append(.init(image: UIImage(named: "tokyo"), title: "Japan", city: "Tokyo"))
        
        carouselView2 = CarouselView(pages: 3, delegate: self, pageControl: false, landscape: false)
        carouselData2.append(.init(image: UIImage(named: "indonesia"), title: "Indonesia", city: "Jakarta"))
        carouselData2.append(.init(image: UIImage(named: "korea"), title: "South Korea", city: "Seoul"))
        carouselData2.append(.init(image: UIImage(named: "tokyo"), title: "Japan", city: "Tokyo"))
        
        carouselView3 = CarouselView(pages: 3, delegate: self, pageControl: false, landscape: false)
        carouselData3.append(.init(image: UIImage(named: "indonesia"), title: "Indonesia", city: "Jakarta"))
        carouselData3.append(.init(image: UIImage(named: "korea"), title: "South Korea", city: "Seoul"))
        carouselData3.append(.init(image: UIImage(named: "tokyo"), title: "Japan", city: "Tokyo"))
        
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        carouselView?.configureView(with: carouselData, landscape: true)
        carouselView1?.configureView(with: carouselData1, landscape: false)
        carouselView2?.configureView(with: carouselData2, landscape: false)
        carouselView3?.configureView(with: carouselData3, landscape: false)
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text!
    }

}



// MARK: - Setups
private extension SummaryViewController {
    func setupUI() {
        let titleLabel = UILabel()
        let titleLabel2 = UILabel()
        let titleLabel3 = UILabel()
        guard let carouselView = carouselView else { return }
        scrollView.addSubview(carouselView)
        carouselView.translatesAutoresizingMaskIntoConstraints = false
        carouselView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        carouselView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        carouselView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        carouselView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        scrollView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: -50).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 18).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .left
        titleLabel.font = .boldSystemFont(ofSize: 18)
        titleLabel.textColor = .black
        titleLabel.text = "ANIME"

        guard let carouselView1 = carouselView1 else { return }
        scrollView.addSubview(carouselView1)
        carouselView1.translatesAutoresizingMaskIntoConstraints = false
        carouselView1.topAnchor.constraint(equalTo: view.topAnchor, constant: 315).isActive = true
        carouselView1.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        carouselView1.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        carouselView1.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        scrollView.addSubview(titleLabel2)
        titleLabel2.translatesAutoresizingMaskIntoConstraints = false
        titleLabel2.topAnchor.constraint(equalTo: view.topAnchor, constant: 430).isActive = true
        titleLabel2.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 18).isActive = true
        titleLabel2.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        titleLabel2.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        titleLabel2.numberOfLines = 0
        titleLabel2.textAlignment = .left
        titleLabel2.font = .boldSystemFont(ofSize: 18)
        titleLabel2.textColor = .black
        titleLabel2.text = "DRAMA"

        guard let carouselView2 = carouselView2 else { return }
        scrollView.addSubview(carouselView2)
        carouselView2.translatesAutoresizingMaskIntoConstraints = false
        carouselView2.topAnchor.constraint(equalTo: view.topAnchor, constant: 555).isActive = true
        carouselView2.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        carouselView2.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        carouselView2.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        scrollView.addSubview(titleLabel3)
        titleLabel3.translatesAutoresizingMaskIntoConstraints = false
        titleLabel3.topAnchor.constraint(equalTo: view.topAnchor, constant: 670).isActive = true
        titleLabel3.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 18).isActive = true
        titleLabel3.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        titleLabel3.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        titleLabel3.numberOfLines = 0
        titleLabel3.textAlignment = .left
        titleLabel3.font = .boldSystemFont(ofSize: 18)
        titleLabel3.textColor = .black
        titleLabel3.text = "MOVIES"

        guard let carouselView3 = carouselView3 else { return }
        scrollView.addSubview(carouselView3)
        carouselView3.translatesAutoresizingMaskIntoConstraints = false
        carouselView3.topAnchor.constraint(equalTo: view.topAnchor, constant: 795).isActive = true
        carouselView3.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        carouselView3.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        carouselView3.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
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
