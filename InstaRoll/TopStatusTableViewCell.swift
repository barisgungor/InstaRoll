//
//  TopStatusTableViewCell.swift
//  InstaRoll
//
//  Created by Barış Güngör on 11.06.2020.
//  Copyright © 2020 Barış Güngör. All rights reserved.
//

import UIKit

class TopStatusTableViewCell: UITableViewCell {

    @IBOutlet weak var profilePhoto: UIImageView!
    @IBOutlet weak var followNumber: UILabel!
    @IBOutlet weak var followLabel: UILabel!
    @IBOutlet weak var followerNumber: UILabel!
    @IBOutlet weak var followerLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
                profilePhoto.layer.borderWidth = 2
                profilePhoto.layer.borderColor = UIColor.black.cgColor
                selectionStyle = .none
    }

  
    
}
