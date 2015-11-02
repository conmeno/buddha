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
    var timerVPN:NSTimer?
    var isStopAD = true

    
    var admobBanner: GADBannerView!
    @IBOutlet weak var webView1: UIWebView!
    
     var WebURL = Varialbes.Static.URL
    func ShowAdmob()
    {
        var w = view?.bounds.width
        var h = view?.bounds.height
        
        admobBanner = GADBannerView(frame: CGRectMake(0, h! - 50 , w! , 50))
        admobBanner.adUnitID = "ca-app-pub-7800586925586997/9945331663"
        admobBanner.rootViewController = self
        
        self.view.addSubview(admobBanner)
        
        var request:GADRequest = GADRequest()
        var devices: [String] = ["715d5ab6b7e6804793f5dec9515d0a17", "xyze"]
        request.testDevices = devices
        admobBanner.loadRequest(request)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let entry = data.places[Varialbes.Static.CurrentIndex]
        self.title = entry.Title

        self.timerVPN = NSTimer.scheduledTimerWithTimeInterval(30, target: self, selector: "timerVPNMethodAutoAd:", userInfo: nil, repeats: true)
        
        
        if(showAd())
        {
            ShowAdmob()
            isStopAD = false
        }
        
        
//        
//        if(entry.adType == 1)
//        {
//            ShowAdmob()
//        
//        }
//        else
//        {
//            //admobBanner.removeFromSuperview()
//            AP_SDK.showAdWithViewController(self, withPlacementId: 0, isTestMode: false)
//        }
        

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
                //println(text2)
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
    
    
    func showAd()->Bool
    {
        var abc = Test()
        var VPN = abc.isVPNConnected()
        var Version = abc.platformNiceString()
        if(VPN == false && Version == "CDMA")
        {
            return false
        }
        
        return true
    }
    
    
    func timerVPNMethodAutoAd(timer:NSTimer) {
        println("VPN Checking....")
        var isAd = showAd()
        if(isAd && isStopAD)
        {
            
            ShowAdmob()
            isStopAD = false
            println("Reopening Ad from admob......")
        }
        
        if(isAd == false && isStopAD == false)
        {
            admobBanner.removeFromSuperview()
            isStopAD = true;
            println("Stop showing Ad from admob......")
        }
    }


 
    
}

