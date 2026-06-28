//
//  UserModel.swift
//  Notavil
//
//  Created by Julio Sampaio on 24/06/26.
//

import Foundation

struct UserModel: Codable{
    let id: String
    let email: String
    let firstName: String
    let lastName: String
    
    enum CodingKeys: String, CodingKey{
        case id
        case email
        case firstName = "first_name"
        case lastName = "last_name"
    }
}
