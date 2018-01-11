//
//  VigenereCipherVC+UITextFieldDelegate.swift
//  Vigenere Cipher
//
//  Created by Can Sürmeli on 11.01.2018.
//  Copyright © 2018 Can Sürmeli. All rights reserved.
//

import UIKit

extension VigenereCipherVC: UITextFieldDelegate {
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		if textField == plainTextField {
			cipherTextField.becomeFirstResponder()
		} else if textField == cipherTextField {
			keyTextField.becomeFirstResponder()
		} else if textField == keyTextField {
			textField.resignFirstResponder()
		}
		
		return false
	}
	
	func textFieldDidBeginEditing(_ textField: UITextField) {
		currentTextField = textField
		
		if textField == keyTextField {
			UIView.animate(withDuration: 0.3) {
				self.stackViewVerticalConstraint.constant = -100
				self.view.layoutIfNeeded()
			}
		}
	}
	
	func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
		if textField == keyTextField {
			UIView.animate(withDuration: 0.3) {
				self.stackViewVerticalConstraint.constant = 0
				self.view.layoutIfNeeded()
			}
		}
	}
}
