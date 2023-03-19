//
//  DetailViewController.swift
//  UICollectionView
//
//  Created by Дмитрий Гусев on 19.03.2023.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            guard let image = menu?.imageName else {return}
            imageView.image = UIImage(named: image)
        }
    }
    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            nameLabel.text = menu?.name
        }
    }
    
    var menu: Menu?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    


}
