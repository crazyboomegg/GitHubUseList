//
//  User.swift
//  GitHubUserList
//
//  Created by 江柏毅 on 2023/3/24.
//

import Foundation
import HandyJSON

struct User: HandyJSON {
    var name: String?
    var image: String?
    var staff: Bool?
    
    
    mutating func mapping(mapper: HelpingMapper) {
        
        mapper.specify(property: &name, name: "login")
        mapper.specify(property: &image, name: "avatar_url")
        mapper.specify(property: &staff, name: "site_admin")
    
    }
}


