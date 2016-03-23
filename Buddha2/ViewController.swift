//
//  ViewController.swift
//  Buddha2
//
//  Created by Phuong Nguyen on 6/5/15.
//  Copyright (c) 2015 Phuong Nguyen. All rights reserved.
//

import UIKit
import Foundation
 
 
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate   {

    
    @IBOutlet weak var tableView: UITableView!
    let data = Data1()
    let textCellIdentifier = "TextCell"
    var timerAd:NSTimer?
   // @IBOutlet weak var fbBanner: FBAdView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.clearColor()
        
        if(Utility.showOtherAd)
        {
            Utility.isAd6 = true
            let myAd = MyAd(root: self)
        
            myAd.ViewDidload()
        }
   //self.timerAd = NSTimer.scheduledTimerWithTimeInterval(30, target: self, selector: "timerMethodAutoAd:", userInfo: nil, repeats: true)
        
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
       cell.textLabel!.textColor=UIColor.whiteColor()
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
        
        let initialViewController = storyboard.instantiateViewControllerWithIdentifier("myDetailView1") as UIViewController
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
            if(Utility.showOtherAd)
            {
                Utility.OpenView("AdView1", view: self)
            }
        //self.navigationController?.pushViewController(initialViewController, animated: true)
        }

    }
    //end table view
    
 
    
    
    
}

