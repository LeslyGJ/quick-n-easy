
import UIKit
import GoogleSignIn
import FirebaseAuth

class SignInViewController: UIViewController, GIDSignInUIDelegate {
    
    @IBOutlet weak var signInButton: GIDSignInButton!
    
    var menuBar: UIToolbar!
    static var themeOne = false
    
    @IBAction func didTapSignOut(sender: AnyObject) {
        GIDSignIn.sharedInstance().signOut()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
        
        // Automatically sign in the user if already signed in
        GIDSignIn.sharedInstance().signInSilently()
        
        // TODO(developer) Configure the sign-in button look/feel
        
        let state = SignInViewController.themeOne
        print("------->:\(state)")
        
        if(SignInViewController.themeOne == true){
            
            self.view.backgroundColor = UIColorFromHex(0xF1FAE8, alpha: 0.9)
            let recipe = RecipeSearchViewController()
            recipe.toolBarChange()
        }
        else if(SignInViewController.themeOne == false){
            
            self.view.backgroundColor = UIColor.whiteColor()
            let recipe = RecipeSearchViewController()
            recipe.toolBarChange()
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    // Present the Google sign in view
    func signIn(signIn: GIDSignIn!,
                presentViewController viewController: UIViewController!) {
        self.presentViewController(viewController, animated: true, completion: nil)
    }
    
    // Dismiss the Google sign in view
    func signIn(signIn: GIDSignIn!,
                dismissViewController viewController: UIViewController!) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
        let searchViewController:UIViewController = UIStoryboard(name: "Main", bundle: nil)
        .instantiateViewControllerWithIdentifier("searchView") as UIViewController
        // .instantiatViewControllerWithIdentifier() returns AnyObject! this must be downcast to utilize it
        
        self.presentViewController(searchViewController, animated: false, completion: nil)
    }
    
    //color settings
    func changeColor(){
        print("------>changing color!")
        
        SignInViewController.themeOne = true
        let recipe = RecipeSearchViewController()
        recipe.toolBarChange()
    }
    func defaultTheme(){
        print("------>changing color!")
        
        
        SignInViewController.themeOne = false
        let recipe = RecipeSearchViewController()
        recipe.toolBarChange()
    }
    func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }

    
}

