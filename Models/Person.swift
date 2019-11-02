//
//  Person.swift
//  FindACrew
//
//  Created by Joseph Rogers on 10/31/19.
//  Copyright © 2019 Joseph Rogers. All rights reserved.
//

import Foundation
//this is the model for our end of the data.
struct Person: Codable {
    let name: String
    let gender: String
    let birthYear: String
}
//this is unwrapping INTO the JSON to get into the deeper files
struct PersonSearch: Codable {
    let results: [Person]
}
