NxSwiftTimer
============

An `NSTimer` wrapper for Swift.

## Overview

While you can use an `NSTimer` with Swift classes, they must inherit from (either directly or indirectly) `NSObject`. If you try to use an `NSTimer` on a pure Swift class the following error will occur when the timer attempts to fire:-

```*** NSForwarding: warning: object 0x9fe0000 of class '_TtC17SwiftTimerExample9PureSwift' does not implement methodSignatureForSelector: -- trouble ahead```

Enter `NxSwiftTimer`. A lightweight wrapper around NSTimer that can be used on Swift classes that don’t inherit from `NSObject` :)

## Usage

It’s API follows that of `NSTimer` so it should be recognisable.

```
// Non-repeating timer with closure:
NxSwiftTimer.scheduledTimerWithTimeInterval(3.0) { 
  // Do something
}

// Repeating timer with closure:
NxSwiftTimer.scheduledTimerWithTimeInterval(3.0, userInfo: nil, repeats: true) { 
  // Do something
}

```
