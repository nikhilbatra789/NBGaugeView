//
//  ViewController.swift
//  NBGaugeView
//
//  Created by NikhilBatra-Proptiger on 11/10/2016.
//  Copyright (c) 2016 NikhilBatra-Proptiger. All rights reserved.
//

import UIKit
import NBGaugeView

class ExampleViewController: UIViewController {
    
    @IBOutlet weak var thicknesslabel: UILabel!
    @IBOutlet weak var percentageLabel: UILabel!
    @IBOutlet weak var gaugeView: NBGaugeView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        gaugeView.startAngle = 0
        gaugeView.percentage = 60
        gaugeView.thickness = 20
        gaugeView.labelFont = UIFont.systemFont(ofSize: 40)
        gaugeView.labelColor = UIColor.red
        gaugeView.gaugeBackgroundColor = UIColor.gray
        gaugeView.gaugeColor = UIColor.blue
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func percentageChanged(_ sender: UISlider) {
        self.gaugeView.percentage = sender.value
        percentageLabel.text = "\(sender.value)"
    }
    
    @IBAction func thicknessChanged(_ sender: UISlider) {
        self.gaugeView.thickness = CGFloat(sender.value)
        thicknesslabel.text = "\(sender.value)"
    }
}

