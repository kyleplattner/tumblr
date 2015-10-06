//
//  TabBarViewController.swift
//  Tumblr
//
//  Created by Kyle Plattner on 10/6/15.
//  Copyright (c) 2015 Kyle Plattner. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController{
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var composeButton: UIButton!
    @IBOutlet weak var tooltipImage: UIImageView!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var accountButton: UIButton!
    @IBOutlet weak var trendingButton: UIButton!
    
    
    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!
       
    var isPresenting: Bool = true
    
    var selectedTab: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        // Custom tab controller
        // Main storyboard (nil is default bundle) gives you the storyboard object, handle to things inside
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController") as UIViewController
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController") as UIViewController
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController") as UIViewController
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController") as UIViewController
        
        containerView.addSubview(homeViewController.view)
        homeButton.selected = true
        
        // Bounce tooltip
        UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.Autoreverse | UIViewAnimationOptions.Repeat, animations: { () -> Void in
            self.tooltipImage.transform = CGAffineTransformMakeTranslation(0, 5)
            }, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var destinationVC = segue.destinationViewController as UIViewController
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = destinationVC as ComposeViewController
        
    }

  // Must be a smarter way to do this without all the repetition?
    @IBAction func onTab(sender: AnyObject) {
        selectedTab = sender as UIButton
        
        
        if selectedTab == homeButton{
            println("home")
            containerView.addSubview(homeViewController.view)
            searchViewController.view.removeFromSuperview()
            accountViewController.view.removeFromSuperview()
            trendingViewController.view.removeFromSuperview()
            selectedTab.selected = true
            searchButton.selected = false
            accountButton.selected = false
            trendingButton.selected = false
            toolTipShow()
        }
        
        else if selectedTab == searchButton{
            println("search")
            containerView.addSubview(searchViewController.view)
            homeViewController.view.removeFromSuperview()
            accountViewController.view.removeFromSuperview()
            trendingViewController.view.removeFromSuperview()
            selectedTab.selected = true
            homeButton.selected = false
            accountButton.selected = false
            trendingButton.selected = false
            toolTipShow()
        }
        
        if selectedTab == accountButton{
            println("account")
            containerView.addSubview(accountViewController.view)
            homeViewController.view.removeFromSuperview()
            searchViewController.view.removeFromSuperview()
            trendingViewController.view.removeFromSuperview()
            selectedTab.selected = true
            homeButton.selected = false
            searchButton.selected = false
            trendingButton.selected = false
            toolTipShow()
        }
            
        else if selectedTab == trendingButton{
            println("trending")
            containerView.addSubview(trendingViewController.view)
            homeViewController.view.removeFromSuperview()
            searchViewController.view.removeFromSuperview()
            accountViewController.view.removeFromSuperview()
            selectedTab.selected = true
            homeButton.selected = false
            searchButton.selected = false
            accountButton.selected = false
            toolTipShow()
        }
     }
    
    func toolTipShow(){
        if searchButton.selected == false{
            tooltipImage.hidden = false
        }else{
            tooltipImage.hidden = true
        }
    }
    
    // Is a custom segue needed here?
    @IBAction func onComposeButton(sender: UIButton) {
        performSegueWithIdentifier("composeSegue", sender: self)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
