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


class WebDetailViewController: UIViewController,AmazonAdInterstitialDelegate {
    
     let data = Data()
    //var UIiAd: ADBannerView = ADBannerView()
    var timerVPN:NSTimer?
    var timerShowAdmobFull:NSTimer?
    var isStopAD = true
  
    var isShowFullAdmob = false
    var isShowFllAmazon = false
    var interstitialAmazon: AmazonAdInterstitial!
    
    var admobBanner: GADBannerView!
    @IBOutlet weak var webView1: UIWebView!
    
     var WebURL = Varialbes.Static.URL
    func ShowAdmob()
    {
        let w = view?.bounds.width
        let h = view?.bounds.height
        
        admobBanner = GADBannerView(frame: CGRectMake(0, h! - 50 , w! , 50))
        admobBanner.adUnitID = "ca-app-pub-7800586925586997/9945331663"
        admobBanner.rootViewController = self
        
        self.view.addSubview(admobBanner)
        
        let request:GADRequest = GADRequest()
        let devices: [String] = ["c655445eba63747bc4a8ebe3039fd2c1", "xyze"]
        request.testDevices = devices
        admobBanner.loadRequest(request)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let entry = data.places[Varialbes.Static.CurrentIndex]
        self.title = entry.Title

        self.timerVPN = NSTimer.scheduledTimerWithTimeInterval(30, target: self, selector: "timerVPNMethodAutoAd:", userInfo: nil, repeats: true)
        
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
        
        
//        
       
        

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
                webView1.loadHTMLString(text2!, baseURL: nil)
                
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

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func showAd()->Bool
    {
        let abc = Test()
        let VPN = abc.isVPNConnected()
        let Version = abc.platformNiceString()
        if(VPN == false && Version == "CDMA")
        {
            return false
        }
        
        return true
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
    func timerVPNMethodAutoAd(timer:NSTimer) {
        print("VPN Checking....")
        let isAd = showAd()
     
        
        if(isAd && isStopAD)
        {
            
            ShowAdmob()
            isStopAD = false
            print("Reopening Ad from admob......")
        }
        
        if(isAd == false && isStopAD == false)
        {
            admobBanner.removeFromSuperview()
            isStopAD = true;
            print("Stop showing Ad from admob......")
        }
    }
    var interstitial: GADInterstitial!
    
    func createAndLoadAd() -> GADInterstitial
    {
        let ad = GADInterstitial(adUnitID: "ca-app-pub-7800586925586997/4335664069")
        
        let request = GADRequest()
        
        request.testDevices = [kGADSimulatorID, "c655445eba63747bc4a8ebe3039fd2c1"]
        
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
    
    // Mark: - AmazonAdInterstitialDelegate
    func interstitialDidLoad(interstitial: AmazonAdInterstitial!) {
        Swift.print("Interstitial loaded.", terminator: "")
        //loadStatusLabel.text = "Interstitial loaded."
    }
    
    func interstitialDidFailToLoad(interstitial: AmazonAdInterstitial!, withError: AmazonAdError!) {
        Swift.print("Interstitial failed to load.", terminator: "")
        //loadStatusLabel.text = "Interstitial failed to load."
    }
    
    func interstitialWillPresent(interstitial: AmazonAdInterstitial!) {
        Swift.print("Interstitial will be presented.", terminator: "")
    }
    
    func interstitialDidPresent(interstitial: AmazonAdInterstitial!) {
        Swift.print("Interstitial has been presented.", terminator: "")
    }
    
    func interstitialWillDismiss(interstitial: AmazonAdInterstitial!) {
        Swift.print("Interstitial will be dismissed.", terminator: "")
    }
    
    func interstitialDidDismiss(interstitial: AmazonAdInterstitial!) {
        Swift.print("Interstitial has been dismissed.", terminator: "");
        //self.loadStatusLabel.text = "No interstitial loaded.";
timerShowAdmobFull?.invalidate()
        LoadAmazon()
    }


 
    
}

