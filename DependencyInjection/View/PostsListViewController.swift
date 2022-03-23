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
    
    //MARK: - Variables
    private let viewModel = PostsViewModel()
    private var postList: [PostModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        activity(isHidden: false)
        configureTableView()
    }
    
    //MARK: - Private Methods
    private func setupView() {
        title = "Post List"
    }
    
    private func configureTableView () {
        tableView.dataSource = self
        viewModel.getUserFromProvider { [weak self] model in
            DispatchQueue.main.async {
                self?.activity(isHidden: true)
                self?.postList = model
                self?.tableView.reloadData()
            }
        }
    }
    
    private func activity(isHidden: Bool) {
        if isHidden {
            activityView.stopAnimating()
        }else {
            activityView.startAnimating()
        }
        
        activityView.isHidden = isHidden
    }
}

//MARK: - UITableViewDataSource
extension PostsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = postList[indexPath.row]
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = user.title
        cell.textLabel?.numberOfLines = 0
        cell.detailTextLabel?.text = user.body
        cell.detailTextLabel?.numberOfLines = 0
        
        
        
        return cell
    }
}

