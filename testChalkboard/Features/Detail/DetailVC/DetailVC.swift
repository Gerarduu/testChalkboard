//
//  DetailVC.swift
//  testChalkboard
//
//  Created by Gerard Riera  on 24/01/2021.
//

import Foundation
import UIKit

class DetailVC: BaseVC {
    
    var birthday: Birthday?
    
    @IBOutlet weak var initialLabel: UILabel!
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var ageLbl: UILabel!
    @IBOutlet weak var backBtn: BackButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "detail_vc.title".localized
        setup()
    }
    
    func setup() {
        profileView.layer.cornerRadius = profileView.frame.width / 2
         
        if let initialLetter = birthday?.name?.first?.first {
            initialLabel.text = "\(initialLetter)"
        }
        
        nameLbl.font = UIFont.boldSystemFont(ofSize: 15)
        nameLbl.text = birthday?.name?.first
        ageLbl.font = UIFont.boldSystemFont(ofSize: 10)
        if let age = birthday?.dob?.age {
            ageLbl.text = "\(age)"
        }
        
        backBtn.setTitle("detail.back".localized, for: .normal)
    }
    
    
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
