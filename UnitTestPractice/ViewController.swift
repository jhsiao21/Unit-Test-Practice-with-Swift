//
//  ViewController.swift
//  UnitTestPractice
//
//  Created by LoganMacMini on 2024/2/7.
//

import UIKit

class ViewController: UIViewController {

    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var vm: ViewModel = {
        let vm = ViewModel(dataProvider: APIClient())
        vm.delegate = self
        return vm
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        vm.fetchMoney()
    }
}

extension ViewController: ViewModelDelegate {
    func viewModel(_ vm: ViewModel, didReceiveMoneyAmount amount: Int) {
        label.textColor = MoneyJudge().moneyLevel(amount: amount).color
        label.text = "My money is \(amount)"
    }
    
    func viewModel(_ vm: ViewModel, didReceiveError error: Error) {
        label.textColor = .black
        label.text = "Error is \(error)"
    }
}

//extension APIClient : ViewModelDataProvider {}

extension MoneyJudge.Level {
    var color: UIColor {
        switch self {
        case .rich:
            return .red
        case .normal:
            return .black
        case .poor:
            return .green
        }
    }
}
