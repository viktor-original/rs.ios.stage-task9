//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Viktor Krasilnikov
// On: 8/1/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class ItemViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        self.view.removeConstraints(self.view.constraints)
        
        
        let btnVC = CrossButton()
        self.view.addSubview(btnVC)
        
        let trailingX = NSLayoutConstraint(item: btnVC, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: -40)
        let topY = NSLayoutConstraint(item: btnVC, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 40)
        let height = NSLayoutConstraint(item: btnVC, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 40)
        btnVC.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraints([trailingX, topY, height])
        
        btnVC.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
         
    }
    
    func setupConstraints() {
        
    }
    
    @objc func buttonAction(_ sender:UIButton!)
       {
        self.dismiss(animated: true)
        print("CrossButton tapped")
       }
    
    
}
