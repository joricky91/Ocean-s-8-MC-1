//
//  CarouselView.swift
//  Oceans 8 MC 1
//
//  Created by anggidast on 06/04/22.
//
import UIKit

struct CarouselData {
    let image: UIImage?
    let title: String?
    let city: String?
}

protocol CarouselViewDelegate: AnyObject {
    func currentPageDidChange(to page: Int)
}

protocol CollectionViewCellDelegate: AnyObject {
    func collectionViewCellDidTapItem(with viewModel: CarouselData)
}

class CarouselView: UIView {
    
    // MARK: - Subviews
    
    weak var delegateCell: (CollectionViewCellDelegate)?
    
    private lazy var carouselCollectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collection.showsHorizontalScrollIndicator = false
        collection.isPagingEnabled = false
        collection.dataSource = self
        collection.delegate = self
        collection.register(CarouselCell.self, forCellWithReuseIdentifier: CarouselCell.cellId)
        collection.backgroundColor = .clear
        return collection
    }()
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = .black
        return pageControl
    }()
    
    
    // MARK: - Properties
    
    private var pages: Int
    private weak var delegate: CarouselViewDelegate?
    private var carouselData = [CarouselData]()
    private var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            delegate?.currentPageDidChange(to: currentPage)
        }
    }
    
    // MARK: - Initializers
    
    init(pages: Int, delegate: CarouselViewDelegate?, pageControl: Bool, landscape: Bool) {
        self.pages = pages
        self.delegate = delegate
        super.init(frame: .zero)
        setupUI(pageControl: pageControl, landscape: landscape)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setups
private extension CarouselView {
    func setupUI(pageControl: Bool, landscape: Bool) {
        backgroundColor = .clear
        setupCollectionView(landscape: landscape)
        if pageControl == true {
            setupPageControl()
        }
    }
    
    func setupCollectionView(landscape: Bool) {
        
//        let titleLabel = UILabel()
        let cellPadding = (frame.width - 320) / 2
        let carouselLayout = UICollectionViewFlowLayout()
        carouselLayout.scrollDirection = .horizontal
        if landscape == true {
            carouselLayout.itemSize = .init(width: 250, height: 200)
        } else {
            carouselLayout.itemSize = .init(width: 150, height: 200)
        }
        carouselLayout.sectionInset = .init(top: 0, left: cellPadding/2, bottom: 0, right: cellPadding/2)
        carouselLayout.minimumLineSpacing = cellPadding/2
        carouselCollectionView.collectionViewLayout = carouselLayout
        
        addSubview(carouselCollectionView)
        carouselCollectionView.translatesAutoresizingMaskIntoConstraints = false
        carouselCollectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        carouselCollectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        carouselCollectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        carouselCollectionView.heightAnchor.constraint(equalToConstant: 400).isActive = true
    }
    
    func setupPageControl() {
        addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.topAnchor.constraint(equalTo: carouselCollectionView.bottomAnchor, constant: -140).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        pageControl.widthAnchor.constraint(equalToConstant: 150).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 10).isActive = true
        pageControl.numberOfPages = pages
    }
}

// MARK: - UICollectionViewDataSource
extension CarouselView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return carouselData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarouselCell.cellId, for: indexPath) as? CarouselCell else { return UICollectionViewCell() }
        
        let image = carouselData[indexPath.row].image
        let title = carouselData[indexPath.row].title
        let city = carouselData[indexPath.row].city
        
        cell.configure(image: image, title: title, city: city)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let carouselData = carouselData[indexPath.row]
        
        delegateCell?.collectionViewCellDidTapItem(with: carouselData)
    }
}

// MARK: - UICollectionView Delegate
extension CarouselView: UICollectionViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        currentPage = getCurrentPage()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        currentPage = getCurrentPage()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        currentPage = getCurrentPage()
    }
}

// MARK: - Public
extension CarouselView {
    public func configureView(with data: [CarouselData], landscape: Bool) {
        let cellPadding = (frame.width - 320) / 2
        let carouselLayout = UICollectionViewFlowLayout()
        carouselLayout.scrollDirection = .horizontal
        if landscape == true {
            carouselLayout.itemSize = .init(width: 250, height: 200)
        } else {
            carouselLayout.itemSize = .init(width: 120, height: 200)
        }
        carouselLayout.sectionInset = .init(top: 0, left: cellPadding/2, bottom: 0, right: cellPadding/2)
        carouselLayout.minimumLineSpacing = cellPadding/2
        carouselCollectionView.collectionViewLayout = carouselLayout
        
        carouselData = data
        carouselCollectionView.reloadData()
    }
}

// MARKK: - Helpers
private extension CarouselView {
    func getCurrentPage() -> Int {
        
        let visibleRect = CGRect(origin: carouselCollectionView.contentOffset, size: carouselCollectionView.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        if let visibleIndexPath = carouselCollectionView.indexPathForItem(at: visiblePoint) {
            return visibleIndexPath.row
        }
        
        return currentPage
    }
}

