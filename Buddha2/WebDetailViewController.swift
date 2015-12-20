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


class WebDetailViewController: UIViewController,AmazonAdInterstitialDelegate   {
    
     let data = Data()
    //var UIiAd: ADBannerView = ADBannerView()
    var timerAd:NSTimer?
    var isStopAD = true
  var admobBanner: GADBannerView!
    @IBOutlet weak var webView1: UIWebView!
    var timerShowAdmobFull:NSTimer?
    var isShowFullAdmob = false
    var isShowFllAmazon = false
    
    var interstitialAmazon: AmazonAdInterstitial!
    
    
     var WebURL = Varialbes.Static.URL

//    func ShowFB()
//    {
//        var fbBanner: FBAdView = FBAdView(placementID:"1641295566086832_1641943026022086", adSize:kFBAdSize320x50, rootViewController:self)
//        fbBanner.delegate = self
// 
//        FBAdSettings.addTestDevice("96f1b863a45b29921976b97a6aa858812ac828ee")
//        fbBanner.loadAd()
//        fbBanner.frame = CGRect(x: 0, y: sel-f.view.frame.size.height - 50, width: 320, height: 90)
//        self.view.addSubview(fbBanner)
//    }
    
 
    func ShowAdmob()
    {
        var w = view?.bounds.width
        var h = view?.bounds.height
        
        admobBanner = GADBannerView(frame: CGRectMake(0, h! - 50 , w! , 50))
        admobBanner.adUnitID = "ca-app-pub-2807486494925046/6121059619"
        admobBanner.rootViewController = self
        view?.addSubview(admobBanner!)
        var request:GADRequest = GADRequest()
        var devices: [String] = ["ed118f458979010c0f207ec85c5a21fa", "xyze"]
        request.testDevices = devices
        admobBanner.loadRequest(request)
        
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let entry = data.places[Varialbes.Static.CurrentIndex]
        self.title = entry.Title
        
        
        self.timerAd = NSTimer.scheduledTimerWithTimeInterval(30, target: self, selector: "timerMethodAutoAd:", userInfo: nil, repeats: true)

        
        self.timerShowAdmobFull = NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: "timerAdmobFull:", userInfo: nil, repeats: true)
        
        if(showAd())
        {
            
            
            ShowAdmob()
            isStopAD = false
            
            if(entry.adType == 1)
            {
                self.interstitial = self.createAndLoadAd()
                
            }
            else
            {
                isShowFllAmazon = true
                isShowFullAdmob = true
                interstitialAmazon = AmazonAdInterstitial()
                
                interstitialAmazon!.delegate = self
                
            }
            
        }
            

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
                //NSURL *url=[[NSBundle mainBundle] bundleURL];
                let mainB =  NSBundle.mainBundle()
                let requestURL1 = mainB.bundleURL
                webView1.loadHTMLString(text2, baseURL: requestURL1)
                
            }

        }else
        {
            let requestURL = NSURL(string:entry.URL)
            let request = NSURLRequest(URL: requestURL!)
            webView1.loadRequest(request)
        }
        
    }
    //amazon full
    //amaazon
    func LoadAmazon()
    {
        let options = AmazonAdOptions()
        
        options.isTestRequest = true
        
        interstitialAmazon.load(options)
    }
    
    func showAmazonFull()
    {
        interstitialAmazon.presentFromViewController(self)
        
    }
    func timerAdmobFull(timer:NSTimer) {
        let isAd = showAd()
        if(isAd)
        {
            if(isShowFllAmazon)
            {
                showAmazonFull()
                
                
            }
            
            if(!isShowFullAdmob)
            {
                
                if(self.interstitial.isReady)
                {
                    showAdmobFull()
                    isShowFullAdmob = true;
                    timerShowAdmobFull?.invalidate()
                }
                
                
                
                
            }
        }
        
        
    }
    func timerMethodAutoAd(timer:NSTimer) {
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
    var interstitial: GADInterstitial!
    
    func createAndLoadAd() -> GADInterstitial
    {
        let ad = GADInterstitial(adUnitID: "ca-app-pub-2807486494925046/7597792818")
        
        let request = GADRequest()
        
        request.testDevices = [kGADSimulatorID, "ed118f458979010c0f207ec85c5a21fa"]
        
        ad.loadRequest(request)
        
        return ad
    }
    func showAdmobFull()
    {
        if (self.interstitial.isReady)
        {
            self.interstitial.presentFromRootViewController(self)
            self.interstitial = self.createAndLoadAd()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    
}

