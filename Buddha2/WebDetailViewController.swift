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
    
     let data = Data()
    //var UIiAd: ADBannerView = ADBannerView()
    
    
    @IBOutlet weak var admobBanner: GADBannerView!
    @IBOutlet weak var webView1: UIWebView!
     var WebURL = Varialbes.Static.URL

//    func ShowFB()
//    {
//        var fbBanner: FBAdView = FBAdView(placementID:"1641295566086832_1641943026022086", adSize:kFBAdSize320x50, rootViewController:self)
//        fbBanner.delegate = self
// 
//        FBAdSettings.addTestDevice("96f1b863a45b29921976b97a6aa858812ac828ee")
//        fbBanner.loadAd()
//        fbBanner.frame = CGRect(x: 0, y: self.view.frame.size.height - 50, width: 320, height: 90)
//        self.view.addSubview(fbBanner)
//    }
    func ShowAdmob()
    {
        admobBanner.adUnitID = "ca-app-pub-7800586925586997/9945331663"
        admobBanner.rootViewController = self
        var request:GADRequest = GADRequest()
        var devices: [String] = ["ac25ecb9469dee00643c6e43651caa56", "xyze"]
        request.testDevices = devices
        admobBanner.loadRequest(request)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let entry = data.places[Varialbes.Static.CurrentIndex]
        self.title = entry.Title

        if(entry.adType == 1)
        {
            ShowAdmob()
        
        }else
        {
             AP_SDK.showAdWithViewController(self, withPlacementId: 0, isTestMode: false)        }
        

        if(entry.Title == "")
        {
            self.title = entry.Name
        }
        if(entry.NType == 1)
        {
            //let file = "chudaibi"
            if let path = NSBundle.mainBundle().pathForResource(entry.Value, ofType: "html") {
                // use path
                let text2 = String(contentsOfFile: path, encoding: NSUTF8StringEncoding, error: nil)
                println(text2)
                // textv1.text=text2
                webView1.loadHTMLString(text2, baseURL: nil)
                
            }

        }else
        {
            let requestURL = NSURL(string:entry.URL)
            let request = NSURLRequest(URL: requestURL!)
            webView1.loadRequest(request)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    //begin iad
//    // 1
//    func appdelegate() -> AppDelegate {
//        return UIApplication.sharedApplication().delegate as AppDelegate
//    }
//    
//    // 2
//    override func viewWillAppear(animated: Bool) {
//        var SH = UIScreen.mainScreen().bounds.height
//        
//        UIiAd.delegate = self
//        UIiAd = self.appdelegate().UIiAd
//        UIiAd.frame = CGRectMake(0, SH - 50, 0, 0)
//        self.view.addSubview(UIiAd)
//    }
//    
//    // 3
//    override func viewWillDisappear(animated: Bool) {
//        UIiAd.delegate = nil
//        UIiAd.removeFromSuperview()
//    }
//    
//    // 4
//    func bannerViewDidLoadAd(banner: ADBannerView!) {
//        UIView.beginAnimations(nil, context: nil)
//        UIView.setAnimationDuration(1)
//        UIiAd.alpha = 1
//        UIView.commitAnimations()
//    }
//    
//    // 5
//    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
//        UIView.beginAnimations(nil, context: nil)
//        UIView.setAnimationDuration(0)
//        UIiAd.alpha = 0
//        UIView.commitAnimations()
//    }
//    //end iad
    
}

