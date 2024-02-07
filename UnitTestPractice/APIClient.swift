//
//  File.swift
//  UnitTestPractice
//
//  Created by LoganMacMini on 2024/2/7.
//

import Foundation

class APIClient : ViewModelDataProvider {
    
    public func fetchMyMoney(completion: @escaping (Result<Int, Error>) -> Void) {
        completion(.success(Int.random(in: -100...100)))
    }
}
