//
//  VigenereCipher+Encrpyt.swift
//  Vigenere Cipher
//
//  Created by Can Sürmeli on 11.01.2018.
//  Copyright © 2018 Can Sürmeli. All rights reserved.
//

import Foundation

extension VigenereCipher {
	func encrypt(_ plainText: String, withKey key: String) -> String {
		guard let localDecimalSeparator = Locale.current.decimalSeparator else { return "" }
		let key = key.components(separatedBy: localDecimalSeparator).map{ Int($0)! }
		
		let punctuationRemovedPlainText = removePunctuation(in: plainText)
		let specialLettersConvertedPlainText = convertSpecialLetters(in: punctuationRemovedPlainText)
		let lettersCapitalizedPlainText = upperCaseLetters(in: specialLettersConvertedPlainText)
		
		var cipherText = ""
		let alphabetSize = VigenereCipher.alphabet.count
		var keyIndex = 0
		
		for letter in lettersCapitalizedPlainText {
			let letterIndexInAlphabet = indexOfAlphabet(for: String(letter))
			let keyToEncrypt = key[keyIndex % key.count]
			let encrpytedLetterIndex = (letterIndexInAlphabet + keyToEncrypt + alphabetSize) % alphabetSize
			cipherText.append(VigenereCipher.alphabet[encrpytedLetterIndex])
			keyIndex += 1
		}
		
		return cipherText
	}
}
