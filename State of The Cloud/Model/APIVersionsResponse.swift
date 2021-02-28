//
//  APIVersionsResponse.swift
//  State of The Cloud
//
//  Created by Dmitry Aksyonov on 27.02.2021.
//

import Foundation

// MARK: - APIVersionsResponse

struct APIVersionsResponse: Codable {
	var versions: [Version]?
	
	enum CodingKeys: String, CodingKey {
		case versions = "versions"
	}
}

// MARK: - Version

struct Version: Codable {
	var id: String?
	var links: [Link]?
	var minVersion: String?
	var status: String?
	var updated: Date?
	var version: String?
	
	enum CodingKeys: String, CodingKey {
		case id = "id"
		case links = "links"
		case minVersion = "min_version"
		case status = "status"
		case updated = "updated"
		case version = "version"
	}
}

// MARK: - Link

struct Link: Codable {
	var href: String?
	var rel: String?
	
	enum CodingKeys: String, CodingKey {
		case href = "href"
		case rel = "rel"
	}
}
