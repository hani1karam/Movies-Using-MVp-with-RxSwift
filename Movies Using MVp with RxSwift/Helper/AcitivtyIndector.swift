//
//  AcitivtyIndector.swift
//  Movies Using MVp with RxSwift
//
//  Created by Hany Karam on 9/8/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import Foundation
import UIKit
import PKHUD
import NVActivityIndicatorView
class BaseViewController: UIViewController, BaseViewProtocol{
    func setLocalization() {
        
    }
    
    func updateCartBadge(with value: Int) {
        
    }
    
    func checkDirectionRTL() -> Bool {
        return false
    }
    
    @IBOutlet weak var backButton: UIButton?
    var refreshControl = UIRefreshControl()
    override func viewDidLoad() {
        super.viewDidLoad()
 
    }
  
    
    
 
  
    //MARK:- Loading and alerts
    func showLoading() {
        HUD.show(.progress, onView: self.view)
        
    }
    
    func showAlert(title: String?, message: String) {
        let titleTxt = NSLocalizedString(title ?? "", comment: "")
        let messageTxt = NSLocalizedString(message, comment: "")
        let alertController = UIAlertController(title: titleTxt, message: messageTxt, preferredStyle: UIAlertController.Style.alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    func hideLoading() {
        HUD.hide()
        
    }
    //MARK:- Handel Error
    
    func showLogin() {
        let alert = UIAlertController(title:NSLocalizedString("profile_welcome", comment: ""), message:NSLocalizedString("profile_sign_up_or_sign_in", comment: "")  , preferredStyle: .alert)
        let okAction = UIAlertAction(title:NSLocalizedString("onboarding_sigin_in", comment: "") , style: .default) { (_) in
         }
        let cance = UIAlertAction(title: NSLocalizedString("alert_cancel", comment: ""), style: .cancel, handler: nil)
        alert.addAction(okAction)
        alert.addAction(cance)
        self.present(alert, animated: true, completion: nil)
    }
    func showBlockScreenWithRetry() {
        
    }
    
    func showScreenNoConnection() {
        
    }
}
