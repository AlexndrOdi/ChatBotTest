//
//  ChatViewController.swift
//  ChatBotTest
//
//  Created by Alex Odintsov on 27.07.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {

    // MARK: - Properties

    var messages: [Message] = []
    var bottomConstraint: NSLayoutConstraint?

    // MARK: - IBOutlets

    @IBOutlet weak var chatTableView: UITableView!
    @IBOutlet weak var viewContainer: UIView!

    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyBoardNotification),
                                               name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyBoardNotification),
                                               name: NSNotification.Name.UIKeyboardWillHide, object: nil)

        bottomConstraint = NSLayoutConstraint(item: viewContainer, attribute: .bottom, relatedBy: .equal,
                                              toItem: view, attribute: .bottom, multiplier: 1, constant: 0)
        view.addConstraint(bottomConstraint!)

        if let inputDelegate = self.childViewControllers.first as? InputViewController {
            inputDelegate.delegate = self
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        messages.append(BotService.shared.greeting())
        chatTableView.reloadData()
    }
    // MARK: - Private functions

    @objc func handleKeyBoardNotification(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            let isKeyBoardShowing = notification.name == NSNotification.Name.UIKeyboardWillShow
            
            guard let keyBoardFrame = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect else {
                return
            }
            bottomConstraint?.constant = isKeyBoardShowing ? -keyBoardFrame.height : 0
            
            UIView.animate(withDuration: 0, delay: 0, options: .curveEaseInOut, animations: {
                self.view.layoutIfNeeded()
            }, completion: {(completed) in
                if isKeyBoardShowing, self.messages.count != 0 {
                    let indexPath = IndexPath(item: (self.messages.count) - 1, section: 0)
                    self.chatTableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
                }
            })
        }
    }
}

// MARK: - UITableViewDataSource

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MessageCell.identifier, for: indexPath) as? MessageCell else {
            fatalError("The dequeued cell is not an instance of MessageCell")
        }

        cell.update(messages[indexPath.row])

        return cell
    }
}

// MARK: - UITableViewDelegate

extension ChatViewController: UITableViewDelegate {
}

// MARK: - InputViewDelegate

extension ChatViewController: InputViewDelegate {
    func updateMessages(_ text: String) {
        messages.append(Message(text: text))
        chatTableView.reloadData()
    }
}
