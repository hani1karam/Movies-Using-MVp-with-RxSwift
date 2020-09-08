//
//  CollectionViewCell.swift
//  Movies Using MVp with RxSwift
//
//  Created by Hany Karam on 9/8/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import UIKit
import Kingfisher
class CollectionViewCell: UICollectionViewCell,reloadCellTitles,reloadCellImage,reloadCellDetails{
  
    
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var titleLBL: UILabel!
    @IBOutlet weak var details: UILabel!
    
    func reloadTitle(title: String) {
        titleLBL.text = title
    }
     func reloadImage(image: Result) {
         
         DispatchQueue.main.async {
             let poster_base_url = "https://image.tmdb.org/t/p/w500"
             if let img = image.posterPath{
                 let posturl = URL(string: poster_base_url +  img )!

                 self.img.setImage(imageUrl: posturl)
             }
         }
     }
    func reloadCellDetails(Detials: String) {
        details.text = Detials
     }
     
      
}
extension UIImageView {
    func setImage(imageUrl: URL){
        self.kf.indicatorType = .activity
        self.kf.setImage(with: imageUrl, placeholder: nil, options: [.transition(.fade(0.7))],   completionHandler: nil)
    }
}
