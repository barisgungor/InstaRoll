//
//  GainLoseFollowersTableViewCell.swift
//  InstaRoll
//
//  Created by Barış Güngör on 11.06.2020.
//  Copyright © 2020 Barış Güngör. All rights reserved.
//

import UIKit

class GainLoseFollowersTableViewCell: UITableViewCell {
    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var leftViewTitle: UILabel!
    @IBOutlet weak var leftViewGainAndLostNumber: UILabel!
    @IBOutlet weak var leftViewNumber: UILabel!
    @IBOutlet weak var leftViewStatus: UILabel!
    
    @IBOutlet weak var rightView: UIView!
    @IBOutlet weak var rightViewTitle: UILabel!
    @IBOutlet weak var rightViewGainAndLostNumber: UILabel!
    @IBOutlet weak var rightViewNumber: UILabel!
    @IBOutlet weak var rightViewStatus: UILabel!
    
//    Beni takip eden takipçilerim
//    Beni takip etmeyen takipçilerim
//    Bloklayanlar
//    Hayalet Takipciler
    
    override func awakeFromNib() {
        super.awakeFromNib()
       setupView()
        
        
        
        
    }
    
    func setupView(){
        rightView.layer.borderWidth = 1
        rightView.layer.borderColor = UIColor.black.cgColor
        leftView.layer.borderWidth = 1
        leftView.layer.borderColor = UIColor.black.cgColor
        selectionStyle = .none
    }

    
}
