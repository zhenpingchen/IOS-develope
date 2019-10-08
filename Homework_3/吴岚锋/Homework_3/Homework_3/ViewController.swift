//
//  ViewController.swift
//  Homework_3
//
//  Created by Apple on 2019/10/8.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var running = false
    var timer = Timer()
    var m = 00
    var s = 00
    var ms = 00
    
    
    @IBOutlet weak var min: UILabel!
    
    
    @IBOutlet weak var second: UILabel!
    

    @IBOutlet weak var msecond: UILabel!
    
    
    @IBOutlet weak var startBtn: UIButton!
    
    
    @IBOutlet weak var stopBtn: UIButton!
    
    @IBOutlet weak var resetBtn: UIButton!
    
    @IBAction func start(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    
        running = true
        startBtn.isEnabled = false
        stopBtn.isEnabled = true
    }
    
    @IBAction func stop(_ sender: UIButton) {
        timer.invalidate()
        running = false
        startBtn.isEnabled = true
        stopBtn.isEnabled = false
    }
    
    @IBAction func reset(_ sender: UIButton) {
        timer.invalidate()
        running = false
        startBtn.isEnabled = true
        stopBtn.isEnabled = false
        
        m = 00
        s = 00
        ms = 00
        setTime(m: m, s: s, ms: ms)
    }
    
    @objc func updateTime() {
        ms += 1
        
        if ms == 100 {
            ms = 00
            s += 1
        }
        if s == 60 {
            s = 00
            m += 1
        }
        
        setTime(m: m, s: s, ms: ms)
    }
    
    func setTime(m: Int, s: Int, ms: Int) {
        if m < 10 {
            min.text = "0" + String(m)
        }
        else {
            min.text = String(m)
        }
        if s < 10 {
            second.text = "0" + String(s)
        }
        else {
            second.text = String(s)
        }
        if ms < 10 {
            msecond.text = "0" + String(ms)
        }
        else {
            msecond.text = String(ms)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        stopBtn.isEnabled = false
    }


}

