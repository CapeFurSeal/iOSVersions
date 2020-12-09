//
//  IosVersions.swift
//  Created by mac on 2020/12/09.
//

import Foundation

struct IosVersions : Codable {
	let versions : [Versions]?

	enum CodingKeys: String, CodingKey {
		case versions = "versions"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		versions = try values.decodeIfPresent([Versions].self, forKey: .versions)
	}
}
