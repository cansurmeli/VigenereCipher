//
//  VigenereCipher.swift
//  Vigenere Cipher
//
//  Created by Can Sürmeli on 11.01.2018.
//  Copyright © 2018 Can Sürmeli. All rights reserved.
//

import Foundation

struct VigenereCipher {
	static let alphabet = ["A", "B", "C",
												 "D", "E", "F",
												 "G", "H", "I",
												 "J", "K", "L",
												 "M", "N", "O",
												 "P", "Q", "R",
												 "S", "T", "U",
												 "V", "W", "X",
												 "Y", "Z"]
	
	func removePunctuation(in text: String) -> String {
		return text.components(separatedBy: .punctuationCharacters).joined()
	}
	
	func convertSpecialLetters(in text: String) -> String {
		return text.folding(options: .diacriticInsensitive, locale: nil)
	}
	
	func upperCaseLetters(in text: String) -> String {
		return text.uppercased()
	}
	
	func indexOfAlphabet(for letter: String) -> Int {
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


	

