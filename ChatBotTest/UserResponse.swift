//
//  UserResponse.swift
//  ChatBotTest
//
//  Created by Alex Odintsov on 27.07.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import Foundation

struct UserResponse: Codable {
    var clientId: String
    var query: String
    var clientInfo: ClientInfo?
    var data: Data?
    var timestamp: String? = "YYYY-MM- DDThh:mm:ss.sss"

    struct ClientInfo: Codable {
        var firstName: String?
        var lastName: String?
    }
}
