//
//  GitHubUserListViewController.swift
//  GitHubUserList
//
//  Created by 江柏毅 on 2023/3/22.
//

import Foundation
import UIKit
import SnapKit


class GitHubUserListViewController: UIViewController {
    
    var viewModel = UserListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
       addUI()
       addConstraints()
       setView()
        viewModel.getUser(success: { [self] in
           // viewModel.users = viewModel.users
            self.tableView.reloadData()

        }, fail: {_ in})
    }
    
    
    
    
    
    func setView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        self.tableView.register(UserListTableViewCell.self, forCellReuseIdentifier: "UserListTableViewCell")
        
        if #available(iOS 11.0, *) {
            self.tableView.contentInsetAdjustmentBehavior = .never
        }
        
        if self.tableView.contentSize.height != 0 {
            let indexPath = IndexPath(row: 0, section: 0)
            self.tableView.cellForRow(at: indexPath)
            self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
        }
    }
    
    
    
    private func addUI() {
        baseView.addSubview(tableView)
        self.view.addSubview(baseView)
    }
    
    private func addConstraints() {
        baseView.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { make in
            make.left.equalTo(baseView.snp.left).offset(0)
            make.right.equalTo(baseView.snp.right).offset(0)
            make.top.equalTo(baseView.snp.top).offset(0)
            make.bottom.equalTo(baseView.snp.bottom).offset(0)
        }
    }
    
    private var baseView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blue
        return view
    }()
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    
}



extension GitHubUserListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserListTableViewCell", for: indexPath) as! UserListTableViewCell
        cell.bind(users: viewModel.users[indexPath.row])
        
        return cell
    }
    
    
}
