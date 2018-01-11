//
//  VigenereEncryptionBlock.swift
//  Vigenere Cipher
//
//  Created by Can Sürmeli on 10.01.2018.
//  Copyright © 2018 Can Sürmeli. All rights reserved.
//

struct VigenereEncrpytionBlock: Encryptable {
	let plainText: String
	let key: [Int]
	var cipherText: String!

	init(plainText: String, key: String) {
		self.plainText = plainText
		self.key = key.components(separatedBy: ".").map{ Int($0)! }
		
		let punctuationRemovedPlainText = removePunctuation(in: plainText)
		let specialLettersConvertedPlainText = convertSpecialLetters(in: punctuationRemovedPlainText)
		let lettersCapitalizedPlainText = upperCaseLetters(in: specialLettersConvertedPlainText)
		
		cipherText = encrypt(lettersCapitalizedPlainText)
	}
	
	func removePunctuation(in text: String) -> String {
		return text.components(separatedBy: .punctuationCharacters).joined()
	}
	
	func convertSpecialLetters(in text: String) -> String {
		return text.folding(options: .diacriticInsensitive, locale: nil)
	}
	
	func upperCaseLetters(in text: String) -> String {
		return text.uppercased()
	}
	
	func encrypt(_ text: String) -> String {
		var cipherText = ""
		let alphabetSize = VigenereCipher.alphabet.count
		var keyIndex = 0
		
		for letter in text {
			let letterIndexInAlphabet = indexOfAlphabet(for: String(letter))
			let keyToEncrypt = key[keyIndex % key.count]
			let encrpytedLetterIndex = (letterIndexInAlphabet + keyToEncrypt + alphabetSize) % alphabetSize
			cipherText.append(VigenereCipher.alphabet[encrpytedLetterIndex])
			keyIndex += 1
		}
		
		return cipherText
	}
	
	private func indexOfAlphabet(for letter: String) -> Int {
		var index = 0
		
		for alphabetLetter in VigenereCipher.alphabet {
			if letter == alphabetLetter {
				return index
			}
			
			index += 1
		}
		
		return -1
	}
}
