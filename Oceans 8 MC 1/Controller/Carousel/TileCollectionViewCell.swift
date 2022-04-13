//
//  TileCollectionViewCell.swift
//  Oceans 8 MC 1
//
//  Created by anggidast on 11/04/22.
//

import UIKit

struct TileCollectionViewCellViewModel {
    var title: String?
    let image: UIImage?
    var city: String?
    let id: Int?
}

class TileCollectionViewCell: UICollectionViewCell {
    static let identifier = "TileCollectionViewCell"
    
    private lazy var imageView = UIImageView()
    private lazy var textTitle = UILabel()
    private lazy var textCity = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setupUI(){
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
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
        textTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12).isActive = true
        textTitle.numberOfLines = 0
        textTitle.textAlignment = .left
        textTitle.font = .boldSystemFont(ofSize: 18)
        textTitle.textColor = .black

        addSubview(textCity)
        textCity.translatesAutoresizingMaskIntoConstraints = false
        textCity.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30).isActive = true
        textCity.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        textCity.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        textCity.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 5).isActive = true
        textCity.numberOfLines = 0
        textCity.textAlignment = .left
        textCity.font = .systemFont(ofSize: 14)
        textCity.textColor = .systemGray
    }
    
    func configure(with viewModel: TileCollectionViewCellViewModel) {
        imageView.image = viewModel.image
        textTitle.text = viewModel.title
        textCity.text = viewModel.city
    }
}
