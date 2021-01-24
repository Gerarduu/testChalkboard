//
//  FakeSplashVM.swift
//  testChalkboard
//
//  Created by Gerard Riera  on 24/01/2021.
//

import Foundation

protocol FakeSplashVMDelegate: class {
    func didLoadData(_ data: [Birthday])
    func error(_ error: Error)
}

class FakeSplashVM {
    
    weak var delegate: FakeSplashVMDelegate?
    var birthdays = [Birthday]()
    
    func loadData() {
        APIClient.shared.requestObject(router: APIRouter.birthdays) { [weak self] (result: Result<BirthdaysRoot,Error>) in
            guard let `self` = self else {return}
            switch result {
            case .failure(let err):
                self.delegate?.error(err)
                break
            case .success(let value):
                guard let data = value.results else {
                    self.delegate?.error(AppError.generic)
                    return
                }
                self.birthdays = data
                self.delegate?.didLoadData(self.birthdays)
                break
            }
        }
    }
}
