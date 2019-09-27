//
//  MainViewController.swift
//  Teleprompter
//
//  Created by Ryan Rottmann on 9/27/19.
//  Copyright © 2019 Ryan Rottmann. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var rightView: UIView!
    
    @IBOutlet weak var TextView: UITextView!
    @IBOutlet weak var RightConstraint: NSLayoutConstraint!
    @IBOutlet weak var LeftConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var leftConstraint2: NSLayoutConstraint!
    @IBOutlet weak var rightConstraint2: NSLayoutConstraint!
    
    var myTimer: Timer?
    var beginningRange = 0
    var endRange = 1
    
    @objc func fireTimer(){
        print("Timer fired")
    
        beginningRange -= 1
        
        TextView.scrollRangeToVisible(NSMakeRange(beginningRange, endRange))
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //let displayLink = CADisplayLink(target: self, selector: #selector(fireTimer))
        //displayLink.add(to: .current, forMode: .RunLoop.Mode.default)
        
    }
    
    @IBAction func LeftDrag(_ sender: UIPanGestureRecognizer) {
        print(sender.translation(in: leftView))
        LeftConstraint.constant = sender.translation(in: leftView).x + 45
        RightConstraint.constant = sender.translation(in: leftView).x + 45
        
        leftConstraint2.constant = sender.translation(in: leftView).x - leftView.frame.width - 8 + 45
        rightConstraint2.constant = sender.translation(in: leftView).x - leftView.frame.width - 8 + 45
        
        
    }
    @IBAction func rightDrag(_ sender: UIPanGestureRecognizer) {
        print(sender.translation(in: leftView))
        LeftConstraint.constant = -sender.translation(in: leftView).x + 45
        RightConstraint.constant = -sender.translation(in: leftView).x + 45
        
        leftConstraint2.constant = -sender.translation(in: leftView).x - leftView.frame.width - 8 + 45
        rightConstraint2.constant = -sender.translation(in: leftView).x - leftView.frame.width - 8 + 45
    }
    
    @IBAction func Play(_ sender: Any) {
        //TextView.scrollRangeToVisible(NSMakeRange(10, 10))
        myTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
        
        
    }
    
    @IBAction func Pause(_ sender: Any) {
        myTimer?.invalidate()
    }
    
    @IBAction func Stop(_ sender: Any) {
        myTimer?.invalidate()
        TextView.scrollRangeToVisible(NSMakeRange(0, 0))
    }
    
    var x = 0
    @IBAction func Flip(_ sender: Any) {
        if (x==0){
            TextView.transform = CGAffineTransform(translationX: 180, y: 180)
            TextView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            x=1
        }
        else {
            TextView.transform = CGAffineTransform.identity
            x=0
        }
        
    }


}
