//
//  EncryptVC.swift
//  Vigenere Cipher
//
//  Created by Can Sürmeli on 10.01.2018.
//  Copyright © 2018 Can Sürmeli. All rights reserved.
//

import UIKit

class EncryptVC: UIViewController {
	@IBOutlet weak var plainTextField: UITextField!
	@IBOutlet weak var keyTextField: UITextField!
	@IBOutlet weak var encryptButton: UIButton!
	var currentTextField: UITextField!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		plainTextField.delegate = self
		keyTextField.delegate = self
		
		let keyboardDismissOnSwipeGesture = UISwipeGestureRecognizer(target: self,
																																 action: #selector(dismissKeyboard))
		keyboardDismissOnSwipeGesture.direction = .down
		view.addGestureRecognizer(keyboardDismissOnSwipeGesture)
		
		let keyboardDismissOnTapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
		view.addGestureRecognizer(keyboardDismissOnTapGesture)
	}
	
	@objc func dismissKeyboard() {
		guard let currentTextField = currentTextField else { return }
		
		currentTextField.resignFirstResponder()
	}
}
