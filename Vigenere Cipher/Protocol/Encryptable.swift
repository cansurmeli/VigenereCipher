//
//  Encryptable.swift
//  Vigenere Cipher
//
//  Created by Can Sürmeli on 10.01.2018.
//  Copyright © 2018 Can Sürmeli. All rights reserved.
//

protocol Encryptable {
	func removePunctuation(in text: String) -> String
	func convertSpecialLetters(in text: String) -> String
	func capitalizeLetters(in text: String) -> String
	func encrypt(_ text: String) -> String
}
