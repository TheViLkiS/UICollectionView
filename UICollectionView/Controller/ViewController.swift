//
//  ViewController.swift
//  UICollectionView
//
//  Created by Дмитрий Гусев on 19.03.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var itemMenuArray: [Menu] = {
        var blankMenu = Menu()
        blankMenu.name = "Coca-cola"
        blankMenu.imageName = "kola"
        
        var blankMenu2 = Menu()
        blankMenu2.name = "Cofe"
        blankMenu2.imageName = "cofe"
        return [blankMenu, blankMenu2]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showVC" {
            if let vc = segue.destination as? DetailViewController {
                let menu = sender as? Menu
                print(menu ?? "")
                vc.menu = menu
            }
        }
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        itemMenuArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as? MenuCollectionViewCell {
            
            itemCell.menu = itemMenuArray[indexPath.row]
            
            
            return itemCell
        }
        return MenuCollectionViewCell()
    }
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let menu = itemMenuArray[indexPath.row]
        performSegue(withIdentifier: "showVC", sender: menu)
        
    }
    
}
