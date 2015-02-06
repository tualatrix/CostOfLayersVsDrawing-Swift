//
//  ViewController.swift
//  CostOfLayersVsDrawing-Swift
//
//  Created by Tualatrix Chou on 15/2/4.
//  Copyright (c) 2015年 IMTX. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var containerView: UIView!
    var previousTimestamp: CFTimeInterval = 0
    var frameCounter: Int = 0
    var displayTime: Double = 0.0
    var numberOfViews: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        self.startProfile()
    }

    func startProfile() {
        displayTime = 0
        frameCounter = 0
        numberOfViews = 5

        self.recreateViews()

        let displayLink = CADisplayLink(target: self, selector: Selector("nextCreateFrame:"))
        displayLink.addToRunLoop(NSRunLoop.currentRunLoop(), forMode: NSRunLoopCommonModes)
    }

    func nextCreateFrame(displayLink: CADisplayLink) {
        if frameCounter > 0 {
            displayTime += displayLink.timestamp - previousTimestamp
        }

        frameCounter++

        if frameCounter > 60 {
            NSLog("\(numberOfViews) - \(displayTime / 60)")
            numberOfViews += 5
            displayTime = 0
            frameCounter = 0
        }

        self.recreateViews()
        previousTimestamp = displayLink.timestamp
    }

    func randomNumber() -> CGFloat {
        return CGFloat(Int(arc4random()) % 1000) / 1000.0
    }

    func recreateViews() {
        containerView?.removeFromSuperview()

        containerView = UIView(frame: CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height))

        for var i = 0; i < numberOfViews; i++ {
            let frame = CGRectMake(0, self.randomNumber() * containerView.bounds.size.height, containerView.bounds.size.width, 128);
            let subview = NativeView(frame: frame)
            containerView.addSubview(subview)
        }

        self.view.addSubview(containerView)
    }
}

