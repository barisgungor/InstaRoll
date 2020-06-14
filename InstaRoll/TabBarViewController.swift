//
//  TabBarViewController.swift
//  InstaRoll
//
//  Created by Barış Güngör on 11.06.2020.
//  Copyright © 2020 Barış Güngör. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        selectedIndex = 1
        let appearance = tabBar.standardAppearance
        appearance.shadowImage = nil
        appearance.shadowColor = nil
        appearance.backgroundColor = .white
        tabBar.standardAppearance = appearance;

    }
    

  

}
