//
//  Hrlpers.swift
//  State of The Cloud
//
//  Created by Dmitry Aksyonov on 27.02.2021.
//

import Foundation

class Helpers {
	
	class func getBundleValueByKey(_ key: String) -> String {
		return Bundle.main.infoDictionary?[key] as? String ?? ""
	}
	
	class func getBundleValueByKeyAsURL(_ key: String) -> URL {
		var uriString = Bundle.main.infoDictionary?[key] as? String ?? ""
		
		if key == "BASE_URL" {
			uriString = "https://" + uriString
		}
		
		let url = URL(string: uriString)
		
		if let url = url {
			return url
		} else {
			return URL(string: Helpers.getBundleValueByKey("BASE_URL") as? String ?? "")!
		}
	}
}
