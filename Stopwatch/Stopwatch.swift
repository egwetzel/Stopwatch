//
//  Stopwatch.swift
//  Stopwatch
//
//  Created by Emme Wetzel on 9/4/23.
//

import Foundation

class Stopwatch {
  
  private var startTime: NSDate?
  
  var isRunning: Bool {
    if startTime == nil {
      return false
    }
    else { return true }
  }
  
  var elapsedTime: TimeInterval {
    if let startTime = self.startTime {
      return -1 * startTime.timeIntervalSinceNow // could also just say -startTime.timeIntervalSinceNow
    } else {
      return 0
    }
  }
  
  var elapsedTimeAsString: String {
    // return the formatted string...
    // minutes, seconds, fraction
    let diffMinutes = Int(elapsedTime/60)
    let diffSecondsFloat = Float((elapsedTime.truncatingRemainder(dividingBy: 60)))
    let diffSeconds = Int((elapsedTime.truncatingRemainder(dividingBy: 60)))
    let diffFractionSec = Int((elapsedTime - floor(elapsedTime))*10)
    return(String(format: "%02d:%02d.\(diffFractionSec)", diffMinutes, diffSeconds))
  }

  func start() {
    startTime = NSDate()
  }

  func stop() {
    startTime = nil
  }
   
}
