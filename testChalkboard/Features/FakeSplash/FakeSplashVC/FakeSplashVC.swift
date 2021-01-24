//
//  FakeSplashVC.swift
//  testChalkboard
//
//  Created by Gerard Riera  on 24/01/2021.
//

import Foundation
import UIKit

class FakeSplashVC: BaseVC {
    
    let fakeSplashVM = FakeSplashVM()
    
    var birthdays = [Birthday]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        loadData()
    }
    
    func setup() {
        fakeSplashVM.delegate = self
    }
    
    func loadData() {
        startWaiting()
        fakeSplashVM.loadData()
    }
    
    func pushHome() {
        Navigation.shared.setRootHome(birthdays: birthdays)
    }
}

extension FakeSplashVC: FakeSplashVMDelegate {
    func didLoadData(_ data: [Birthday]) {
        stopWaiting()
        self.birthdays = data
        pushHome()
    }
    
    func error(_ error: Error) {
        stopWaiting()
        showPopup(withTitle: "error.generic".localized, withText: error.localizedDescription, withButton: "error.retry".localized, completion: { (retry,_) in
            self.loadData()
        })
    }
}
