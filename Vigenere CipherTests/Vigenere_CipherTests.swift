//
//  Vigenere_CipherTests.swift
//  Vigenere CipherTests
//
//  Created by Can Sürmeli on 10.01.2018.
//  Copyright © 2018 Can Sürmeli. All rights reserved.
//

import XCTest
@testable import Vigenere_Cipher

class Vigenere_CipherTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
	
	func testEncryptionStringProcessing() {
		let vige = VigenereEncrpytionBlock(plainText: "Hello   < can", key: "10.2.4")
		
		print(vige.removePunctuation(in: "Hello   ! can"))
		print(vige.convertSpecialLetters(in: "cän"))
	}
    
}
