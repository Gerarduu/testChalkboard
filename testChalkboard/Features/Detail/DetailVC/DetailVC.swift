//
//  DetailVC.swift
//  testChalkboard
//
//  Created by Gerard Riera  on 24/01/2021.
//

import Foundation
import UIKit

class DetailVC: BaseVC {
    
    var birthday = [Birthday]()
    
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var ageLbl: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "detail_vc.title".localized
    }
}
