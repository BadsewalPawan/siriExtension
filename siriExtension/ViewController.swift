//
//  ViewController.swift
//  siriExtension
//
//  Created by Pawan Badsewal on 23/07/19.
//  Copyright © 2019 Pawan Badsewal. All rights reserved.
//

import UIKit
import Intents
import os.log

let redPageActivityType = "com.siriExtension.RedPage"

class ViewController: UIViewController {

    
    
    @objc func updateUser(not: Notification) {
        print("@objc")
        if let userInfo = not.userInfo {
            if let userName = userInfo["name"] as? String {
                print(userName)
//                let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                let vc = storyboard.instantiateViewController(withIdentifier: "YellowVC") //as! YellowVC
                DispatchQueue.main.async {
//                    self.navigationController!.pushViewController(vc, animated: true)
                    self.tabBarController?.selectedIndex = 2
                }
                print("done")
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        donateInteraction()
        
        let userUpdateNotification = Notification.Name("userUpdate")
        NotificationCenter.default.addObserver(self, selector: #selector(updateUser(not:)), name: userUpdateNotification, object: nil)
        
        
        // Do any additional setup after loading the view.
        
        
//        let viewPageActivity: NSUserActivity = {
//            let userActivity = NSUserActivity(activityType: redPageActivityType)
//            userActivity.title = "Red Page"
//            userActivity.isEligibleForSearch = true
//            userActivity.isEligibleForPrediction = true
//            return userActivity
//        }()
//
//        userActivity = viewPageActivity
 
    }

    func donateInteraction() {
        let intent = OpenPageIntent()
        
        intent.suggestedInvocationPhrase = "Red Page"
        
        let interaction = INInteraction(intent: intent, response: nil)
        
        interaction.donate { (error) in
            if error != nil {
                if let error = error as NSError? {
                    os_log("Interaction donation failed: %@", log: OSLog.default, type: .error, error)
                } else {
                    os_log("Successfully donated interaction")
                }
            }
        }
    }
    
}

