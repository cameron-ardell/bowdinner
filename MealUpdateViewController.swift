//
//  MealUpdateViewController.swift
//  testingTables
//
//  Created by Sophia M. Ardell on 5/1/16.
//  Copyright © 2016 Sophia M. Ardell. All rights reserved.
//

import UIKit

@IBDesignable class MealUpdateViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate  {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //setting up delegate and datasource for all meal locations
        locationOnePicker.delegate = self
        locationOnePicker.dataSource = self
        locationTwoPicker.delegate = self
        locationTwoPicker.dataSource = self
        locationThreePicker.delegate = self
        locationThreePicker.dataSource = self
        
        
        //redoing all text color
        beginOneLabel.setValue(UIColor.whiteColor(), forKeyPath: "textColor")
        endOneLabel.setValue(UIColor.whiteColor(), forKeyPath: "textColor")
        beginOneLabel.datePickerMode = .Time
        endOneLabel.datePickerMode = .Time
        
        beginTwoLabel.setValue(UIColor.whiteColor(), forKeyPath: "textColor")
        endTwoLabel.setValue(UIColor.whiteColor(), forKeyPath: "textColor")
        beginTwoLabel.datePickerMode = .Time
        endTwoLabel.datePickerMode = .Time
        
        beginThreeLabel.setValue(UIColor.whiteColor(), forKeyPath: "textColor")
        endThreeLabel.setValue(UIColor.whiteColor(), forKeyPath: "textColor")
        beginThreeLabel.datePickerMode = .Time
        endThreeLabel.datePickerMode = .Time
        
        
        //updating background colors of all pickerviews
        beginOneLabel.backgroundColor = UIColor(red: 107/255.0, green: 183/255.0, blue: 255/255.0, alpha: 1)
        endOneLabel.backgroundColor = UIColor(red: 107/255.0, green: 183/255.0, blue: 255/255.0, alpha: 1)
        locationOnePicker.backgroundColor = UIColor(red: 107/255.0, green: 183/255.0, blue: 255/255.0, alpha: 1)
        
        beginTwoLabel.backgroundColor = UIColor(red: 107/255.0, green: 183/255.0, blue: 255/255.0, alpha: 1)
        endTwoLabel.backgroundColor = UIColor(red: 107/255.0, green: 183/255.0, blue: 255/255.0, alpha: 1)
        locationTwoPicker.backgroundColor = UIColor(red: 107/255.0, green: 183/255.0, blue: 255/255.0, alpha: 1)
        
        beginThreeLabel.backgroundColor = UIColor(red: 107/255.0, green: 183/255.0, blue: 255/255.0, alpha: 1)
        endThreeLabel.backgroundColor = UIColor(red: 107/255.0, green: 183/255.0, blue: 255/255.0, alpha: 1)
        locationThreePicker.backgroundColor = UIColor(red: 107/255.0, green: 183/255.0, blue: 255/255.0, alpha: 1)
        
        
        
        
        //setting up time formatting
        timeFormatter.dateFormat = "h:mm a"
        timeFormatter.dateStyle = NSDateFormatterStyle.NoStyle
        timeFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        timeFormatter.AMSymbol = "AM"
        timeFormatter.PMSymbol = "PM"
        currentTime = timeFormatter.stringFromDate( NSDate() )

        //makes sure back button fits on screen
        backToNewsfeed.titleLabel?.adjustsFontSizeToFitWidth = true
        mealOneTitle.adjustsFontSizeToFitWidth = true
        
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //all options for dining location for picker wheel
    let diningData = ["Moulton", "Thorne", "Pub", "either dining hall"]
    
    //plan for each meal you could possibly set
    var plan1: [String] = ["12:00 AM", "12:00 AM", "unavailable", "unavailable"]
    var plan2: [String] = ["12:00 AM", "12:00 AM", "unavailable", "unavailable"]
    var plan3: [String] = ["12:00 AM", "12:00 AM", "unavailable", "unavailable"]
    
    //to modify times outputted by time picker wheel
    let timeFormatter = NSDateFormatter()
    var currentTime: String = "fuck this"
    
    
    
    //sends back to main 3 tabs
    @IBAction func backToNewsfeed(sender: UIButton) {
        
        print(plan1, "\n", plan2, "\n", plan3)
        
        let presentingVC = self.presentingViewController
        self.dismissViewControllerAnimated(true, completion: {
            presentingVC!.dismissViewControllerAnimated(false, completion: {})
        })
    }
    
    
    
    @IBOutlet weak var backToNewsfeed: UIButton!
    @IBOutlet weak var mealOneTitle: UILabel!
    

