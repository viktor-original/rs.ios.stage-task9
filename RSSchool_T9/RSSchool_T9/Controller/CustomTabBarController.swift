//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Viktor Krasilnikov
// On: 7/29/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create instance of view controllers
        let itemsVC = ItemsVC()
        let settingsVC = UINavigationController(rootViewController: SettingsViewController())
    
        // assign view controllers to tab bar
        self.setViewControllers([itemsVC, settingsVC], animated: false)
        
        // setup of TabBarItem Images,Title and Color
        itemsVC.title = "Items"
        settingsVC.title = "Settings"
        guard let items = self.tabBar.items else { return }
        let images = ["square.grid.2x2", "gear"]
        for x in 0...1 {
            items[x].image = UIImage(systemName: images[x])
        }
        self.tabBar.tintColor = .red
    }
}
