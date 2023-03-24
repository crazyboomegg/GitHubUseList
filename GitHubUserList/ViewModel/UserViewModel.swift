//
//  UserViewModel.swift
//  GitHubUserList
//
//  Created by 江柏毅 on 2023/3/24.
//

import Foundation


class UserViewModel {
    var user: User
    
    var name: String {
        return user.name ?? ""
    }
    
    var image: String {
        return user.image ?? ""
    }
    
    var staff: Bool {
        return user.staff ?? false
    }
    
    init(user: User) {
        self.user = user
    }
}