    //
    //setting picker wheel and switch information for first meal
    //
    @IBOutlet weak var locationOnePicker: UIPickerView!
    @IBOutlet weak var beginOneLabel: UIDatePicker!
    @IBOutlet weak var endOneLabel: UIDatePicker!
    @IBAction func beginOne(sender: AnyObject) {
        //only update if end time is later
        if (beginOneLabel.date.compare(endOneLabel.date)) != NSComparisonResult.OrderedDescending {
            plan1[0] = timeFormatter.stringFromDate(beginOneLabel.date)
            plan1[1] = timeFormatter.stringFromDate(endOneLabel.date)
        }
    }
    @IBAction func endOne(sender: AnyObject) {
        //only update if end time is later
        if (beginOneLabel.date.compare(endOneLabel.date)) != NSComparisonResult.OrderedDescending {
            plan1[0] = timeFormatter.stringFromDate(beginOneLabel.date)
            plan1[1] = timeFormatter.stringFromDate(endOneLabel.date)
        }
    }
    
    @IBOutlet weak var switchOne: UISwitch!
    @IBAction func availableOne(sender: UISwitch) {
        if switchOne.on {
            plan1[3] = "available"
        }
        else {
            plan1 = ["12:00 AM", "12:00 AM", "unavailable", "unavailable"]
        }
    }
    
    
    
    
    //
    //setting picker wheel and switch information for second meal
    //
    @IBOutlet weak var locationTwoPicker: UIPickerView!
    @IBOutlet weak var beginTwoLabel: UIDatePicker!
    @IBOutlet weak var endTwoLabel: UIDatePicker!
    @IBAction func beginTwo(sender: AnyObject) {
        //only update if end time is later
        if (beginTwoLabel.date.compare(endTwoLabel.date)) != NSComparisonResult.OrderedDescending {
            plan2[0] = timeFormatter.stringFromDate(beginTwoLabel.date)
            plan2[1] = timeFormatter.stringFromDate(endTwoLabel.date)
        }
    }
    @IBAction func endTwo(sender: AnyObject) {
        //only update if end time is later
        if (beginTwoLabel.date.compare(endTwoLabel.date)) != NSComparisonResult.OrderedDescending {
            plan2[0] = timeFormatter.stringFromDate(beginTwoLabel.date)
            plan2[1] = timeFormatter.stringFromDate(endTwoLabel.date)
        }
    }
    @IBOutlet weak var switchTwo: UISwitch!
    @IBAction func availableTwo(sender: UISwitch) {
        if switchTwo.on {
            plan2[3] = "available"
        }
        else {
            plan2 = ["12:00 AM", "12:00 AM", "unavailable", "unavailable"]
        }
    }
    
    
    
    
    //
    //setting picker wheel and switch information for third meal
    //
    @IBOutlet weak var locationThreePicker: UIPickerView!
    @IBOutlet weak var beginThreeLabel: UIDatePicker!
    @IBOutlet weak var endThreeLabel: UIDatePicker!
    @IBAction func beginThree(sender: AnyObject) {
        //only update if end time is later
        if (beginThreeLabel.date.compare(endThreeLabel.date)) != NSComparisonResult.OrderedDescending {
            plan2[0] = timeFormatter.stringFromDate(beginThreeLabel.date)
            plan2[1] = timeFormatter.stringFromDate(endThreeLabel.date)
        }
    }
    @IBAction func endThree(sender: AnyObject) {
        //only update if end time is later
        if (beginThreeLabel.date.compare(endThreeLabel.date)) != NSComparisonResult.OrderedDescending {
            plan2[0] = timeFormatter.stringFromDate(beginThreeLabel.date)
            plan2[1] = timeFormatter.stringFromDate(endThreeLabel.date)
        }
    }
    
    @IBOutlet weak var switchThree: UISwitch!
    @IBAction func availableThree(sender: UISwitch) {
        if switchThree.on {
            plan3[3] = "available"
        }
        else {
            plan3 = ["12:00 AM", "12:00 AM", "unavailable", "unavailable"]
        }
    }
        
        
        
        
        
        
        
    // MARK: - Delegates and data sources for dining location picker wheel
    
    //data sources
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return diningData.count
    }
    
    //delegates
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        let titleData = diningData[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        return myTitle
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch(pickerView.tag) {
            case 1:
                plan1[2] = diningData[row]
            case 2:
                plan2[2] = diningData[row]
            case 3:
                plan3[2] = diningData[row]
            default:
                break
        }
    }

}
