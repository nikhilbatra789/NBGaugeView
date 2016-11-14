//
//  NBGaugeView.swift
//  NBGaugeView
//
//  Created by Nikhil Batra on 2/19/16.
//  Copyright © 2016 Nikhil. All rights reserved.
//

import UIKit

@IBDesignable
@objc public class NBGaugeView: UIView {
    
    private var label: UILabel!
    private var tapGesture:UITapGestureRecognizer?
    public var onClicked:(()->(Void))?
    
    @IBInspectable public var startAngle: Float = Float(M_PI * 3/2)
    
    public var radius: CGFloat {
        return min(self.bounds.width, self.bounds.height)/2
    }
    
    @IBInspectable public var thickness: CGFloat = 20 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable public var percentage: Float = 20 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable public var gaugeBackgroundColor: UIColor = UIColor.gray
    
    @IBInspectable public var gaugeColor: UIColor = UIColor.red
    
    //Label property
    @IBInspectable public var labelText: String = "" {
        didSet {
            if self.label != nil {
                label.text = labelText
                updateTextLabel()
            }
        }
    }
    
    @IBInspectable public var labelFont: UIFont? = UIFont(name: "Helvetica Neue", size: 20) {
        didSet {
            if let labelFont = labelFont {
                label.font = labelFont
                updateTextLabel()
            }
        }
    }
    
    @IBInspectable public var labelColor: UIColor? {
        didSet {
            if let labelColor = labelColor {
                label.textColor = labelColor
                updateTextLabel()
            }
        }
    }
    
    //MARK: - Init methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        createTitleLabel()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createTitleLabel()
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        createTitleLabel()
    }
    
    //MARK-: Private Methods
    private func updateTextLabel() {
        label.sizeToFit()
        label.center = CGPoint(x: self.bounds.width/2, y: self.bounds.height/2)
    }
    
    private func createTitleLabel() {
        
        label = UILabel(frame: CGRect(origin: CGPoint.zero, size: CGSize.zero))
        updateTextLabel()
        label.textAlignment = .center
        label.numberOfLines = 0;
        self.addSubview(label)
        self.tapGesture = UITapGestureRecognizer(target: self, action: #selector(NBGaugeView.onTap))
        self.addGestureRecognizer(self.tapGesture!)
    }
    
    override public func draw(_ rect: CGRect) {
        var startAngleInDegrees = self.startAngle.truncatingRemainder(dividingBy: 360)
        startAngleInDegrees = startAngleInDegrees - 90
        let center = CGPoint(x:bounds.width/2, y: bounds.height/2)
        let radius: CGFloat = self.radius
        let arcWidth: CGFloat = self.thickness
        let startAngle = CGFloat(self.convertDegreesToRadian(degrees: startAngleInDegrees))
        let endAngleInDegree = ((360.0 / 100.0) * percentage) + startAngleInDegrees
        let endAngle: CGFloat = CGFloat(self.convertDegreesToRadian(degrees: endAngleInDegree))
        
        //Draw Percent Path
        if percentage != 0 {
            let arcPath = UIBezierPath(arcCenter: center,
                                       radius: radius - arcWidth/2,
                                       startAngle: startAngle,
                                       endAngle: endAngle,
                                       clockwise: true)
            
            arcPath.lineWidth = arcWidth
            self.gaugeColor.setStroke()
            arcPath.stroke()
        } else {
            let arcPath = UIBezierPath(arcCenter: center,
                                       radius: radius - arcWidth/2,
                                       startAngle: 0,
                                       endAngle: CGFloat(2) * CGFloat(M_PI),
                                       clockwise: true)
            
            arcPath.lineWidth = arcWidth
            self.gaugeBackgroundColor.setStroke()
            arcPath.stroke()
        }
        
        if percentage != 100 {
            //Draw Left Path
            let backgroundArcPath = UIBezierPath(arcCenter: center,
                                                 radius: radius - arcWidth/2,
                                                 startAngle: endAngle,
                                                 endAngle: CGFloat(self.convertDegreesToRadian(degrees: startAngleInDegrees)),
                                                 clockwise: true)
            
            backgroundArcPath.lineWidth = arcWidth
            self.gaugeBackgroundColor.setStroke()
            backgroundArcPath.stroke()
        }
    }
    
    //MARK: - Utility method
    private func convertDegreesToRadian(degrees: Float) -> Float {
        return ((Float(M_PI) * degrees) / 180.0)
    }
    
    func onTap() {
        if self.onClicked != nil {
            self.onClicked!()
        }
    }
}
