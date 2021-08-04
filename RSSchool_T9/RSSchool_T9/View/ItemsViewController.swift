//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Viktor Krasilnikov
// On: 7/29/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class ItemsVC: UIViewController {
    
    let data = FillingData.data
    
    
    fileprivate let collectionView: UICollectionView = {
        
        // CollectionView layout setup
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        layout.minimumLineSpacing = 30
        layout.minimumInteritemSpacing = 16
        
        let iconsCV = UICollectionView(frame: .zero, collectionViewLayout: layout)
        iconsCV.translatesAutoresizingMaskIntoConstraints = false
        iconsCV.register(ItemsCell.self, forCellWithReuseIdentifier: "cell")
        
        return iconsCV
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension ItemsVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("you tapped item")
        
        switch data[indexPath.row] {
        
        case .story:

            let storyVC = ItemViewController()
            storyVC.modalPresentationStyle = .fullScreen
            present(storyVC, animated: true)
            
        case .gallery:
            
            let galleryVC = ItemViewController()
            galleryVC.modalPresentationStyle = .fullScreen
            present(galleryVC, animated: true)
       
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.width / 2 - 30, height:(collectionView.bounds.width / 2 - 30) * 1.25)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ItemsCell
        
        switch data[indexPath.row] {
        
        case .story(let story):
            cell.itemImage.image = story.coverImage
            cell.itemTitle.text = story.title
            cell.itemContentTitle.text = "Story"
            
        case .gallery(let gallery):
            cell.itemImage.image = gallery.coverImage
            cell.itemTitle.text = gallery.title
            cell.itemContentTitle.text = "Galery"
        }
        
        return cell
    }
    
    
}
