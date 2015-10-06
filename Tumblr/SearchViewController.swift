//
//  SearchViewController.swift
//  Tumblr
//
//  Created by Kyle Plattner on 10/6/15.
//  Copyright (c) 2015 Kyle Plattner. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {


    @IBOutlet weak var loadingImage: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var trendingImage: UIImageView!
    
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.hidden = true
        var images = UIImage.animatedImageNamed("loading-", duration: 0.7)
        loadingImage.image = images
    }
    
    override func viewDidAppear(animated: Bool) {
        delay(2){
            
            self.scrollView.hidden = false
            self.scrollView.contentSize = self.trendingImage.image!.size

        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
