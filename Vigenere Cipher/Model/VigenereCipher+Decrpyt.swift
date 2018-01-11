//
//  VigenereCipher+Decrpyt.swift
//  Vigenere Cipher
//
//  Created by Can Sürmeli on 11.01.2018.
//  Copyright © 2018 Can Sürmeli. All rights reserved.
//

import Foundation

extension VigenereCipher {
	func decrypt(_ cipherText: String, withKey key: String) -> String {
		guard let localDecimalSeparator = Locale.current.decimalSeparator else { return "" }
		let key = key.components(separatedBy: localDecimalSeparator).map{ Int($0)! }
		
		var plainText = ""
		let alphabetSize = VigenereCipher.alphabet.count
		var keyIndex = 0
		
		let processCipherText = processTextForVigenereCipher(cipherText)
		
		for letter in processCipherText {
			let letterIndexInAlphabet = indexOfAlphabet(for: String(letter))
			let keyToEncrypt = key[keyIndex % key.count]
			let encrpytedLetterIndex = (letterIndexInAlphabet - keyToEncrypt + alphabetSize) % alphabetSize
			plainText.append(VigenereCipher.alphabet[encrpytedLetterIndex])
			keyIndex += 1
		}
		
		return plainText
	}
}
