//
//  DataSource.swift
//  InstaRoll
//
//  Created by Barış Güngör on 14.06.2020.
//  Copyright © 2020 Barış Güngör. All rights reserved.
//

import Foundation

protocol DataSourceDelegate {
    func signUpDone(success: Bool, key: String?)
    func userFallowers(success: Bool, followers: [User]?)
    func userFallowed(success: Bool, followed: [User]?)
    func whoNotFollowingYou(success: Bool, users: [User]?)
    func youNotFollowingWho(success: Bool, users: [User]?)
}

extension DataSourceDelegate {
    
    func signUpDone(success: Bool, key: String?){return}
    func userFallowers(success: Bool, followers: [User]?){return}
    func userFallowed(success: Bool, followed: [User]?){return}
    func whoNotFollowingYou(success: Bool, users: [User]?){return}
    func youNotFollowingWho(success: Bool, users: [User]?){return}
}

class DataSource{
    
    private init(){}
    
    static let shared = DataSource()
    var delegate : DataSourceDelegate!
    let handler : APIHandler = APIHandler()
    fileprivate lazy var dateFormatter : DateFormatter = {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    func checkSignIn(){
        
    guard let key = UserDefaults.standard.string(forKey: "current.account") else { return print("`key` not found.") }
    guard let cache = Authentication.Response.persisted(with: key) else { return print("`Authentication.Response` not found.") }
        handler.authenticate(with: .cache(cache)) { result in
                    
            guard let (response, _) = try? result.get() else {
                self.delegate.signUpDone(success: false, key: nil)
                return print("Login failed.")
                }
            guard let key = response.persist() else { return print("`Authentication.Response` could not be persisted.") }
            UserDefaults.standard.set(key, forKey: "current.account")
            UserDefaults.standard.synchronize()
            self.delegate.signUpDone(success: true, key: key)
            
    }

    }
    
    func getFollowers(){

        handler.users.following(user: .me,
        with: .init(maxPagesToLoad: .max),
        updateHandler: nil,
        completionHandler: { response, error in

            guard let userArray = try? response.get() else {
                self.delegate.userFallowers(success: false, followers: nil)
                return print("FollowerNumber Retrun Failed")}
            self.delegate.userFallowers(success: true, followers: userArray)
        })
        
    }
    
    func getFollowed(){
        
    handler.users.followed(byUser: .me, with: .init(maxPagesToLoad: .max), updateHandler: nil, completionHandler: { response, error in

                   guard let userArray = try? response.get() else {
                       self.delegate.userFallowed(success: false, followed: nil)
                       return print("FollowerNumber Retrun Failed")}
                   self.delegate.userFallowed(success: true, followed: userArray)
               })
    }
    
    
    func getWhoNotFollowingYou(){
        
        handler.users.followed(byUser: .me, with:  .init(maxPagesToLoad: .max), updateHandler: nil, completionHandler:
            { response, error in
            
                guard let userArray = try? response.get() else {
                        self.delegate.whoNotFollowingYou(success: false, users: nil)
                        return print("followed Retrun Failed")}
                var statusArray : [User] = [User]()
                for index in userArray{
                    
                    self.handler.users.friendshipStatus(withUser: .username(index.username), completionHandler: {result in
                        
                        guard let status = try? result.get() else {
                             self.delegate.whoNotFollowingYou(success: false, users: nil)
                             return print("friendshipStatus Retrun Failed")}
                            
                        if !status.isFollowingYou!{
                            
                            statusArray.append(index)
                            
                        }
                        if index.username == userArray.last?.username{
                            
                            self.delegate.whoNotFollowingYou(success: true, users: statusArray)
                            
                        }
                
                    })
                }
        })
    }
    
    
    func getYouNotFollowingWho(){
        
        handler.users.following(user: .me, with:  .init(maxPagesToLoad: .max), updateHandler: nil, completionHandler:
            { response, error in
            
                guard let userArray = try? response.get() else {
                        self.delegate.youNotFollowingWho(success: false, users: nil)
                        return print("following Retrun Failed")}
                var statusArray : [User] = [User]()
                for index in userArray{
                    
                    self.handler.users.friendshipStatus(withUser: .username(index.username), completionHandler: {result in
                        
                        guard let status = try? result.get() else {
                             self.delegate.youNotFollowingWho(success: false, users: nil)
                             return print("friendshipStatus Retrun Failed")}
                            
                        if !status.isFollowedByYou{
                            
                            statusArray.append(index)
                            
                        }
                        if index.username == userArray.last?.username{
                            
                            self.delegate.youNotFollowingWho(success: true, users: statusArray)
                            
                        }
                
                    })
                }
        })
        
    }
    
    
    func getProfilePicture(){
        
     
        
        
    }
    
    func getWhoBlockedYou(){
        
        
        
        
        
    }
    
    func getGainedFollowers(){
        
        
        
    }
    
    func getLosedFollowers(){
        
        
        
    }
    
    func getRejectRequest(){
        
     
        
    }
    func getWhoReportedMe(){
        
//   YALAN
    }
    func getWhoLookedMyPage(){
        
//   YALAN
        
    }
    
    func searchUser(){
        
        
        
    }
    
    
}
