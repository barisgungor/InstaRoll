//
//  ProfileViewController.swift
//  InstaRoll
//
//  Created by Barış Güngör on 11.06.2020.
//  Copyright © 2020 Barış Güngör. All rights reserved.
//

import UIKit



class ProfileViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    //    MARK : -Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        // Do any additional setup after loading the view.
    }
    
    
    @objc func showSettings(){
        
        
        
    }

    func configureUI(){
        view.backgroundColor = .white
        configureNavigationBar()
        configureTableView()
        
        
        let image = UIImage(systemName: "line.horizontal.3")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(showSettings))
        
        
        
    }
    
    func configureTableView(){
          tableView.backgroundColor = .white
//          tableView.rowHeight = 80
//          tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
         tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
          tableView.tableFooterView = UIView()
          tableView.delegate = self
          tableView.dataSource = self
          
      }
    
    
    
    func configureNavigationBar(){
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.backgroundColor = .white
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Profile"
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.isTranslucent = true
        
        navigationController?.navigationBar.overrideUserInterfaceStyle = .dark
        
        
    }


}
extension ProfileViewController : UITableViewDelegate, UITableViewDataSource{
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
      func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
    
        if indexPath.row == 0{
            return CGFloat(200)
        }
        if indexPath.row == 1{
            return CGFloat(125)
        }
        if indexPath.row == 2{
            return CGFloat(125)
        }
        if indexPath.row == 3{
            return CGFloat(125)
        }
        if indexPath.row == 4{
            return CGFloat(125)
        }
        
        return CGFloat()
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch indexPath.row {
        case 0:
            self.tableView.register(UINib(nibName: "TopStatusTableViewCell", bundle: nil), forCellReuseIdentifier: "TopStatusTableViewCell")
            let cell = tableView.dequeueReusableCell(withIdentifier: "TopStatusTableViewCell", for: indexPath) as! TopStatusTableViewCell
            return cell
        case 1:
            self.tableView.register(UINib(nibName: "GainLoseFollowersTableViewCell", bundle: nil), forCellReuseIdentifier: "GainLoseFollowersTableViewCell")
            let cell = tableView.dequeueReusableCell(withIdentifier: "GainLoseFollowersTableViewCell", for: indexPath) as! GainLoseFollowersTableViewCell
            cell.rightViewTitle.text = "Kazanılan Takipçiler"
            cell.leftViewTitle.text = "Kaybedilen Takipçiler"
            
            return cell
        case 2:
            self.tableView.register(UINib(nibName: "GainLoseFollowersTableViewCell", bundle: nil), forCellReuseIdentifier: "GainLoseFollowersTableViewCell")
            let cell = tableView.dequeueReusableCell(withIdentifier: "GainLoseFollowersTableViewCell", for: indexPath) as! GainLoseFollowersTableViewCell
                cell.rightViewTitle.text = "Beni Takip Etmeyen"
                cell.leftViewTitle.text = "Benim Takip Etmediğim"
                       return cell
        case 3:
            self.tableView.register(UINib(nibName: "GainLoseFollowersTableViewCell", bundle: nil), forCellReuseIdentifier: "GainLoseFollowersTableViewCell")
            let cell = tableView.dequeueReusableCell(withIdentifier: "GainLoseFollowersTableViewCell", for: indexPath) as! GainLoseFollowersTableViewCell
                cell.rightViewTitle.text = "Beni Engelleyen Kullanıcılar"
                cell.leftViewTitle.text = "Hayalet Takipçiler"
                       return cell
        case 4:
            self.tableView.register(UINib(nibName: "GainLoseFollowersTableViewCell", bundle: nil), forCellReuseIdentifier: "GainLoseFollowersTableViewCell")
            let cell = tableView.dequeueReusableCell(withIdentifier: "GainLoseFollowersTableViewCell", for: indexPath) as! GainLoseFollowersTableViewCell
                cell.rightViewTitle.text = "En Çok Yorum Yapanlar"
                cell.leftViewTitle.text = "En Çok Beğenenler"
                       return cell
        default:
            return UITableViewCell()
        }
    }
    
    
    
    
    
    
}
