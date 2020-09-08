//
//  MoviesPresenter.swift
//  Movies Using MVp with RxSwift
//
//  Created by Hany Karam on 9/8/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import Foundation
import RxSwift
 
protocol MoviesToDos {
    func showHud()
    func HideHud()
    func getDataSuccessfully()
    func showError(error: String)
}
protocol reloadCellTitles {
    func reloadTitle(title: String)
}
protocol reloadCellDetails {
    func reloadCellDetails(Detials: String)
}


protocol reloadCellImage {
    func reloadImage(image: Result)
}
 class ShowMoviesPresenter:BasePresenter{
    var view: ViewController?
    var ItemMovies = [Result]()
    
    init(view: ViewController) {
        self.view = view
    }
    func ShowMovies(){
        disposable = requestManager.showMovies().subscribe(onNext: { (response) in
            let data = response.results
            self.ItemMovies = data
            self.view?.CollectionVC.reloadData()
        })
        
    }
    
    
    func titlesCount() -> Int{
        return ItemMovies.count
    }
    var namesArray: [String] {
        get {
            return ItemMovies.map { ($0.title )}
        }
    }
    var Detials: [String] {
        get {
            return ItemMovies.map { ($0.overview)}
        }
    }
    var imageArray: [String] {
        get {
            return ItemMovies.map { ($0.posterPath ?? "" )}
            
        }
    }

    func reloadTitles(cell: reloadCellTitles, index: Int){
        cell.reloadTitle(title: ItemMovies[index].title )
        
    }
    func reloadDetails(cell: reloadCellDetails, index: Int){
        cell.reloadCellDetails(Detials: ItemMovies[index].overview)
        
    }

var image: [String] {
        get {
            return ItemMovies.map { ($0.posterPath ?? "" )}
            
        }
    }
    func reloadimage(cell: reloadCellImage, index: Int){
        cell.reloadImage(image: ItemMovies[index])
    }
    
  
    
}
