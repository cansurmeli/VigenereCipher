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
	
	private let vigenereCipher = VigenereCipher()
	var currentTextField: UITextField!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		title = "Vigenère Cipher"
		
		plainTextField.delegate = self
		keyTextField.delegate = self
		
		guard let localDecimalSeparator = Locale.current.decimalSeparator else { return }
		keyTextField.placeholder = "key (e.g. 10\(localDecimalSeparator)4\(localDecimalSeparator)24)"
		
		let keyboardDismissOnSwipeGesture = UISwipeGestureRecognizer(target: self,
																																 action: #selector(dismissKeyboard))
		keyboardDismissOnSwipeGesture.direction = .down
		view.addGestureRecognizer(keyboardDismissOnSwipeGesture)
		
		let keyboardDismissOnTapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
		view.addGestureRecognizer(keyboardDismissOnTapGesture)
		
		let infoButton = UIButton(type: .infoLight)
		navigationItem.rightBarButtonItem = UIBarButtonItem(customView: infoButton)
	}
	
	@objc private func dismissKeyboard() {
		guard let currentTextField = currentTextField else { return }
		
		currentTextField.resignFirstResponder()
	}
	
	@IBAction func performEncryption(_ sender: UIButton) {
		guard let plainText = plainTextField.text,
					let key = keyTextField.text,
					!plainText.isEmpty,
					!key.isEmpty
			else { return }
		
		cipherTextField.text = vigenereCipher.encrypt(plainText, withKey: key)
	}
}
