//
//  ViewController.swift
//  Stopwatch
//
//  Created by Emme Wetzel on 9/4/23.
//

import UIKit

class ViewController: UIViewController {
  
  let stopwatch = Stopwatch()
  
  @IBOutlet weak var elapsedTimeLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  @objc func updateElapsedTimeLabel(timer: Timer) {
    if stopwatch.isRunning {
      elapsedTimeLabel.text = stopwatch.elapsedTimeAsString
    } else {
      timer.invalidate()
    }
  }
  
  @IBAction func startButtonTapped(sender: UIButton) {
    Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.updateElapsedTimeLabel), userInfo: nil, repeats: true)
    stopwatch.start()
  }

  @IBAction func stopButtonTapped(sender: UIButton) {
    stopwatch.stop()
  }

}

