//
//  Modelo2.swift
//  JSON-sesion
//
//  Created by Jonathan Casillas on 16/08/23.
//

import Foundation
struct Modelo2 : Decodable {
    var data : [UserList]
}

struct UserList : Decodable {
    var id : Int
    var first_name : String
    var email : String
    var avatar : String
}

