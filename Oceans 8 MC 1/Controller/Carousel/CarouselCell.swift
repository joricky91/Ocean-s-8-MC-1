//
//  CarouselCell.swift
//  Oceans 8 MC 1
//
//  Created by anggidast on 06/04/22.
//
import UIKit

import UIKit

class CarouselCell: UICollectionViewCell {
    
    // MARK: - SubViews
    
    private lazy var imageView = UIImageView()
    private lazy var textTitle = UILabel()
    private lazy var textCity = UILabel()
    
    // MARK: - Properties
    
    static let cellId = "CarouselCell"
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
}

// MARK: - Setups
private extension CarouselCell {
    func setupUI() {
        backgroundColor = .clear
        
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        
        addSubview(textTitle)
        textTitle.translatesAutoresizingMaskIntoConstraints = false
        textTitle.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5).isActive = true
        textTitle.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        textTitle.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        textTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
        textTitle.numberOfLines = 0
        textTitle.textAlignment = .left
        textTitle.font = .boldSystemFont(ofSize: 18)
        textTitle.textColor = .black
        
        addSubview(textCity)
        textCity.translatesAutoresizingMaskIntoConstraints = false
        textCity.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30).isActive = true
        textCity.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        textCity.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        textCity.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        textCity.numberOfLines = 0
        textCity.textAlignment = .left
        textCity.font = .systemFont(ofSize: 16)
        textCity.textColor = .systemGray
    }
}

// MARK: - Public
extension CarouselCell {
    public func configure(image: UIImage?, title: String?, city: String?) {
        imageView.image = image
        textTitle.text = title
        textCity.text = city
    }
}
