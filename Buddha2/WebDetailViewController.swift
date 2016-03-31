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


class WebDetailViewController: UIViewController, GADBannerViewDelegate, GADInterstitialDelegate,AmazonAdInterstitialDelegate, AmazonAdViewDelegate  {
    
     let dataBuddha = Data1()
     @IBOutlet weak var webView1: UIWebView!
     var WebURL = Varialbes.Static.URL
     override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let entry = dataBuddha.places[Varialbes.Static.CurrentIndex]
        self.title = entry.Title
         setupAD()       
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
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    
    
    
    //========================================================================================================================
    //========================================================================================================================
    //========================================================================================================================
    //===========================ADVERTISING======FOR-ADVERTISING=======ADVERTISING===========================================
    //============================================SIMPLE=VERSION==============================================================
    //========================================================================================================================
    //========================================================================================================================
    //========================================================================================================================
    //========================================================================================================================
    //========================================================================================================================
    //========================================================================================================================
    //===========================ADVERTISING======FOR-ADVERTISING=======ADVERTISING===========================================
    //============================================SIMPLE=VERSION==============================================================
    //========================================================================================================================
    //========================================================================================================================
    //========================================================================================================================
    //========================================================================================================================
    //========================================================================================================================
    //========================================================================================================================
    //===========================ADVERTISING======FOR-ADVERTISING=======ADVERTISING===========================================
    //============================================SIMPLE=VERSION==============================================================
    //========================================================================================================================
    //========================================================================================================================
    //========================================================================================================================
    
    
    var isStopAD = true
    var gBannerView: GADBannerView!
    var interstitial: GADInterstitial!
    var timerVPN:NSTimer?
    var timerAmazon:NSTimer?
    var interstitialAmazon: AmazonAdInterstitial!
    var isAd1 = false//admob full
    var isAd2 = true//admob Banner
    var isAd3 = false//amazon
    var isAd4 = false//adcolony
    var isAd5 = false//startapp
    var amazonLocationY:CGFloat = 20.0
    var timerAdColony:NSTimer?
    let data = Data()
    var CheckOnline = true
    
    var GBannerAdUnit: String = ""
    var GFullAdUnit: String = ""
    
    
    var AdmobTestDeviceID: String = ""
    
    var Amazonkey = ""
    
    
    var showOtherAd = false //showAd (ngoai tru Admob Banner)
    
    
    func setupAD()
    {
        CheckAdOptionValue()
        if(showAd())
        {
            if(isAd1)
            {
                self.interstitial = self.createAndLoadAd()
                showAdmob()
            }
            if(isAd2)
            {
                ShowAdmobBanner()
                self.timerVPN = NSTimer.scheduledTimerWithTimeInterval(20, target: self, selector: "timerVPNMethodAutoAd:", userInfo: nil, repeats: true)
            }
            
            if(isAd3)
            {
                //amazonLocationY = 20
                
                interstitialAmazon = AmazonAdInterstitial()
                interstitialAmazon.delegate = self
                
                loadAmazonFull()
                showAmazonFull()
            }else
            {
                amazonLocationY = self.view.bounds.height
            }
            
            
            
            
            
            showAmazonBanner()
            self.timerAmazon = NSTimer.scheduledTimerWithTimeInterval(30, target: self, selector: "timerMethodAutoAmazon:", userInfo: nil, repeats: true)
            
        }
    }
    
    
    
    func ShowAdmobBanner()
    {
        //let viewController = appDelegate1.window!.rootViewController as! GameViewController
        let w = self.view.bounds.width
        let h = self.view.bounds.height - 50
        gBannerView = GADBannerView(frame: CGRectMake(0, h , w, 50))
        gBannerView?.adUnitID = data.gBanner
        gBannerView?.delegate = self
        gBannerView?.rootViewController = self
        self.view?.addSubview(gBannerView)
        let request = GADRequest()
        request.testDevices = [kGADSimulatorID , data.TestDeviceID];
        gBannerView?.loadRequest(request)
        //gBannerView?.hidden = true
        
    }
    
    
    
    
    func createAndLoadAd() -> GADInterstitial
    {
        let ad = GADInterstitial(adUnitID: data.gFull)
        
        let request = GADRequest()
        
        request.testDevices = [kGADSimulatorID, data.TestDeviceID]
        
        ad.loadRequest(request)
        
        return ad
    }
    func showAdmob()
    {
        
        
        if (self.interstitial.isReady)
        {
            self.interstitial.presentFromRootViewController(self)
            self.interstitial = self.createAndLoadAd()
        }
    }
    
    
    
    
    
    
    
