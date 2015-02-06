//
//  NativeView.swift
//  CostOfLayersVsDrawing-Swift
//
//  Created by Tualatrix Chou on 15/2/6.
//  Copyright (c) 2015年 IMTX. All rights reserved.
//

import UIKit

class NativeView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.setup()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        self.setup()
    }

    func setup() {
        let gradientView = UIView(frame: self.bounds)
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [UIColor.lightGrayColor().CGColor, UIColor.whiteColor().CGColor];
        gradientView.layer.addSublayer(gradientLayer)
        self.addSubview(gradientView)

        let imageView = UIImageView(frame: CGRectMake(0, 0, 128, 128))
        imageView.image = UIImage(named: "AppIcon_128x128")
        self.addSubview(imageView)

        let label1 = UILabel(frame: CGRectMake(140, 0, self.bounds.size.width - 140, 20))
        label1.text = "Manico"
        label1.backgroundColor = UIColor.clearColor()
        self.addSubview(label1)

        let label2 = UILabel(frame: CGRectMake(140, 30, self.bounds.size.width - 140, 20))
        label2.text = "Make you switch app faster!"
        label2.backgroundColor = UIColor.clearColor()
        self.addSubview(label2)
    }
}
