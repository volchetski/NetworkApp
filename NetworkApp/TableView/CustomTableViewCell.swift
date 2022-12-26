//
//  CustomTableViewCell.swift
//  NetworkApp
//
//  Created by Евгений Волчецкий on 26.12.22.
//

import UIKit

class CustomCell: UITableViewCell {
    
    public lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .label
        return label
    }()
    
    public lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        return label
    }()
    
    public lazy var anotherLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        return label
    }()
    
    public lazy var itemImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.layer.masksToBounds = true
        image.backgroundColor = .white
        return image
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(anotherLabel)
        contentView.addSubview(itemImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    public func configure(text: String, descriptionText: String, imageName: String, markLabel: String) {
//        nameLabel.text = text
//        descriptionLabel.text = descriptionText
//        itemImage.image = UIImage(named: imageName)
//        anotherLabel.text = markLabel
//    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let imageSize = contentView.frame.size.height
        
        itemImage.frame = CGRect(x: 0, y: 0, width: imageSize, height: imageSize)
        nameLabel.frame = CGRect(x: itemImage.frame.maxX + 30, y: itemImage.frame.minY, width: contentView.frame.size.width/1.5, height: itemImage.frame.size.height/2)
        descriptionLabel.frame = CGRect(x: itemImage.frame.maxX + 30, y: nameLabel.frame.midY + 10 , width: contentView.frame.size.width/1.5, height: itemImage.frame.size.height/2)
        anotherLabel.frame = CGRect(x: itemImage.frame.maxX + 30, y: descriptionLabel.frame.midY, width: contentView.frame.size.width/1.5, height: itemImage.frame.size.height/2)
    }
}
