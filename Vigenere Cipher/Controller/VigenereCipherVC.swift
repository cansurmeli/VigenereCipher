//
//  VigenereCipherVC.swift
//  Vigenere Cipher
//
//  Created by Can Sürmeli on 11.01.2018.
//  Copyright © 2018 Can Sürmeli. All rights reserved.
//

import UIKit

class VigenereCipherVC: UIViewController {
	@IBOutlet weak var plainTextField: UITextField!
	@IBOutlet weak var cipherTextField: UITextField!
	@IBOutlet weak var keyTextField: UITextField!
	
	@IBOutlet weak var encryptButton: UIButton!
	@IBOutlet weak var decryptButton: UIButton!
	@IBOutlet weak var breakButton: UIButton!
	
	@IBOutlet weak var stackViewVerticalConstraint: NSLayoutConstraint!
	
	private let vigenereCipher = VigenereCipher()
	var currentTextField: UITextField!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		plainTextField.delegate = self
		cipherTextField.delegate = self
		keyTextField.delegate = self
		
		plainTextField.attributedPlaceholder = NSAttributedString(string: "plaintext",
																															attributes: [.foregroundColor: UIColor(named: "BabyPowder")!])
		
		cipherTextField.attributedPlaceholder = NSAttributedString(string: "ciphertext",
																															attributes: [.foregroundColor: UIColor(named: "BabyPowder")!])
		
		guard let localDecimalSeparator = Locale.current.decimalSeparator else { return }
		keyTextField.attributedPlaceholder = NSAttributedString(string: "key (e.g. 10\(localDecimalSeparator)4\(localDecimalSeparator)24)",
																														attributes: [.foregroundColor: UIColor(named: "BabyPowder")!])
		
		let keyboardDismissOnSwipeGesture = UISwipeGestureRecognizer(target: self,
																																 action: #selector(dismissKeyboard))
		keyboardDismissOnSwipeGesture.direction = .down
		view.addGestureRecognizer(keyboardDismissOnSwipeGesture)
		
		let keyboardDismissOnTapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
		view.addGestureRecognizer(keyboardDismissOnTapGesture)
	}
	
	@objc private func dismissKeyboard() {
		guard let currentTextField = currentTextField else { return }
		
		currentTextField.resignFirstResponder()
	}
	
	// Shake to reset
	override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
		plainTextField.text = ""
		cipherTextField.text = ""
		keyTextField.text = ""
	}
	
	@IBAction func performEncryption(_ sender: UIButton) {
		dismissKeyboard()
		
		guard let plainText = plainTextField.text,
					let key = keyTextField.text,
					!plainText.isEmpty,
					!key.isEmpty
			else { return }
		
		cipherTextField.text = vigenereCipher.encrypt(plainText, withKey: key)
	}
	
	@IBAction func performDecryption(_ sender: UIButton) {
		dismissKeyboard()
		
		guard let cipherText = cipherTextField.text,
					let key = keyTextField.text,
					!cipherText.isEmpty,
					!key.isEmpty
			else { return }
		
		plainTextField.text = vigenereCipher.decrypt(cipherText, withKey: key)
	}
	
}
