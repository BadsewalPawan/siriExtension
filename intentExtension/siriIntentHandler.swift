//
//  siriIntentHandler.swift
//  siriExtension
//
//  Created by Pawan Badsewal on 25/07/19.
//  Copyright © 2019 Pawan Badsewal. All rights reserved.
//

import Foundation



class siriIntentHandler: NSObject, OpenPageIntentHandling {
    
    func confirm(intent: OpenPageIntent, completion: @escaping (OpenPageIntentResponse) -> Void) {
        completion(OpenPageIntentResponse(code: .continueInApp, userActivity: nil))
    }

    
    func handle(intent: OpenPageIntent, completion: @escaping (OpenPageIntentResponse) -> Void) {
        completion(OpenPageIntentResponse.success(pageTitle: "Yellow page"))
    }
    
}
