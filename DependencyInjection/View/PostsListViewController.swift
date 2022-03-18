//
//  PostsListViewController.swift
//  DependencyInjection
//
//  Created by Maiqui Cedeño on 17/03/22.
//

import UIKit

class PostsListViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        configureTableView()
        
    }
    
    //MARK: - Private Methods
    private func setupView() {
        title = "Post List"
    }
    
    private func configureTableView () {
        tableView.dataSource = self
        
    }
}

//MARK: - UITableViewDataSource
extension PostsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        return cell
    }
}

