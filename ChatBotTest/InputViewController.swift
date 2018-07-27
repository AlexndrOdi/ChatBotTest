//
//  InputViewController.swift
//  ChatBotTest
//
//  Created by Alex Odintsov on 27.07.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import UIKit

protocol InputViewDelegate: class {
    func updateMessages(_ text: String)
}

class InputViewController: UIViewController {

    // MARK: - Properties

    weak var delegate: InputViewDelegate?

    // MARK: - IBOutlets

    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    // MARK: - View lifi cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    // MARK: - IBActions

    @IBAction func sendMessage(_ sender: UIButton) {
        sender.resignFirstResponder()
        inputField.resignFirstResponder()
        if let userText = inputField.text {
            delegate?.updateMessages(userText)
        }
        inputField.text = nil
    }
}

// MARK: - UITextFieldDelegate
