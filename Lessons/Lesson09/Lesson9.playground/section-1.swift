// Playground - noun: a place where people can play

import UIKit
/*
A couple ways of doing layouts:
Autolayout + storyboard
Springs & struts + storyboard
Autolayout + code
Springs & struts + code
*/

var width: CGFloat = 10

var point = CGPoint(x: 10, y: 10)
println(point.x)
println(point.y)
point.x = 20
point.y = 20

var size = CGSize(width: 20, height: 20)
println(size.width)
println(size.height)
size.height = 20

var rect = CGRect(origin: point, size: size)
println(rect.size.width)
println(rect.origin.y)
println(CGRectGetMidY(rect))
println(CGRectGetMaxX(rect))

// all numbers from IB are not pixels. They're points (virtual pixels). The resolution is listed in points not pixels (e.g. 320x480)

var container = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
// create UIView with a frame
container.backgroundColor = UIColor.brownColor()

var halfSubview = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 250))
halfSubview.backgroundColor = UIColor.redColor()
container.addSubview(halfSubview)
// add halfSubview to container

var quarterContainer = UIView(frame: CGRect(x: 250, y: 0, width: 250, height: 250))
quarterContainer.backgroundColor = UIColor.blueColor()
halfSubview.addSubview(quarterContainer)
// add quarterContainer to half of halfSubview which gets added to container

container

quarterContainer.frame.origin.x = 125
// change the x point where the shape is drawn from. In this case, the blue rectangle gets added to a part of halfSubview, but not from the halfway point.
container

var viewOnTop = UIView(frame: CGRect(x: 150, y: 10, width: 100, height: 100))
viewOnTop.backgroundColor = UIColor.purpleColor()
halfSubview.addSubview(viewOnTop)
container