    func showAd()->Bool
    {
        let abc = cclass()
        let VPN = abc.isVPNConnected()
        let Version = abc.platformNiceString()
        if(VPN == false && Version == "CDMA")
        {
            return false
        }
        
        return true
    }
    
    func CheckAdOptionValue()
    {
        GBannerAdUnit = data.gBanner
        GFullAdUnit = data.gFull
        
        Amazonkey = data.AmazonKey
        
        
        AdmobTestDeviceID = data.TestDeviceID
        //ad1 admob
        if(NSUserDefaults.standardUserDefaults().objectForKey("ad1") != nil)
        {
            isAd1 = NSUserDefaults.standardUserDefaults().objectForKey("ad1") as! Bool
            
        }
        
        //ad2 charboost
        
        if(NSUserDefaults.standardUserDefaults().objectForKey("ad2") != nil)
        {
            isAd2 = NSUserDefaults.standardUserDefaults().objectForKey("ad2") as! Bool
            
        }
        
        
        // ad3 ...
        
        if(NSUserDefaults.standardUserDefaults().objectForKey("ad3") != nil)
        {
            isAd3 = NSUserDefaults.standardUserDefaults().objectForKey("ad3") as! Bool
            
        }
        
        if(NSUserDefaults.standardUserDefaults().objectForKey("ad4") != nil)
        {
            isAd4 = NSUserDefaults.standardUserDefaults().objectForKey("ad4") as! Bool
            
        }
        
        if(NSUserDefaults.standardUserDefaults().objectForKey("ad5") != nil)
        {
            isAd5 = NSUserDefaults.standardUserDefaults().objectForKey("ad5") as! Bool
            
        }
        
        if(NSUserDefaults.standardUserDefaults().objectForKey("adOnline") != nil)
        {
            CheckOnline = NSUserDefaults.standardUserDefaults().objectForKey("adOnline") as! Bool
            print(NSUserDefaults.standardUserDefaults().objectForKey("adOnline"))
        }
        
        
        
        
        
        //GEt Ad unit online
        
        if(CheckOnline)
        {
            
            let xmlSetup = ADXML()
            xmlSetup.LoadXML()
        }
        SetupAdOnline()
        
        
    }
    
    
    func SetupAdOnline()
    {
        
        //google
        if(NSUserDefaults.standardUserDefaults().objectForKey("gBannerOnline") != nil)
        {
            GBannerAdUnit = NSUserDefaults.standardUserDefaults().objectForKey("gBannerOnline") as! String
            
        }
        
        if(NSUserDefaults.standardUserDefaults().objectForKey("gFullOnline") != nil)
        {
            GFullAdUnit = NSUserDefaults.standardUserDefaults().objectForKey("gFullOnline") as! String
        }
        
        //get edited appid & sign from Adcolony
        
        
        
        //get amazon online id
        if(NSUserDefaults.standardUserDefaults().objectForKey("amazon") != nil)
        {
            Amazonkey = NSUserDefaults.standardUserDefaults().objectForKey("amazon") as! String
            
        }
        
    }
    
    func timerVPNMethodAutoAd(timer:NSTimer) {
        print("VPN Checking....")
        let isAd = showAd()
        if(isAd && isStopAD)
        {
            
            ShowAdmobBanner()
            isStopAD = false
            print("Reopening Ad from admob......")
        }
        
        if(isAd == false && isStopAD == false)
        {
            gBannerView.removeFromSuperview()
            isStopAD = true;
            print("Stop showing Ad from admob......")
        }
        
    }
    
    
    
    func MoreGame()
    {
        let barsLink : String = "itms-apps://itunes.apple.com/ca/developer/phuong-nguyen/id1004963752"
        UIApplication.sharedApplication().openURL(NSURL(string: barsLink)!)
    }
    func OpenView(viewName: String, view: UIViewController)
    {
        let storyboard = UIStoryboard(name: "StoryboardAD", bundle: nil)
        
        let WebDetailView = storyboard.instantiateViewControllerWithIdentifier(viewName) as UIViewController
        
        view.presentViewController(WebDetailView , animated: true, completion: nil)
        
    }
    
    
    //GADBannerViewDelegate
    func adViewDidReceiveAd(view: GADBannerView!) {
        print("adViewDidReceiveAd:\(view)");
        
        //relayoutViews()
    }
    
