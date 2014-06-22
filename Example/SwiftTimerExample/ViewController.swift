//
//  ViewController.swift
//  SwiftTimerExample
//
//  Created by Steve Wilford on 22/06/2014.
//  Copyright (c) 2014 Steve Wilford. All rights reserved.
//

import UIKit

// A class that doesn't inherit from NSObject
class PureSwift {
    
    var nsTimer: NSTimer?
    
    var nxTimer: NxSwiftTimer?
    
    func startNSTimer() {
        // This will cause a crash after 3 seconds as the target (self) does not inherit from NSObject
        self.nsTimer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "timerFired", userInfo: nil, repeats: false)
    }
    
    func startNxSwiftTimer() {
        self.nxTimer = NxSwiftTimer.scheduledTimerWithTimeInterval(3.0, userInfo: nil, repeats: false, closure: self.timerFired)
    }
    
    func timerFired() {
        println("PureSwift object says timer fired")
    }
    
}

class ViewController: UIViewController {
    
    var swiftObject = PureSwift()
    
    @IBAction func scheduleNSTimerButtonTapped(sender: UIButton) {
        
        swiftObject.startNSTimer()
        
    }
    
    @IBAction func scheduleNxTimerButtonTapped(sender: UIButton) {
        
        swiftObject.startNxSwiftTimer()

    }

}
