//
//  SignInViewController.swift
//  JRF-attorney
//
//  Created by Brian Hu on 12/6/14.
//  Copyright (c) 2014 Brian Hu. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, FBLoginViewDelegate {
    @IBOutlet weak var fbLoginView: FBLoginView!
    override func viewDidLoad() {
        self.fbLoginView.delegate = self
        self.fbLoginView.readPermissions = ["email"]
    }
    
    func loginViewFetchedUserInfo(loginView : FBLoginView!, user: FBGraphUser) {
        println("User: \(user)")
        println("User ID: \(user.objectID)")
        println("User Name: \(user.name)")
        var userEmail = user.objectForKey("email") as String
        println("User Email: \(userEmail)")
        println("token: \(FBSession.activeSession().accessTokenData.accessToken)")
    }
}
