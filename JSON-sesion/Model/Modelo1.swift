//
//  Modelo1.swift
//  JSON-sesion
//
//  Created by Jonathan Casillas on 15/08/23.
//

import Foundation


//struct Modelo1: Decodable {
//    var name: String
//    var id: Int
//    var email: String
//    var address: Address
//}
//
//struct Address: Decodable {
//    var street: String
//    var geo : Geo
//}
//
//struct Geo: Decodable {
//    var lat: String
//}

struct Modelo1: Codable {
    let id: Int
    let name, username, email: String
    let address: Address
    let phone, website: String
    let company: Company
}


struct Address: Codable {
    let street, suite, city, zipcode: String
    let geo: Geo
}


struct Geo: Codable {
    let lat, lng: String
}


struct Company: Codable {
    let name, catchPhrase, bs: String
}
