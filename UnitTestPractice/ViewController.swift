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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        APIClient().fetchMyMoney { [self] result in
            switch result {
            case .success(let myMoney):
                switch myMoney {
                case let value where value > 0:
                    label.textColor = .red
                case let value where value == 0:
                    label.textColor = .black
                case let value where value < 0:
                    label.textColor = .green
                default:
                    fatalError("Should not be happened")
                }
                label.text = "My money is \(myMoney)"
            case .failure(let error):
                label.textColor = .black
                label.text = "Error is \(error)"
            }
        }
    }
}

