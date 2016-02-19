//
//  ViewController.swift
//  Buddha2
//
//  Created by Phuong Nguyen on 6/5/15.
//  Copyright (c) 2015 Phuong Nguyen. All rights reserved.
//

import UIKit


class DetailViewController: UIViewController  {
    
    
    @IBOutlet weak var textv1: UITextView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //self.navigationController?.setNavigationBarHidden(true, animated: true)
//        let file = "chudaibi"
//        if let path = NSBundle.mainBundle().pathForResource(file, ofType: "html") {
//            // use path
//            let text2 = String(contentsOfFile: path, encoding: NSUTF8StringEncoding, error: nil)
//            println(text2)
//            textv1.text=text2
//
//            
//        }
 
        
          }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(animated: Bool) {
      
    }
    //begin iad
    // 1
//    func appdelegate() -> AppDelegate {
//        return UIApplication.sharedApplication().delegate as AppDelegate
//    }
    
    // 2
    override func viewWillAppear(animated: Bool) {
        _ = UIScreen.mainScreen().bounds.height
    }
    
       
}

