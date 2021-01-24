//
//  BirthdayTVC.swift
//  testChalkboard
//
//  Created by Gerard Riera  on 24/01/2021.
//

import Foundation
import UIKit

class BirthDayTVC: UITableViewCell {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var userView: UIView!
    @IBOutlet weak var initialsLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    override func prepareForReuse() {
        
    }
    
    func setupUI() {
        userView.layer.cornerRadius = userView.frame.width/2
        lblName.font = UIFont.boldSystemFont(ofSize: 15)
        lblDate.font = UIFont.systemFont(ofSize: 10)
        lblDate.textColor = .gray
    }
    
    func configureCell(with birthday: Birthday) {
        lblName.text = birthday.name?.first
        lblDate.text = birthday.dob?.date
        guard let initialName = birthday.name?.first?.first, let initialLast = birthday.name?.last?.first else {return}
        initialsLbl.text = "\(initialName) \(initialLast)"
    }
}
