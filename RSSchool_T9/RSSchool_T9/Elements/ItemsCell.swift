//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Viktor Krasilnikov
// On: 7/31/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class ItemsCell: UICollectionViewCell {
    
    var itemImage: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "tesla-5")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.borderWidth = 1
        iv.layer.cornerRadius = 10
        iv.layer.borderColor = UIColor.black.cgColor
        return iv
    }()
    
    private lazy var gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.frame = itemImage.bounds
        layer.locations = [0.65, 1.0]
        layer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        return layer
    }()
    
    var itemTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rockwell-Regular", size: 16)
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        return label
    }()
    
    var itemContentTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rockwell-Regular", size: 12)
        label.textColor = UIColor(red: 0.712, green: 0.712, blue: 0.712, alpha: 1)
        return label
    }()
    
    override func layoutSubviews() {
             super.layoutSubviews()
             gradientLayer.frame = itemImage.bounds
         }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 18
        self.layer.borderColor = UIColor.black.cgColor
        
        self.addSubview(itemImage)
        self.addSubview(itemTitle)
        self.addSubview(itemContentTitle)
        
        itemImage.layer.addSublayer(gradientLayer)
        
        itemImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        itemImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
        itemImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8).isActive = true
        itemImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        
        itemTitle.leadingAnchor.constraint(equalTo: itemImage.leadingAnchor, constant: 10).isActive = true
        itemTitle.trailingAnchor.constraint(equalTo: itemImage.trailingAnchor, constant: -15).isActive = true
        itemTitle.bottomAnchor.constraint(equalTo: itemImage.bottomAnchor, constant: -30).isActive = true
        itemTitle.heightAnchor.constraint(equalToConstant: 17).isActive = true

        itemContentTitle.leadingAnchor.constraint(equalTo: itemTitle.leadingAnchor).isActive = true
        itemContentTitle.topAnchor.constraint(equalTo: itemTitle.bottomAnchor, constant: 3).isActive = true
        itemContentTitle.trailingAnchor.constraint(equalTo: itemTitle.trailingAnchor).isActive = true
        itemContentTitle.heightAnchor.constraint(equalToConstant: 13).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
