//
//  MoneyJudgeTests.swift
//  UnitTestPracticeTests
//
//  Created by LoganMacMini on 2024/2/7.
//

import XCTest
@testable import UnitTestPractice

final class MoneyJudgeTests: XCTestCase {
    func testInitSuccess() {
        // 3A: Arrange, Action, Assert
        
        // Arrange
        let sut = MoneyJudge()
        
        // Action
        
        // Assert
        XCTAssertNotNil(sut)
    }
    
    func testInput1AndReturnRichLevel() {
        // Arrange
        let sut = MoneyJudge()
        
        // Action
        let level = sut.moneyLevel(amount: 1)
        
        // Assert
        XCTAssertEqual(level, .rich)
    }
    
    func testInput0AndReturnNormalLevel() {
        // Arrange
        let sut = MoneyJudge()
        
        // Action
        let level = sut.moneyLevel(amount: 0)
        
        // Assert
        XCTAssertEqual(level, .normal)
    }
    
    func testInputMinusAndReturnPoorLevel() {
        // Arrange
        let sut = MoneyJudge()
        
        // Action
        let level = sut.moneyLevel(amount: -1)
        
        // Assert
        XCTAssertEqual(level, .poor)
    }
    
    func testInputInfiteNumberAndReturnRichLevel() {
        // Arrange
        let sut = MoneyJudge()
        
        // Action
        let level = sut.moneyLevel(amount: .max)
        
        // Assert
        XCTAssertEqual(level, .rich)
    }
}
