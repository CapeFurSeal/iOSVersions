//
//  Versions.swift
//  Created by mac on 2020/12/09.
//


import Foundation
struct Versions : Codable {
	let name : String?
	let version : String?
	let released : String?
	let image : String?

	enum CodingKeys: String, CodingKey {
		case name = "name"
		case version = "version"
		case released = "released"
		case image = "image"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		version = try values.decodeIfPresent(String.self, forKey: .version)
		released = try values.decodeIfPresent(String.self, forKey: .released)
		image = try values.decodeIfPresent(String.self, forKey: .image)
	}
}
