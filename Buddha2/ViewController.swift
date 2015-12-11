//
//  ViewController.swift
//  Buddha2
//
//  Created by Phuong Nguyen on 6/5/15.
//  Copyright (c) 2015 Phuong Nguyen. All rights reserved.
//

import UIKit
import Foundation
 
 
class ViewController: UIViewController, AmazonAdViewDelegate, UITableViewDataSource, UITableViewDelegate   {

    
    @IBOutlet weak var tableView: UITableView!
    let data = Data()
    let textCellIdentifier = "TextCell"
    var timerAd:NSTimer?
   // @IBOutlet weak var fbBanner: FBAdView!
    @IBOutlet var amazonAdView: AmazonAdView!
    func showAmazon()
    {
        amazonAdView = AmazonAdView(adSize: AmazonAdSize_320x50)
        loadAmazonAdWithUserInterfaceIdiom(UIDevice.currentDevice().userInterfaceIdiom, interfaceOrientation: UIApplication.sharedApplication().statusBarOrientation)
        amazonAdView.delegate = self
        self.view.addSubview(amazonAdView)
    }
    func loadAmazon()
    {
    
    }
    func loadAmazonAdWithUserInterfaceIdiom(userInterfaceIdiom: UIUserInterfaceIdiom, interfaceOrientation: UIInterfaceOrientation) -> Void {
        
        let options = AmazonAdOptions()
        options.isTestRequest = false
        let x = (self.view.bounds.width - 320)/2
        
        if (userInterfaceIdiom == UIUserInterfaceIdiom.Phone) {
            amazonAdView.frame = CGRectMake(x, self.view.bounds.height - 50, 320, 50)
        } else {
            amazonAdView.removeFromSuperview()
          
            if (interfaceOrientation == UIInterfaceOrientation.Portrait) {
                amazonAdView = AmazonAdView(adSize: AmazonAdSize_728x90)
                amazonAdView.frame = CGRectMake((self.view.bounds.width-728.0)/2.0, self.view.bounds.height - 50, 728.0, 90.0)
            } else {
                amazonAdView = AmazonAdView(adSize: AmazonAdSize_1024x50)
                amazonAdView.frame = CGRectMake((self.view.bounds.width-1024.0)/2.0, self.view.bounds.height - 50, 1024.0, 50.0)
            }
            self.view.addSubview(amazonAdView)
            amazonAdView.delegate = self
        }
        
        amazonAdView.loadAd(options)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
         //print(getIFAddresses())
      // println(UIDevice.currentDevice().)
        // Do any additional setup after loading the view, typically from a nib.
        showAmazon()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.clearColor()
        
        
        
        
//        AP_SDK.setCallBackDelegate(self)
//        AP_SDK.showAdWithViewController(self, withPlacementId: 0, isTestMode: false)
        
        
   self.timerAd = NSTimer.scheduledTimerWithTimeInterval(30, target: self, selector: "timerMethodAutoAd:", userInfo: nil, repeats: true)
        
    }
    
    func timerMethodAutoAd(timer:NSTimer) {
        print("auto load amazon")
      loadAmazonAdWithUserInterfaceIdiom(UIDevice.currentDevice().userInterfaceIdiom, interfaceOrientation: UIApplication.sharedApplication().statusBarOrientation)
        
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
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath) as
        UITableViewCell
        
        let row = indexPath.row
        let entry = data.places[row]
        cell.textLabel!.text =  entry.Name
        //cell.textLabel!.text = getIFAddresses()[0]
        
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
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        _ = storyboard.instantiateViewControllerWithIdentifier("myDetailView1") as UIViewController
                 //presentViewController(initialViewController, animated: true, completion: nil)
        
        //self.window?.rootViewController = initialViewController
        //self.window?.makeKeyAndVisible()
        
        //let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //let vc = storyboard.instantiateViewControllerWithIdentifier("myDetailView1") as UIViewController
        //presentViewController(vc, animated: true, completion: nil)
        if(entry.NType == 1 || entry.NType == 2)
        {
            Varialbes.Static.CurrentIndex = row
            
            let WebDetailView = storyboard.instantiateViewControllerWithIdentifier("webDetail") as UIViewController
            
            
            self.navigationController?.pushViewController(WebDetailView, animated: true)
    
        }
        else
        {
        
        //self.navigationController?.pushViewController(initialViewController, animated: true)
        }

    }
    //end table view
    // Mark: - AmazonAdViewDelegate
    func viewControllerForPresentingModalView() -> UIViewController {
        return self
    }
    
    func adViewDidLoad(view: AmazonAdView!) -> Void {
        self.view.addSubview(amazonAdView)
        
    }
    
    func adViewDidFailToLoad(view: AmazonAdView!, withError: AmazonAdError!) -> Void {
        print("Ad Failed to load. Error code \(withError.errorCode): \(withError.errorDescription)")
    }
    
    func adViewWillExpand(view: AmazonAdView!) -> Void {
        print("Ad will expand")
    }
    
    func adViewDidCollapse(view: AmazonAdView!) -> Void {
        print("Ad has collapsed")
    }

    
    
    
    
    
    
         
    
}

