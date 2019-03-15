//
//  RiderDataCell.swift
//  UberClone
//
//  Created by apple on 2019/3/11.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//

import UIKit

class RiderDataCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(profileImage:UIImage, userEmail:String,detailLabel:String)  {
        self.profileImage.image = profileImage
        self.userEmail.text = userEmail
        self.detailLabel.text = detailLabel
    }

}
