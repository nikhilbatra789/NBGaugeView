# NBGaugeView

![CocoaPods Compatible](https://img.shields.io/badge/pod-0.1.0-green.svg)
![Platform iOS](https://img.shields.io/badge/platform-ios-blue.svg)
![License MIT](https://img.shields.io/badge/license-MIT-yellowgreen.svg)

![Screenshot](https://s11.postimg.org/7aax9zv37/Simulator_Screen_Shot_14_Nov_2016_11_34_44_AM.png)

## Introduction
NBGaugeView is a small library to create and display Gauge Views. It is fully customizable: you can set the color, size, text and many other properties of the gauge. This is a simple donut used for displaying text in hollow circle.

## Requirements
* iOS 8+
* Xcode 9.0+

## Installation 
### CocoaPods
Add the NBGaugeView pod into your project and run `pod install`
```ruby
pod 'NBGaugeView'
```
### Manual Install
Download NBGaugeVIew and import `NBGaugeView.swift` inside your xcode project.

## Sample App
To start using NBGaugeView you can build the provided example project

1. Open `Example/NBGaugeView.xcodeproj` in Xcode.
2. Build and run.

## Usage
It's very easy to set up, just import NBGaugeView in your Swift code:
```swift
import NBGaugeView
```
### Interface Builder:
Add an UIView with interface builder and set `NBGaugeView` as UIView custom class.

Link it with the outlet property declared in your code.

```swift
@IBOutlet private weak var gaugeView: NBGaugeView!
```

It's simple to customize! Here's an example of configuration of the view.

```swift
gaugeView.startAngle = 0
gaugeView.percentage = 60
gaugeView.thickness = 20
gaugeView.labelFont = UIFont.systemFont(ofSize: 40)
gaugeView.labelColor = UIColor.red
gaugeView.gaugeBackgroundColor = UIColor.gray
gaugeView.gaugeColor = UIColor.blue
```

## Radius
Radius fo the view is automatically adjusted with min of width and height of the view.

Radius can be fetched using the below property at anytime.
```swift
let radius = gaugeView.radius
```

## License
NBGaugeView is available under the MIT license. See the LICENSE file for more info.
