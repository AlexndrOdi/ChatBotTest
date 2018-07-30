//
//  BotService.swift
//  ChatBotTest
//
//  Created by Alex Odintsov on 27.07.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import Foundation

class BotService {

    // MARK: - Enums

    enum RequestMethod: String {
        case post = "POST"
        case get = "GET"
    }
    // MARK: - Consts
    struct Consts {
        static let baseUrl = "http://zenbot-mts.just-ai.com/chatadapter"
        static let token = "f4057953-52bd-4795-a0ea-b355a7d2ae2d"
        let clientId = 123
    }

    // MARK: - Properties

    static let shared = BotService()
    let session = URLSession.shared

    // MARK: - Functions

    func greeting() -> Message {
        return Message(text: "Привет! Что случилось?")
    }

    func sendAnswer(_ text: String) {
        
    }

    func getResponse() {
        //
    }
}

// MARK: - HttpSession

extension BotService {
    func testRequest() {
        let userData = UserResponse(clientId: "132", query: "болит", clientInfo: nil, data: nil, timestamp: nil)
        let json = try? JSONEncoder().encode(userData)

        let fullString = Consts.baseUrl + "/chatapi/\(Consts.token)"
        guard let fullURL = URL(string: fullString) else {return}
        var request = URLRequest(url: fullURL)
        request.httpMethod = RequestMethod.post.rawValue
        request.httpBody = json

        session.dataTask(with: request) { (data, response, error) in
            print(data?.description)
            print("--------------")
            print(response)
            print("--------------")
            print(error)
        }.resume()
    }
}
