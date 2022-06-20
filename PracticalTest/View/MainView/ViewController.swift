//
//  ViewController.swift
//  PracticalTest
//
//  Created by raviseta on 20/06/22.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Outlets
    
    private let refreshController = UIRefreshControl()
    @IBOutlet var tblUser: UITableView!
    var userViewModel = UserViewModel()
    var userDetail = [UserResponse]()
    
    @IBOutlet var btnAddContact: UIBarButtonItem!
    @IBOutlet var btnContact: UIBarButtonItem!
    
    //MARK: - View Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.getDataFromJsonFile { isFetchComplete in
            
        }
    }
    
    private func setupUI(){
        refreshController.addTarget(self, action: #selector(refreshDataFromFile(_:)), for: .valueChanged)
        self.navigationItem.title = "Contacts"
        if #available(iOS 10.0, *) {
            tblUser.refreshControl = refreshController
        } else {
            tblUser.addSubview(refreshController)
        }
        
        tblUser.register(UserTableViewCell.className)
        tblUser.dataSource = self
        tblUser.delegate = self
        tblUser.reload()
    }
    
    //MARK: - Custom Methods
    
    private func getDataFromJsonFile(completion: @escaping((Bool) -> ())){
        self.userViewModel.getDataFromFile(fileName: "data") { [weak self] userResponse in
            self?.userDetail.append(contentsOf: userResponse)
            completion(true)
            self?.tblUser.reload()
        } failure: { error in
            self.showAlert(message: error)
        }
    }
    
    @objc private func refreshDataFromFile(_ sender: Any) {
        self.refreshController.beginRefreshing()
        self.getDataFromJsonFile { isFetchComplete in
            self.refreshController.endRefreshing()
        }
    }
    
}

//MARK: - TableView Datasource & Delegates

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userDetail.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.className, for: indexPath) as? UserTableViewCell else {
            fatalError("UserTableViewCell not found")
        }
        let user = userDetail[indexPath.row]
        cell.configure(user: user)
        
        return cell
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
         let objDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
         objDetailVC.userDetail = userDetail[indexPath.row]
         self.navigationController?.pushViewController(objDetailVC, animated: true)
    }
    
}
