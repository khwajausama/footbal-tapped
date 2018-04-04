//
//  FirstViewController.swift
//  footbal tapped
//
//  Created by Mac on 3/29/18.
//  Copyright © 2018 KhawajaUsama. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var lblFifa: UILabel!
    
    @IBOutlet weak var demo: UILabel!
    @IBOutlet weak var lblTopMessage: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    var countDownTimer: Timer!
    var totalTime = 6308220
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblFifa.text = NSLocalizedString("FIFA WORLD CUP", comment: "")
        self.lblTopMessage.text = NSLocalizedString("2018-RUSSIA", comment: "")
        // Do any additional setup after loading the view, typically from a nib.
        startTimer()
        //currentTime()
        print("test")
    demo.text = convertToUTC(dateToConvert: "14-06-2018 6:00 PM")
        print("Converted Date == \(convertToUTC(dateToConvert: "14-06-2018 6:00 PM"))")
    }
    func convertToUTC(dateToConvert:String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy hh:mm a"
        let convertedDate = formatter.date(from: dateToConvert)
        formatter.timeZone = TimeZone(identifier: "UTC")
        let somedate = Date()
        let timeInterval = somedate.timeIntervalSince1970
        var myInt = timeInterval
        //myInt = formatter.timeZone
        return formatter.string(from: convertedDate!)
        
    }
    
    
//        func currentTime() {
            //: # Today's Date
//            NSLocale* currentLocale = [NSLocale currentLocale];
//            [[NSDate date] descriptionWithLocale:currentLocale];
//            let today = NSDate()
//            let locale = NSLocale.current
//            today.description(with: locale)
//
//            print("Time of today: \(today.description(with: locale))")
//
//            let thisTimeTomrrow = NSDate(timeIntervalSinceNow: 86400)
//
//            print("Time of tomorrow: \(thisTimeTomrrow)")
//            let thisTimeYesterday = NSDate(timeIntervalSinceNow: -86400)
//
//            //: ## Converting dates to strings
//            let dateFormatter = DateFormatter()
//            dateFormatter.dateFormat = "yyyy-MM-dd"
//            print(dateFormatter.string(from: today as Date))
//
//            dateFormatter.dateFormat = "MMM dd, yyyy"
//            print(dateFormatter.string(from: today as Date))
//
//            //printing dates intervals
//
//
//            print("Time of yesterday: \(thisTimeYesterday)")
        //}
    func getCurrentLocalDate()-> Date {
    var now = Date()
    var nowComponents = DateComponents()
    let calendar = Calendar.current
    //nowComponents.year = Calendar.current.component(.year, from: now)
    //nowComponents.month = Calendar.current.component(.month, from: now)
    nowComponents.day = Calendar.current.component(.day, from: now)
    nowComponents.hour = Calendar.current.component(.hour, from: now)
    nowComponents.minute = Calendar.current.component(.minute, from: now)
    nowComponents.second = Calendar.current.component(.second, from: now)
    nowComponents.timeZone = TimeZone(abbreviation: "GMT")!
    now = calendar.date(from: nowComponents)!
        print(now)
    return now as Date
    }

    
    
    func startTimer() {
        countDownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime() {
        //timeLabel.text = "\(getCurrentLocalDate())"
        timeLabel.text = "\(timeFormatted(totalTime))"
        
        if totalTime != 0 {
            totalTime -= 1
        } else {
            endTimer()
        }
    }
    func endTimer() {
        countDownTimer.invalidate()
    }
    
    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        let hours: Int = (totalSeconds % 86400) / 3600
        let days:  Int =  (totalSeconds / 86400)
       
        return String(format: "%02d %02d %02d %02d", days, hours, minutes, seconds)
    }
   
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

