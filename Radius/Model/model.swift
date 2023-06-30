//
//  model.swift
//  Radius
//
//  Created by KCD on 28/06/23.
//

import Foundation

// MARK: - Model
struct model: Codable {
    var facilities: [Facility]
    let exclusions: [[Exclusion]]
}

// MARK: - Exclusion
struct Exclusion: Codable {
    let facilityID, optionsID: String

    enum CodingKeys: String, CodingKey {
        case facilityID = "facility_id"
        case optionsID = "options_id"
    }
}

// MARK: - Facility
struct Facility: Codable {
    let facilityID, name: String
    var options: [Option]

    enum CodingKeys: String, CodingKey {
        case facilityID = "facility_id"
        case name, options
    }
}

// MARK: - Option
struct Option: Codable, Identifiable {
    let name, icon, id: String
}
