//
//  MessageCell.swift
//  ChatBotTest
//
//  Created by Alex Odintsov on 27.07.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    // MARK: - IBOutlets

    @IBOutlet weak var message: UILabel!

    // MARK: - View life cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    // MARK: - Functions

    func update(_ message: Message) {
        self.message.text = message.text
    }
}

extension MessageCell {
    static var identifier: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
