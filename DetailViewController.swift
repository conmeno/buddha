//
//  ViewController.swift
//  Buddha2
//
//  Created by Phuong Nguyen on 6/5/15.
//  Copyright (c) 2015 Phuong Nguyen. All rights reserved.
//

import UIKit
import iAd

class DetailViewController: UIViewController,ADBannerViewDelegate  {
    
    
    @IBOutlet weak var textv1: UITextView!
   var UIiAd: ADBannerView = ADBannerView()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //self.navigationController?.setNavigationBarHidden(true, animated: true)
        let file = "chudaibi"
        if let path = NSBundle.mainBundle().pathForResource(file, ofType: "html") {
            // use path
            let text2 = try? String(contentsOfFile: path, encoding: NSUTF8StringEncoding)
            print(text2)
            textv1.text=text2

            
        }
 
        
          }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(animated: Bool) {
      
    }
    //begin iad
    // 1
    func appdelegate() -> AppDelegate {
        return UIApplication.sharedApplication().delegate as! AppDelegate
    }
    
    // 2
    override func viewWillAppear(animated: Bool) {
        let SH = UIScreen.mainScreen().bounds.height
        
        UIiAd.delegate = self
        UIiAd = self.appdelegate().UIiAd
        UIiAd.frame = CGRectMake(0, SH - 50, 0, 0)
        self.view.addSubview(UIiAd)
    }
    
    // 3
    override func viewWillDisappear(animated: Bool) {
        UIiAd.delegate = nil
        UIiAd.removeFromSuperview()
    }
    
    // 4
    func bannerViewDidLoadAd(banner: ADBannerView!) {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(1)
        UIiAd.alpha = 1
        UIView.commitAnimations()
    }
    
    // 5
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(0)
        UIiAd.alpha = 1
        UIView.commitAnimations()
    }
    //end iad
    
}

