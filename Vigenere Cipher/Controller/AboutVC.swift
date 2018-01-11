//
//  AboutVC.swift
//  Vigenere Cipher
//
//  Created by Can Sürmeli on 11.01.2018.
//  Copyright © 2018 Can Sürmeli. All rights reserved.
//

import UIKit

class AboutVC: UIViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
		
		title = "About"
	}
	
	@IBAction func dismissAboutVC(_ sender: UIBarButtonItem) {
		dismiss(animated: true, completion: nil)
	}
}
