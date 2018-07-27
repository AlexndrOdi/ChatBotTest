//
//  BotService.swift
//  ChatBotTest
//
//  Created by Alex Odintsov on 27.07.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import Foundation

class BotService {

    // MARK: - Properties

    static let shared = BotService()
    

    // MARK: - Functions

    func greeting() -> Message {
        return Message(text: "Привет! Что случилось?")
    }

    func sendAnswer() {
        //
    }

    func getResponse() {
        //
    }
}
