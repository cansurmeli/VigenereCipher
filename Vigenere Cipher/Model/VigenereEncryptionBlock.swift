//
//  VigenereEncryptionBlock.swift
//  Vigenere Cipher
//
//  Created by Can Sürmeli on 10.01.2018.
//  Copyright © 2018 Can Sürmeli. All rights reserved.
//

struct VigenereEncrpytionBlock {
	let plainText: String
	let key: [Int]
	var cipherText: String!

	init(plainText: String, key: String) {
		self.plainText = plainText
		self.key = key.components(separatedBy: ".").map{ Int($0)! }
		
		let punctuationRemovedPlainText = removePunctuation(in: plainText)
		let specialLettersConvertedPlainText = convertSpecialLetters(in: punctuationRemovedPlainText)
		let lettersCapitalizedPlainText = capitalizeLetters(in: specialLettersConvertedPlainText)
		
		cipherText = encrypt(lettersCapitalizedPlainText)
	}
	
	func removePunctuation(in text: String) -> String {
		return text.components(separatedBy: .punctuationCharacters).joined()
	}
	
	func convertSpecialLetters(in text: String) -> String {
		return text.folding(options: .diacriticInsensitive, locale: nil)
	}
	
	func capitalizeLetters(in text: String) -> String {
		return text.capitalized
	}
	
	func encrypt(_ text: String) -> String {
		return ""
	}
}
