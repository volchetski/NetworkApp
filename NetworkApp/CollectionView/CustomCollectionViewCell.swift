//
//  CustomCollectionViewCell.swift
//  NetworkApp
//
//  Created by Евгений Волчецкий on 26.12.22.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Properties
    static let identifier = "CustomCollectionViewCell"
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 35)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.backgroundColor = .systemIndigo
        setupCell()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    private func setupCell() {
        contentView.backgroundColor = .systemGray
        contentView.layer.cornerRadius = 15
        contentView.addSubview(nameLabel)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
}
