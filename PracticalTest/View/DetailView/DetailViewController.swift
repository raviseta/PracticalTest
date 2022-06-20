//
//  DetailViewController.swift
//  PracticalTest
//
//  Created by raviseta on 20/06/22.
//

import UIKit

class DetailViewController: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet var ivProfile: UIImageView!
    @IBOutlet var txtFirstName: UITextField!
    @IBOutlet var txtLastName: UITextField!
    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var txtPhone: UITextField!
    
    var userDetail : UserResponse?
    
    //MARK: - View cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    private func setupUI(){
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save",
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: #selector(saveAction))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel",
                                                                style: .plain,
                                                                 target: self,
                                                                 action: #selector(cancelAction))
        ivProfile.layer.cornerRadius = ivProfile.frame.size.height / 2
        txtFirstName.text = userDetail?.firstName
        txtLastName.text = userDetail?.lastName
        txtEmail.text = userDetail?.email
        txtPhone.text = userDetail?.phone

    }
    
    //MARK: - Custom Methods
    
    func validate() -> Bool{
        if(txtFirstName.text!.isEmpty || txtLastName.text!.isEmpty ){
            return false
        }
        return true
    }
   
    @objc func saveAction(_ sender : Any){
        if validate() == true{
            
        }
    }
    
    @objc func cancelAction(_ sender : Any){
        self.navigationController?.popViewController(animated: true)
    }

}


