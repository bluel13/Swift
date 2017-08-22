//
//  ViewController.swift
//  MyApp12
//
//  Created by user on 2017/6/29.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func test7(_ sender: Any) {
      ani = UIDynamicAnimator(referenceView: self.view)
      let beh = UIPushBehavior(items: [vv], mode: UIPushBehaviorMode.continuous)
      beh.magnitude = 1.0   //1000 point/s^2
      beh.angle = 45.0 / 180.0 * CGFloat(Double.pi)
        
      let beh2 = UICollisionBehavior(items: [vv])
      beh2.translatesReferenceBoundsIntoBoundary = true
        
      ani.addBehavior(beh)
      ani.addBehavior(beh2)
    }
    var ani : UIDynamicAnimator!
    @IBAction func test6(_ sender: Any) {
    
     ani = UIDynamicAnimator(referenceView: vv)
        
       let beh = UIGravityBehavior(items: [vv])
       beh.gravityDirection = CGVector(dx: 0, dy: 1)
       
       let beh2 = UICollisionBehavior(items: [vv])
       beh2.translatesReferenceBoundsIntoBoundary = true
        
       ani.addBehavior(beh)
       ani.addBehavior(beh2)
    }
    @IBAction func test5(_ sender: Any) {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .allowAnimatedContent, animations: {() in
        
        self.face.transform = CGAffineTransform(scaleX: 2, y: 2)
        }, completion: nil)
            
        
    }
    @IBOutlet weak var welcome: UIImageView!
    @IBOutlet weak var face: UIImageView!
    @IBOutlet weak var vv: UIImageView!
    @IBAction func test4(_ sender: Any) {
        UIView.animate(withDuration: 1, delay: 0, options: UIViewAnimationOptions.allowAnimatedContent , animations: {() in
        self.face.transform = CGAffineTransform(scaleX: 2, y: 2)
        }, completion: {(isOK) in
        UIView.animate(withDuration: 0.5, animations: {() in
        self.face.transform = CGAffineTransform(scaleX: 1, y: 1)
        })
        
        })
        
    }
    @IBAction func test3(_ sender: Any) {
        UIView.animate(withDuration: 2, delay: 0, options: UIViewAnimationOptions.allowAnimatedContent , animations: {() in
            self.vv.center.x += 200
            
        }, completion: {(isFinish) in
            UIView.animate(withDuration: 2, animations: {() in
            self.face.center.y -= 100
            })
        })
    }
    @IBAction func test2(_ sender: Any) {
        UIView.animate(withDuration: 2, animations: {() in
        self.vv.center.x += 100
//        self.face.center.y += 100
        })
        UIView.animate(withDuration: 2, delay: 1, options: UIViewAnimationOptions.allowAnimatedContent , animations: {() in
        self.vv.center.y += 100
        
        }, completion: nil)
        
        
    }
    @IBAction func test1(_ sender: Any) {
       let darkEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
       let darkView = UIVisualEffectView(effect: darkEffect)
    darkView.frame = welcome.bounds
    welcome.addSubview(darkView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        ani = UIDynamicAnimator(referenceView: vv)
//        
//        let beh = UIGravityBehavior(items: [vv])
//        beh.gravityDirection = CGVector(dx: 0, dy: 1)
//        ani.addBehavior(beh)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

