//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Viktor Krasilnikov
// On: 8/2/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class CrossButton: UIButton {
    
    private lazy var crossImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "xmark")
        imageView.tintColor = .white
        return imageView
        
    }()
    
    override init(frame: CGRect) {
        
        let xPostion:CGFloat = 50
        let yPostion:CGFloat = 100
        let buttonWidth:CGFloat = 40
        let buttonHeight:CGFloat = 40
               
        super.init(frame: CGRect(x:xPostion, y:yPostion, width:buttonWidth, height:buttonHeight))
        
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.borderWidth = 1
        layer.cornerRadius = 20
        layer.borderColor = UIColor.white.cgColor
        
        self.addSubview(crossImageView)
        self.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.widthAnchor.constraint(equalToConstant: 40).isActive = true
        crossImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        crossImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        crossImageView.heightAnchor.constraint(equalToConstant: 21).isActive = true
        crossImageView.widthAnchor.constraint(equalToConstant: 19).isActive = true
       
    }
    
    override var isHighlighted: Bool {
        didSet {
            UIView.transition(with: self, duration: 0.123, options: [.transitionCrossDissolve]) { [self] in
                if isHighlighted {
                    crossImageView.tintColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
                } else {
                    crossImageView.tintColor = .black
                }
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
       
}
