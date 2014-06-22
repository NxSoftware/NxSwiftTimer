//
//  NxSwiftTimer.swift
//
//  Created by Steve Wilford on 22/06/2014.
//  Copyright (c) 2014 Steve Wilford. All rights reserved.
//

import Foundation

// Class that inherits from NSObject so we can use an NSTimer on it
class NxSwiftTimer: NSObject {
    
    /**
     * A private NSTimer object
     */
    var internalTimer: NSTimer?
    
    /**
     * The closure that will be invoked when the timer has fired
     */
    var closure: (() -> ())?
    
    /**
     * A strong reference to a user defined object
     */
    var userInfo: AnyObject!
    
    /**
     * Schedules a timer, equivalent to NSTimer's scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:
     */
    class func scheduledTimerWithTimeInterval(interval: NSTimeInterval, userInfo: AnyObject! = nil, repeats yesOrNo: Bool = false, closure: () -> ()) -> NxSwiftTimer {
        var timer = NxSwiftTimer()
        timer.closure = closure
        timer.userInfo = userInfo
        timer.internalTimer = NSTimer.scheduledTimerWithTimeInterval(interval, target: timer, selector: Selector("internalTimerFired"), userInfo: nil, repeats: yesOrNo)
        return timer
    }
    
    /**
     * Convenience method for non-repeating scheduledTimerWithTimeInterval.
     */
    class func scheduledTimerWithTimeInterval(interval: NSTimeInterval, closure: () -> ()) -> NxSwiftTimer {
        return self.scheduledTimerWithTimeInterval(interval, userInfo:nil, repeats:false, closure:closure)
    }
    
    /**
    * Stops the receiver from ever firing again and requests its removal from its run loop.
    This method is the only way to remove a timer from an NSRunLoop object. The NSRunLoop object removes its strong reference to the timer, either just before the invalidate method returns or at some later point.
    If it was configured with target and user info objects, the receiver removes its strong references to those objects as well.
    You must send this message from the thread on which the timer was installed. If you send this message from another thread, the input source associated with the timer may not be removed from its run loop, which could prevent the thread from exiting properly.
     */
    func invalidate() {
        internalTimer?.invalidate()
    }
    
    func internalTimerFired() {
        closure?()
    }
}
