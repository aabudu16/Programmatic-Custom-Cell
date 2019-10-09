//
//  UserModel.swift
//  Programmatic-Custom-Cell
//
//  Created by Mr Wonderful on 10/8/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import Foundation

struct RandomUserWrapper: Codable {
    let results: [User]

}

// MARK: - Result
struct User: Codable {
    let name: Name
    let email: String
    let login: Login
    let dob, registered: Dob
    let phone, cell: String
    let id: ID
    let picture: Picture
    let nat: String
}

// MARK: - Dob
struct Dob: Codable {
    let date: String
    let age: Int
}

// MARK: - ID
struct ID: Codable {
    let name: String
    let value: String?
}

// MARK: - Location


// MARK: - Coordinates
struct Coordinates: Codable {
    let latitude, longitude: String
}

// MARK: - Street
struct Street: Codable {
    let number: Int
    let name: String
}

// MARK: - Login
struct Login: Codable {
    let uuid, username, password, salt: String
    let md5, sha1, sha256: String
}

// MARK: - Name
struct Name: Codable {
    let first, last: String
}

struct Picture: Codable {
    let large, medium, thumbnail: String
}
