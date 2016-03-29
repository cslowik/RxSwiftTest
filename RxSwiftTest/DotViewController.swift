//
//  DotViewController.swift
//  RxSwiftTest
//
//  Created by Chris Slowik on 3/29/16.
//  Copyright © 2016 Chris Slowik. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import ChameleonFramework

class DotViewController: UIViewController {

    var circleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    func setup() {
        circleView = UIView(frame: CGRect(origin: view.center, size: CGSize(width: 100, height: 100)))
        circleView.layer.cornerRadius = circleView.frame.width / 2
        circleView.backgroundColor = UIColor.flatSkyBlueColor()
        circleView.center = view.center
        view.addSubview(circleView)
    }
}
