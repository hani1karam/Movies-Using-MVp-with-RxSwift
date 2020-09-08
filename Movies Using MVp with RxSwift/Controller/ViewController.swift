//
//  ViewController.swift
//  Movies Using MVp with RxSwift
//
//  Created by Hany Karam on 9/8/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import UIKit
protocol DelegateItemSelected {
    var name: String? {get set}
    var Details: String? {get set}
    var image: URL? {get set}
    
}

class ViewController: BaseViewController,UICollectionViewDelegate,UICollectionViewDataSource, DelegateItemSelected {
    
    @IBOutlet weak var CollectionVC: UICollectionView!
    
    var name: String?
    var Details: String?
    var image: URL?
    var showMoviesPresenter: ShowMoviesPresenter!
    var index = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        CollectionVC.delegate = self
        CollectionVC.dataSource = self
         showMoviesPresenter = ShowMoviesPresenter(view: self)
        showMoviesPresenter.ShowMovies()
     }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return showMoviesPresenter.titlesCount()
       }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let Deatils = segue.destination as! DetailsVC
        Deatils.delegate = self
        Deatils.delegate?.name = showMoviesPresenter.namesArray[index]
        Deatils.delegate?.Details = showMoviesPresenter.Detials[index]
        let poster_base_url = "https://image.tmdb.org/t/p/w500"
        let postpath = showMoviesPresenter.image[index]
        
        Deatils.delegate?.image = URL(string: poster_base_url + postpath)
        
    }

       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        showMoviesPresenter.reloadTitles(cell: cell, index: indexPath.row)
        showMoviesPresenter.reloadimage(cell: cell, index: indexPath.row)
        showMoviesPresenter.reloadDetails(cell: cell, index: indexPath.row)
return cell
       }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        index = indexPath.row
        performSegue(withIdentifier: "Home", sender: self)
        
    }

}

 
