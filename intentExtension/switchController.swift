//
//  switchController.swift
//  siriExtension
//
//  Created by Pawan Badsewal on 25/07/19.
//  Copyright © 2019 Pawan Badsewal. All rights reserved.
//

import Foundation
import UIKit
var setState = switchController(isComingFromSiri: false)

struct switchController {
    var isComingFromSiri:Bool

    init(isComingFromSiri:Bool) {
        self.isComingFromSiri = isComingFromSiri
    }

    mutating func toggleIsComingFromSiri(state:Bool){
        isComingFromSiri = state
    }
}


