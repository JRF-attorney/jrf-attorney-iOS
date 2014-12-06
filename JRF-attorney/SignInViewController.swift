//
//  SignInViewController.swift
//  JRF-attorney
//
//  Created by Brian Hu on 12/6/14.
//  Copyright (c) 2014 Brian Hu. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, FBLoginViewDelegate, GPPSignInDelegate {
    @IBOutlet weak var gpPSignInButton: GPPSignInButton!
    @IBOutlet weak var fbLoginView: FBLoginView!
    override func viewDidLoad() {
        self.fbLoginView.delegate = self
        self.fbLoginView.readPermissions = ["email"]
        
        var signIn = GPPSignIn.sharedInstance()
        signIn.clientID = "688112989198-r3v55a5oav20pnfajogrdo2ff9ec8k7n.apps.googleusercontent.com"
        signIn.scopes = [kGTLAuthScopePlusLogin]
        signIn.shouldFetchGoogleUserEmail = true
        signIn.delegate = self;
    }
    
    func loginViewFetchedUserInfo(loginView : FBLoginView!, user: FBGraphUser) {
        println("User: \(user)")
        println("User ID: \(user.objectID)")
        println("User Name: \(user.name)")
        var userEmail = user.objectForKey("email") as String
        println("User Email: \(userEmail)")
        println("token: \(FBSession.activeSession().accessTokenData.accessToken)")
    }
    
    func finishedWithAuth(auth: GTMOAuth2Authentication!, error: NSError!) {
        if error != nil {
            println("error")
        } else {
            println("auth token: \(auth.accessToken)")
            println(auth.userEmail)
        }
    }
}
