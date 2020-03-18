//
//  AboutVC.swift
//  Vigenere Cipher
//
//  Created by Can Sürmeli on 11.01.2018.
//  Copyright © 2018 Can Sürmeli. All rights reserved.
//

import UIKit

class AboutVC: UIViewController {
	@IBOutlet weak var versionNumberLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		versionNumberLabel.text = Bundle.versionNumber()
	}
	
	@IBAction func dismissAboutVC(_ sender: UIBarButtonItem) {
		dismiss(animated: true, completion: nil)
	}
	
	@IBAction func visitGithubProject(_ sender: Any) {
		UIApplication.shared.open(URL(string: "https://github.com/cansurmeli/VigenereCipher")!,
															options: [:],
															completionHandler: nil)
	}
}
