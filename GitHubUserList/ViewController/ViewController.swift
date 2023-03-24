//
//  ViewController.swift
//  GitHubUserList
//
//  Created by 江柏毅 on 2023/3/22.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidAppear(_ animated: Bool) {
        let vc = GitHubUserListViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        
//        let vc = GitHubUserListViewController()
//        let window = UIApplication.shared.windows.first
//        window?.rootViewController = vc
//        weak var pvc = self.presentingViewController
//        self.dismiss(animated: false, completion: {
//            vc.modalPresentationStyle = .overFullScreen
//            pvc?.present(vc, animated: false, completion: nil)
//        })
//        
        
//    }


}

