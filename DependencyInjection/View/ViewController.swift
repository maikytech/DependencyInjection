//
//  ViewController.swift
//  DependencyInjection
//
//  Created by Maiqui Cedeño on 17/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func openListPressed(_ sender: Any) {
        let vc = PostsListViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

