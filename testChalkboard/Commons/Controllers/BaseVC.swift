//
//  BaseVC.swift
//  testChalkboard
//
//  Created by Gerard Riera  on 24/01/2021.
//

import Foundation
import UIKit

class BaseVC: UIViewController {
    
    var waitingView: LoadingVC?
    
    private var isShownPopup = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupNavBar()
    }
    
    func setupNavBar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
    }
    
    func startWaiting(color: UIColor = .white) {
        DispatchQueue.main.async {
            if self.waitingView == nil {
                self.waitingView = LoadingVC(color: color, containerView: self.view)
            }
            self.view.subviews.filter { $0.isKind(of: LoadingVC.self) }
                .forEach { $0.removeFromSuperview() }
            self.waitingView?.start()
        }
    }
    
    func stopWaiting(_ silent: Bool = false) {
        DispatchQueue.main.async {
            self.waitingView?.stop()
        }
    }
}
