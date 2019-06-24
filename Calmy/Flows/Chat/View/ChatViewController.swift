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
    private var userButtons = [UIView]()
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = Constants.Colors.backgroundChatColor
        presenter.createCustomStatusBarView()
        setTableView()
        addUserButton(to: -50)
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
    
    private func addUserButton(to bottomOffset: CGFloat) {
        let userView = UIView()
        userView.translatesAutoresizingMaskIntoConstraints = false
        userView.backgroundColor = Constants.Colors.userMessageBackgroundColor
        userView.layer.cornerRadius = 15
        userView.layer.borderColor = Constants.Colors.userMessageBackgroundColor.cgColor
        userView.layer.borderWidth = 0.25
        view.addSubview(userView)
        
        let margins = view.layoutMarginsGuide
        userView.leadingAnchor.constraint(greaterThanOrEqualTo: margins.leadingAnchor, constant: 80).isActive = true
        userView.trailingAnchor.constraint(equalTo: margins.trailingAnchor,constant: 8).isActive = true
        userView.bottomAnchor.constraint(equalTo: margins.bottomAnchor,constant: bottomOffset).isActive = true
        
        let label = UILabel()
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "I'm ok, it's done"
        label.numberOfLines = 0
        label.textColor = .white
        userView.addSubview(label)
        label.leadingAnchor.constraint(equalTo: userView.leadingAnchor, constant: 10).isActive = true
        label.trailingAnchor.constraint(equalTo: userView.trailingAnchor, constant: -10).isActive = true
        label.topAnchor.constraint(equalTo: userView.topAnchor, constant: 7).isActive = true
        label.bottomAnchor.constraint(equalTo: userView.bottomAnchor, constant: -7).isActive = true
        
        let tap = UIGestureRecognizer(target: self, action: #selector(userTap))
        userView.addGestureRecognizer(tap)
        userView.isUserInteractionEnabled = true
        
        userButtons.append(userView)
    }
    
    @objc func userTap() {
        presenter.inComingMessage()
        didUpdateMessages()
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


