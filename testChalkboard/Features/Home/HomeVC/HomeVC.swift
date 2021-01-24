//
//  ViewController.swift
//  testChalkboard
//
//  Created by Gerard Riera  on 24/01/2021.
//

import UIKit

class HomeVC: BaseVC {
    
    @IBOutlet weak var mainTV: UITableView! {
        didSet {
            
            mainTV.showsVerticalScrollIndicator = false
            mainTV.rowHeight = 80
            mainTV.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            mainTV.delegate = self
            mainTV.dataSource = self
            mainTV.register(UINib(nibName: kBirthdayTVC, bundle: .main), forCellReuseIdentifier: kBirthdayTVC)
            mainTV.separatorStyle = .none
        }
    }
    
    var birthdays = [Birthday]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "home_vc.title".localized
        mainTV.reloadData()
    }
    
    func cellForBirthday(at indexPath: IndexPath) -> UITableViewCell {
        if let cell = mainTV.dequeueReusableCell(withIdentifier: kBirthdayTVC) as? BirthDayTVC {
            let birthday = birthdays[indexPath.row]
            cell.configureCell(with: birthday)
            return cell
        }
        return UITableViewCell()
    }
}

extension HomeVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return birthdays.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cellForBirthday(at: indexPath)
    }
}

