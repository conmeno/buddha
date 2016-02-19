//
//  ViewController.swift
//  Buddha2
//
//  Created by Phuong Nguyen on 6/5/15.
//  Copyright (c) 2015 Phuong Nguyen. All rights reserved.
//

import UIKit
//import iAd
import GoogleMobileAds


class WebDetailViewController: UIViewController  {
    
     let data = Data1()
     @IBOutlet weak var webView1: UIWebView!
     var WebURL = Varialbes.Static.URL
     override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let entry = data.places[Varialbes.Static.CurrentIndex]
        self.title = entry.Title
        
       
        if(entry.Title == "")
        {
            self.title = entry.Name
        }
        if(entry.NType == 1)
        {
            //let file = "chudaibi"
            if let path = NSBundle.mainBundle().pathForResource(entry.Value, ofType: "html") {
                // use path
                
                 let text2 = try? String(contentsOfFile: path, encoding: NSUTF8StringEncoding)
                //println(text2)
                
                // textv1.text=text2
                //NSURL *url=[[NSBundle mainBundle] bundleURL];
                let mainB =  NSBundle.mainBundle()
                let requestURL1 = mainB.bundleURL
                webView1.loadHTMLString(text2!, baseURL: requestURL1)
                
            }

        }else
        {
            let requestURL = NSURL(string:entry.URL)
            let request = NSURLRequest(URL: requestURL!)
            webView1.loadRequest(request)
        }
        
        let myAd = MyAd(root: self)
        
        myAd.ViewDidload()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    
}

