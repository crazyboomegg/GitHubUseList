//
//  UserListViewModel.swift
//  GitHubUserList
//
//  Created by 江柏毅 on 2023/3/24.
//

import Foundation


class UserListViewModel {
    
    var users = [UserViewModel]()
    
    var since = 0
    var page = 100
//since: Int = 0, page: Int = 20, 
    func getUser(since: Int = 0, page: Int = 20, success: @escaping () -> Void, fail: @escaping (String) -> Void) {
        
        self.since = since
        self.page = page

        let params = [
            "since" : self.since,
            "per_page" : self.page
        ]
        
       // let params = ["":""]
        
        ListResponse<User>.request(api: .userInfo, params: params) { res in
        guard res.isSuccess else { return }
        guard let v = res.value else { return }
        guard v.response.count != 0 else { return }
            
            var users = [UserViewModel]()
            
            for user in v.response {
                users.append(UserViewModel(user: user))
            }
            self.users = users
            return success()
        }
        
        
    }
}
