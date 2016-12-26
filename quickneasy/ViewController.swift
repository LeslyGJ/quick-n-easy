//
//  ViewController.swift
//  quickneasy
//
//  Created on 11/3/16.
//  Copyright © 2016 LEA. All rights reserved.
//

import UIKit
import GoogleSignIn
import FirebaseAuth

class ViewController: UIViewController, GIDSignInUIDelegate {
    
    @IBOutlet weak var signInButton: GIDSignInButton!
    var recipeCall = RecipeCall()
    
    @IBAction func didTapSignOut(sender: AnyObject) {GIDSignIn.sharedInstance().signOut()
        
        print("Signout")
        
        recipeCall.getRecipeInformation(["id": 534573], queryParameters: [:]) {
            (json) -> () in
            print(json)
        }
        
        recipeCall.findByIngredients( [:],
            queryParameters: ["ingredients": ["apple", "flour", "sugar"], "number": 5, "ranking": 1])
        { (json) -> () in
            print(json)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        GIDSignIn.sharedInstance().uiDelegate = self
        
        
        
        // Uncomment to automatically sign in the user.
        //GIDSignIn.sharedInstance().signInSilently()
        
        // TODO(developer) Configure the sign-in button look/feel
        // ...

        // Do any additional setup after loading the view, typically from a nib.
    }
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    // Implement these methods only if the GIDSignInUIDelegate is not a subclass of
    // UIViewController.
    
  
    
    // Present a view that prompts the user to sign in with Google
    func signIn(signIn: GIDSignIn!,
                presentViewController SecondviewController: UIViewController!) {
        self.presentViewController(SecondviewController, animated: true, completion: nil)
    }
    
    // Dismiss the "Sign in with Google" view
    func signIn(signIn: GIDSignIn!,
                dismissViewController viewController: UIViewController!) {
        self.dismissViewControllerAnimated(true, completion: nil)
        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("searchView") as UIViewController
        // .instantiatViewControllerWithIdentifier() returns AnyObject! this must be downcast to utilize it
        
        self.presentViewController(viewController, animated: false, completion: nil)
        
    }
   
    
    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!,
                withError error: NSError!) {
        if (error == nil) {
            
        } else {
            print("\(error.localizedDescription)")
        }
    }
    

    
    
    // Present a view that prompts the user to sign in with Google
   
    
    // Dismiss the "Sign in with Google" view
   

}

