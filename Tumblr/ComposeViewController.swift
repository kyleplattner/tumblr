//
//  ComposeViewController.swift
//  Tumblr
//
//  Created by Kyle Plattner on 10/10/14.
//  Copyright (c) 2015 Kyle Plattner. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    var isPresenting: Bool = true
    
    @IBOutlet weak var composeView: UIView!
    @IBOutlet weak var textImage: UIImageView!
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var quoteImage: UIImageView!
    @IBOutlet weak var linkImage: UIImageView!
    @IBOutlet weak var chatImage: UIImageView!
    @IBOutlet weak var videoImage: UIImageView!
    @IBOutlet weak var nevermindButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animateIcons(600)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 0.4
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        // TODO: animate the transition in Step 3 below
        println("animating transition")
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        
        if (isPresenting) {
            // Intro segue
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            animateIcons(0)
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                toViewController.view.alpha = 1
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
            }
        } else {
            // Outro segue
            animateIcons(-200)
            
            UIView.animateWithDuration(0.7, animations: { () -> Void in
                self.nevermindButton.transform = CGAffineTransformMakeTranslation(0, 200)
            })
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                fromViewController.view.alpha = 0
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
            }
        }
    }
    
    //Animate out icons
    func animateIcons(position: CGFloat){
        // Text image
        UIView.animateWithDuration(0.6, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut | UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            self.textImage.transform = CGAffineTransformMakeTranslation(0, position)
            }, completion: nil)
        
        // Photo image
        UIView.animateWithDuration(0.4, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.photoImage.transform = CGAffineTransformMakeTranslation(0, position)
            }, completion: nil)
        
        // Quote image
        UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.quoteImage.transform = CGAffineTransformMakeTranslation(0, position)
            }, completion: nil)
        
        // Link image
        UIView.animateWithDuration(0.6, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.linkImage.transform = CGAffineTransformMakeTranslation(0, position)
            }, completion: nil)
        
        // Chat image
        UIView.animateWithDuration(0.4, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.chatImage.transform = CGAffineTransformMakeTranslation(0, position)
            }, completion: nil)
        
        // Video image
        UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.videoImage.transform = CGAffineTransformMakeTranslation(0, position)
            }, completion: nil)
        
    }

    
    @IBAction func onNevermindButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
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
