//
//  UserTableViewCell.swift
//  PracticalTest
//
//  Created by raviseta on 20/06/22.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet var lblFullName: UILabel!
    @IBOutlet var ivProfileImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ivProfileImage.layer.cornerRadius = ivProfileImage.frame.size.height / 2
    }
    
    func configure(user: UserResponse){
        self.lblFullName.text = "\(user.firstName) \(user.lastName)"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