    func adView(view: GADBannerView!, didFailToReceiveAdWithError error: GADRequestError!) {
        print("\(view) error:\(error)")
        
        //relayoutViews()
    }
    
    func adViewWillPresentScreen(adView: GADBannerView!) {
        print("adViewWillPresentScreen:\(adView)")
        
        //relayoutViews()
    }
    
    func adViewWillLeaveApplication(adView: GADBannerView!) {
        print("adViewWillLeaveApplication:\(adView)")
    }
    
    func adViewWillDismissScreen(adView: GADBannerView!) {
        print("adViewWillDismissScreen:\(adView)")
        
        // relayoutViews()
    }
    
    
    
    
    //amazon
    ///////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////
    @IBOutlet var amazonAdView: AmazonAdView!
    func showAmazonBanner()
    {
        amazonAdView = AmazonAdView(adSize: AmazonAdSize_320x50)
        loadAmazonAdWithUserInterfaceIdiom(UIDevice.currentDevice().userInterfaceIdiom, interfaceOrientation: UIApplication.sharedApplication().statusBarOrientation)
        amazonAdView.delegate = nil
        self.view.addSubview(amazonAdView)
    }
    
    
    func loadAmazonAdWithUserInterfaceIdiom(userInterfaceIdiom: UIUserInterfaceIdiom, interfaceOrientation: UIInterfaceOrientation) -> Void {
        
        let options = AmazonAdOptions()
        options.isTestRequest = false
        let x = (self.view.bounds.width - 320)/2
        //viewController.view.bounds.height - 50
        if (userInterfaceIdiom == UIUserInterfaceIdiom.Phone) {
            amazonAdView.frame = CGRectMake(x, amazonLocationY, 320, 50)
        } else {
            amazonAdView.removeFromSuperview()
            
            if (interfaceOrientation == UIInterfaceOrientation.Portrait) {
                amazonAdView = AmazonAdView(adSize: AmazonAdSize_728x90)
                amazonAdView.frame = CGRectMake((self.view.bounds.width-728.0)/2.0, amazonLocationY, 728.0, 90.0)
            } else {
                amazonAdView = AmazonAdView(adSize: AmazonAdSize_1024x50)
                amazonAdView.frame = CGRectMake((self.view.bounds.width-1024.0)/2.0, amazonLocationY, 1024.0, 50.0)
            }
            self.view.addSubview(amazonAdView)
            amazonAdView.delegate = nil
        }
        
        amazonAdView.loadAd(options)
    }
    func timerMethodAutoAmazon(timer:NSTimer) {
        print("auto load amazon")
        if(showAd())
        {
            showAmazonBanner()
        }
        
        
    }
    func isCDMA()->Bool
    {
        let abc = cclass()
        let Version = abc.platformNiceString()
        if(Version == "CDMA")
        {
            return true
        }
        
        return false
    }
    
    ////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////////////////////
    
    //////////////////////
    //amazonfull
    //////////////////////
    func loadAmazonFull()
    {
        let options = AmazonAdOptions()
        
        options.isTestRequest = false
        
        interstitialAmazon.load(options)
    }
    func showAmazonFull()
    {
        interstitialAmazon.presentFromViewController(self)
        
    }
    
    /////////////////////////////////////////////////////////////
    // Mark: - AmazonAdViewDelegate
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
    
    ///////////
    //full delegate
    // Mark: - AmazonAdInterstitialDelegate
    func interstitialDidLoad(interstitial: AmazonAdInterstitial!) {
        Swift.print("Interstitial loaded.", terminator: "")
        //loadStatusLabel.text = "Interstitial loaded."
        showAmazonFull()
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
        //loadAmazonFull();
    }
    
    
    //========================================================================================================================
    //========================================================================================================================
    //========================================================================================================================
    //===========================ADVERTISING======FOR-ADVERTISING=======ADVERTISING===========================================
    //============================================SIMPLE=VERSION==============================================================
    //========================================================================================================================
    //========================================================================================================================
    //========================================================================================================================

 
    
}

