//
//  Bundle+VersionNumber.swift
//  Vigenere Cipher
//
//  Created by Can Sürmeli on 11.01.2018.
//  Copyright © 2018 Can Sürmeli. All rights reserved.
//

import Foundation

extension Bundle {
	///    Retrieves the `infoDictionary` dictionary inside Bundle and
	/// returns the value accessed with the key `CFBundleShortVersionString`.
	///
	/// - Returns: the version number of the Xcode project as a whole(e.g. 1.0.3)
	class func versionNumber() -> String {
		guard let infoDictionary = Bundle.main.infoDictionary else { return "unknown" }
		guard let versionNumber = infoDictionary["CFBundleShortVersionString"] as? String else { return "unknwon" }
		
		return versionNumber
	}
}
