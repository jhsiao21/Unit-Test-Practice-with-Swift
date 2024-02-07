//
//  ViewModelTests.swift
//  UnitTestPracticeTests
//
//  Created by LoganMacMini on 2024/2/7.
//

import XCTest
@testable import UnitTestPractice

class ViewModelTests: XCTestCase {

    func testInitAndNotNil() {
        // Arrange
        let provider = MockDataProvider(result: .success(0))
        let sut = ViewModel(dataProvider: provider)
        
        // Action
        
        // Assert
        XCTAssertNotNil(sut)
    }
    
    func testFetchSuccess() {
        // Arrange
        let provider = MockDataProvider(result: .success(0))
        let sut = ViewModel(dataProvider: provider)
        
        //Spy去接sut.fetchMoney()的callback結果
        let spy = SpyDelegate()
        sut.delegate = spy
        
        // Action
        sut.fetchMoney()
        
        // Assert
        XCTAssertNotNil(spy.capturedAmount)
        XCTAssertEqual(spy.capturedAmount, 0)
        XCTAssertNil(spy.capturedError)
    }
    
    func testFetchFailure() {
        // Arrange
        let provider = MockDataProvider(result: .failure(NSError(domain: "", code: 0)))
        let sut = ViewModel(dataProvider: provider)
        
        //Spy去接sut.fetchMoney()的callback結果
        let spy = SpyDelegate()
        sut.delegate = spy
        
        // Action
        sut.fetchMoney()
        
        // Assert
        XCTAssertNil(spy.capturedAmount)
        XCTAssertNotNil(spy.capturedError)
    }
}

class MockDataProvider: ViewModelDataProvider {
    private let result: Result<Int, Error>
    
    init(result: Result<Int, Error>) {
        self.result = result
    }
    
    func fetchMyMoney(completion: @escaping (Result<Int, Error>) -> Void) {
        completion(result)
    }
}

class SpyDelegate: ViewModelDelegate {
    private(set) var capturedAmount: Int?
    private(set) var capturedError: Error?
    
    func viewModel(_ vm: UnitTestPractice.ViewModel, didReceiveMoneyAmount amount: Int) {
        capturedAmount = amount
    }
    
    func viewModel(_ vm: UnitTestPractice.ViewModel, didReceiveError error: Error) {
        capturedError = error
    }
}
