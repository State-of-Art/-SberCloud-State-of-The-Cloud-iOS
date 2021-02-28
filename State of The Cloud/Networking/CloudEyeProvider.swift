//
//  Provider.swift
//  State of The Cloud
//
//  Created by Dmitry Aksyonov on 27.02.2021.
//

import Foundation
import Moya

public enum CloudEyeProvider {
	
	static private let domain = Helpers.getBundleValueByKey("DOMAIN")
	static private let username = Helpers.getBundleValueByKey("USERNAME")
	static private let password = Helpers.getBundleValueByKey("PASSWORD")
	
	static private let projectId = Helpers.getBundleValueByKey("PROJECT_ID")
	static private let userId = Helpers.getBundleValueByKey("USER_ID")
	static private let secret = Helpers.getBundleValueByKey("SECRET_ACCESS_KEY")
	
	case getAllAPIVersions
}

extension CloudEyeProvider: TargetType {
	public var baseURL: URL {
		return Helpers.getBundleValueByKeyAsURL("BASE_URL")
	}
	
	public var path: String {
		switch self {
		case .getAllAPIVersions:
			return "/"
		}
	}
	
	public var method: Moya.Method {
		switch self {
		case .getAllAPIVersions:
			return .get
		}
	}
	
	public var sampleData: Data {
		return Data()
	}
	
	public var task: Task {
		switch self {
		case .getAllAPIVersions:
			return .requestParameters(
				parameters: [
					"username": CloudEyeProvider.username,
					"password": CloudEyeProvider.password,
					"domain": CloudEyeProvider.domain
				],
				encoding: URLEncoding.default
			)
		}
	}
	
	public var headers: [String : String]? {
		return [
			"Content-Type": "application/json",
			"X-Project-Id": CloudEyeProvider.projectId,
			"X-Auth-Token": ""
		]
	}
	
	public var validationType: ValidationType {
		return .successCodes
	}
}
