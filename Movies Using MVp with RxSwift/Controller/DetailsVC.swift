//
//  DetailsVC.swift
//  Movies Using MVp with RxSwift
//
//  Created by Hany Karam on 9/8/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController {
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var Details: UILabel!

    var delegate: DelegateItemSelected?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

     override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let movies = delegate {
            self.name.text = movies.name
            self.Details.text = movies.Details 
            self.img.setImage(imageUrl: movies.image!)
            
        }

}
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true ,completion: nil)
    }
}
