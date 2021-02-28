//
//  CloudEyeAPIClient.swift
//  State of The Cloud
//
//  Created by Dmitry Aksyonov on 27.02.2021.
//

import Foundation
import Moya

final class CloudEyeAPIClient {
	
	private func JSONResponseDataFormatter(_ data: Data) -> String {
		do {
			let dataAsJSON = try JSONSerialization.jsonObject(with: data)
			let prettyData = try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
			return String(data: prettyData, encoding: .utf8) ?? String(data: data, encoding: .utf8) ?? ""
		} catch {
			return String(data: data, encoding: .utf8) ?? ""
		}
	}
	
	static let shared = CloudEyeAPIClient()
	private init() { }
	
	let provider = MoyaProvider<CloudEyeProvider>(plugins: [NetworkLoggerPlugin()])
	
	func getAllAPIVersions() {
		self.provider.request(.getAllAPIVersions, completion: { result in
			switch result {
			case .success(let response):
				do { debugPrint(try response.mapJSON()) } catch let error { debugPrint(error) }
			case .failure(let error):
				do {
					let body = try error.response?.mapJSON()
					debugPrint(body!)
				} catch let error {
					debugPrint(error)
				}
			}
		})
	}
}
