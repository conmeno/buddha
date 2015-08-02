//
//  ViewController.swift
//  Buddha2
//
//  Created by Phuong Nguyen on 6/5/15.
//  Copyright (c) 2015 Phuong Nguyen. All rights reserved.
//

import UIKit
import iAd

 
class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate,ADBannerViewDelegate   {

    @IBOutlet weak var tableView: UITableView!
    var UIiAd: ADBannerView = ADBannerView()
    let data = Data()
    let textCellIdentifier = "TextCell"
    
    
    
    //adTapsy
        var timerAd:NSTimer?
    @IBOutlet weak var adView: UIView!
    
    @IBAction func MoreAppClick(sender: AnyObject) {
        var barsLink : String = "itms-apps://itunes.apple.com/ca/artist/phuong-nguyen/id1004963752"
        UIApplication.sharedApplication().openURL(NSURL(string: barsLink)!)
        
    }
    
    
    
    @IBAction func MoreAppOutsite(sender: AnyObject) {
        adView.hidden = false
    }
    
    
    
    @IBAction func ShowAdClick(sender: AnyObject) {
        if (AdTapsy.isAdReadyToShow()) {
            println("Ad is ready to be shown");
            AdTapsy.showInterstitial(self);
            
        } else {
            println("Ad is not ready to be shown");
        }
    }
    
    
    @IBOutlet weak var InfoBt: UIButton!
    
    @IBAction func InfoClick(sender: AnyObject) {
        //call auto app
        
        adView.backgroundColor = UIColor.blueColor()
        
        
        self.timerAd = NSTimer.scheduledTimerWithTimeInterval(10, target: self, selector: "timerMethodAutoAd:", userInfo: nil, repeats: true)
        
    }
    
    @IBAction func InfoAutoAd(sender: AnyObject) {             }
    
    func timerMethodAutoAd(timer:NSTimer) {
        println("auto play")
        adView.backgroundColor = UIColor.redColor()
        if (AdTapsy.isAdReadyToShow()) {
            println("Ad is ready to be shown");
            AdTapsy.showInterstitial(self);
            
        } else {
            println("Ad is not ready to be shown");
        }
        
    }
    
    //ad
    // Add delegate functions
    func adtapsyDidClickedAd() {
        println("***adtapsyDidClickedAd***");
    }
    
    func adtapsyDidFailedToShowAd() {
        println("***adtapsyDidFailedToShowAd***");
    }
    
    func adtapsyDidShowAd() {
        println("***adtapsyDidShowAd***");
    }
    
    func adtapsyDidSkippedAd() {
        println("***adtapsyDidSkippedAd***");
    }
    
    func adtapsyDidCachedAd() {
        println("***adtapsyDidCachedAd***");
    }
    //end ad
    //end adtapsy
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
         adView.hidden = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.clearColor()
      
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //table view
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.places.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath) as UITableViewCell
        
        let row = indexPath.row
        let entry = data.places[row]
        cell.textLabel!.text =  entry.Name
        cell.backgroundColor = UIColor.clearColor()
        cell.backgroundView?.alpha = 0.5
       cell.textLabel!.textColor=UIColor.blackColor()
        let image = UIImage(named: entry.Icon)
        cell.imageView!.image = image
        
        return cell
    }
    
    // MARK:  UITableViewDelegate Methods
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let row = indexPath.row
        let entry = data.places[row]

        //println(entry.Name)
        
        
        
        
        //
        //performSegueWithIdentifier("myDetailView1", sender: nil)
        
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        var initialViewController = storyboard.instantiateViewControllerWithIdentifier("myDetailView1") as UIViewController
                 //presentViewController(initialViewController, animated: true, completion: nil)
        
        //self.window?.rootViewController = initialViewController
        //self.window?.makeKeyAndVisible()
        
        //let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //let vc = storyboard.instantiateViewControllerWithIdentifier("myDetailView1") as UIViewController
        //presentViewController(vc, animated: true, completion: nil)
        if(entry.NType == 1 || entry.NType == 2)
        {
            Varialbes.Static.CurrentIndex = row
            
            var WebDetailView = storyboard.instantiateViewControllerWithIdentifier("webDetail") as UIViewController
            
            
            self.navigationController?.pushViewController(WebDetailView, animated: true)
    
        }
        else
        {
        
        self.navigationController?.pushViewController(initialViewController, animated: true)
        }

    }
    //end table view
    
    
    
    //begin iad
    // 1
    func appdelegate() -> AppDelegate {
        return UIApplication.sharedApplication().delegate as AppDelegate
    }
    
    // 2
    override func viewWillAppear(animated: Bool) {
        var SH = UIScreen.mainScreen().bounds.height
       
        UIiAd = self.appdelegate().UIiAd
        UIiAd.frame = CGRectMake(0, SH - 50, 0, 0)
        self.view.addSubview(UIiAd)
        println("khoi tao ")
        UIiAd.alpha = 0
        UIiAd.delegate = self
    }
    
    // 3
    override func viewWillDisappear(animated: Bool) {
        UIiAd.delegate = nil
        UIiAd.removeFromSuperview()
    }
    
    //   bannerViewWillLoadAd
    func bannerViewWillLoadAd(banner: ADBannerView!) {
        println("will load ")
    }
    
    
    // 4
    func bannerViewDidLoadAd(banner: ADBannerView!) {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(1)
        UIiAd.alpha = 1
        UIView.commitAnimations()
         println("da load ")
    }
    
    // 5
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(0)
        UIiAd.alpha = 1
        UIView.commitAnimations()
        println("fail load ")

    }
    //end iad
    

}

