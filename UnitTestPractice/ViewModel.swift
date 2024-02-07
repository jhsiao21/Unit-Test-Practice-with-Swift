//
//  ViewModel.swift
//  UnitTestPractice
//
//  Created by LoganMacMini on 2024/2/7.
//

import Foundation

protocol ViewModelDelegate: AnyObject {
    func viewModel(_ vm: ViewModel, didReceiveMoneyAmount amount: Int)
    
    func viewModel(_ vm: ViewModel, didReceiveError error: Error)
}

protocol ViewModelDataProvider {
    func fetchMyMoney(completion: @escaping (Result<Int, Error>) -> Void)
}

final class ViewModel {
    private let dataProvider: ViewModelDataProvider
    weak var delegate: ViewModelDelegate?
    
    init(dataProvider: ViewModelDataProvider) {
        self.dataProvider = dataProvider
    }
    
    func fetchMoney() {
        dataProvider.fetchMyMoney { [self] result in
            switch result {
            case .success(let myMoney):
                delegate?.viewModel(self, didReceiveMoneyAmount: myMoney)
            case .failure(let error):
                delegate?.viewModel(self, didReceiveError: error)
            }
        }
    }
}
