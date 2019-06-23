//
//  ChatViewController.swift
//  Calmy
//
//  Created by Booharin on 22/06/2019.
//  Copyright © 2019 Booharin. All rights reserved.
//

import UIKit

class ChatViewController: UITableViewController {
    
    var presenter: ChatPresenterInput!
    private let rowHeight: CGFloat = 44
    private let headerHeight: CGFloat = 50
    private let bottomOffset: CGFloat = 100
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = Constants.Colors.backgroundChatColor
        presenter.createCustomStatusBarView()
        setTableView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        presenter.removeGradientLayer()
    }
    
    private func setTableView() {
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = true
        tableView.estimatedRowHeight = rowHeight
        tableView.rowHeight = UITableView.automaticDimension
        tableView.sectionHeaderHeight = headerHeight
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: bottomOffset, right: 0)
        
        tableView.register(UINib(nibName: "CalmyViewCell", bundle: nil),
                           forCellReuseIdentifier: "CalmyViewCell")
        tableView.register(UINib(nibName: "UserViewCell", bundle: nil),
                           forCellReuseIdentifier: "UserViewCell")
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: headerHeight))
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.messages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = presenter.messages[indexPath.row]
        switch message.type {
        case .calmy:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CalmyViewCell",
                                                           for: indexPath) as? CalmyViewCell else { return UITableViewCell() }
            cell.messageLabel.text = message.text
            return cell
        case .user:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserViewCell",
                                                           for: indexPath) as? UserViewCell else { return UITableViewCell() }
            cell.messageLabel.text = message.text
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.inComingMessage()
        didUpdateMessages()
    }
    
    private func scrollToBottom(row: Int) {
        let indexPath = IndexPath(row: row,
                                  section: 0)
        self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
    }
}

extension ChatViewController: ChatPresenterOutput {
    
    func didUpdateMessages() {
        let row = presenter.getLastMessageRow()
        
        let indexPath = IndexPath(row: row, section: 0)
        DispatchQueue.main.async {
            self.tableView.insertRows(at: [indexPath], with: .fade)
            self.scrollToBottom(row: row)
        }
    }
}


