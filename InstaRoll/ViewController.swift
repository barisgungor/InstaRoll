//
//  ViewController.swift
//  InstaRoll
//
//  Created by Barış Güngör on 9.06.2020.
//  Copyright © 2020 Barış Güngör. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var mail: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var code: UITextField!
    let handler : APIHandler = APIHandler()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonAction(_ sender: Any) {
        
        let login = LoginWebViewController { controller, result in
            controller.dismiss(animated: true, completion: nil)
            // deal with authentication response.
            
            
            guard let (response, _) = try? result.get() else { return print("Login failed.") }
            print("Login successful.")
            // persist cache safely in the keychain for logging in again in the future.
            guard let key = response.persist() else { return print("`Authentication.Response` could not be persisted.") }
            // store the `key` wherever you want, so you can access the `Authentication.Response` later.
            // `UserDefaults` is just an example.
            UserDefaults.standard.set(key, forKey: "current.account")
            UserDefaults.standard.synchronize()
        }
        if #available(iOS 13, *) {
            present(login, animated: true, completion: nil) // just swipe down to dismiss.
        } else {
            present(UINavigationController(rootViewController: login),  // already adds a `Cancel` button to dismiss it.
                    animated: true,
                    completion: nil)
        }
        
    }
    @IBAction func buttonCodeAction(_ sender: Any) {
        // in our example, we stored it in `UserDefaults`.
        guard let key = UserDefaults.standard.string(forKey: "current.account") else { return print("`key` not found.") }
        
//        print(key)
        // recover the safely persisted `Authentication.Response`.
        guard let cache = Authentication.Response.persisted(with: key) else { return print("`Authentication.Response` not found.") }
        
        print("\(cache.self)")
        print(cache.identifier)
        handler.authenticate(with: .cache(cache)) { result in
            do{



            }catch{

                print(error)

            }

        }
        
    
        
        
      
        
        
        
        
        handler.users.following(user: .me,
        with: .init(maxPagesToLoad: .max),
        updateHandler: nil,
        completionHandler: { response, error in
            do{
                let responseArray = try! response.get()

                for index in responseArray{
//                    print("\(index.username)" + "  " + "\(index.name!)" + "  " + "\(index.thumbnail!)"  + "  " + "\(index.friendship?.isFollowingYou)")
                    self.handler.users.friendshipStatus(withUser: .username(index.username), completionHandler: {res in
                        
                        guard let status = try? res.get() else {
                            
                            return}
                        print("ADI:  \(index.username) " + "Takip etme durumu: \(status.isFollowingYou!)" + " " + " Benim takip etme durmum: \(status.isFollowedByYou)" + " " + "Yakın Arkadaş Durmu: \(status.isInYourCloseFriendsList)")
                      
                        
                     })
            }
               
                
                
            }catch{
                
                print(error)
                
            }
        })
        
//        handler.messages.inbox(with: .init(maxPagesToLoad: .max),
//        updateHandler: nil,
//        completionHandler: { response, error in
//
//            do{
//                 let responseArray = try response.get()
//
//                for index in responseArray{
//                    print(index.messages)
//                }
//
//            }catch{
//
//                print(error)
//            }
//
//        })
//
//
//        handler.media.by(user: handler.user!.reference, with: .init(maxPagesToLoad: .max),
//        updateHandler: nil,
//        completionHandler: { response, error in
//
//            do{
//                 let responseArray = try response.get()
//
//                for index in responseArray{
//                    print(index.content)
//                }
//
//            }catch{
//
//                print(error)
//            }
//
//        })
        
//        handler.stories.viewers(forStory: "2w1313", with: .init(maxPagesToLoad: .max), updateHandler: { (viewers, users, pag, userslar) in
//
//        }) { (response, <#PaginationParameters#>) in
//            <#code#>
//        }
        
//        handler.stories.reelBy(user: handler.user!.reference) { (response) in
//            
//            do{
//                 let responseArray = try response.get()
//                
//            
//                for index in responseArray.items{
//                print( index.cover?.rawResponse)
//                   
//                }
//
//            }catch{
//                
//                print(error)
//                
//            }
//
//            
//        }
        
    }
    
    
    
    
}

