//
//  ViewController.swift
//  Chase
//
//  Created by user on 2017/7/6.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //螢幕的尺寸
    var fullSize :CGSize! = UIScreen.main.bounds.size
    
    @IBOutlet weak var Run: UIView!

    @IBOutlet weak var Eat: UIView!
    
    var ani = UIDynamicAnimator()
    var collision: UICollisionBehavior!
    var flag = true
    var watch = 0.07
  let dx = 0.9
  let dy = 0.9
  var disx:CGFloat = 0
  var disy:CGFloat = 0
  var timerTest:Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let boardWidth: CGFloat = self.view.frame.width
        let boardHeight: CGFloat = self.view.frame.height
//        print(boardWidth, boardHeight)
        //Run寬高
        let RunWidth: CGFloat = self.Run.frame.width
        let RunHeight: CGFloat = self.Run.frame.height
        
//                print(RunWidth, RunHeight)
        //Eat寬高
        let EatWidth: CGFloat = self.Eat.frame.width
        let EatHeight: CGFloat = self.Eat.frame.width
        
//                print(EatWidth, EatHeight)

        //多久計算
timerTest = Timer.scheduledTimer(withTimeInterval: watch, repeats: flag) { (timer) in
            if self.flag == true {
               self.ticker()
           }
        }
        //拖曳手勢
        let pan = UIPanGestureRecognizer(target: self, action: #selector(ViewController.pan(_:)))
        //最少幾根手指
        pan.minimumNumberOfTouches = 1
         //最多幾根手指
        pan.maximumNumberOfTouches = 1
        
        //監看手勢
        Run.addGestureRecognizer(pan)
    }
    
    //觸發拖曳手勢後 執行的動作
    func pan(_ recognizer:UIPanGestureRecognizer) {
        
        let point2 = recognizer.location(in: self.view)
        Run.center = point2
        
        let itemBehavior = UIDynamicItemBehavior(items: [Eat])
        itemBehavior.elasticity = 0.3
        ani.addBehavior(itemBehavior)
        
//   print(point1)

//         print(point2)
        
        let x1:Float = Float(Run.center.x)
        let y1:Float = Float(Run.center.y)
        let x2:Float = Float(Eat.center.x)
        let y2:Float = Float(Eat.center.y)

//        print(x2, y2)
        let rate:CGFloat = CGFloat(abs(x1 - x2) / abs(y1 - y2))
        let move = rate * CGFloat(dx)
//        print(rate)
        if x2 > x1 {
            disx += move * CGFloat(-1)
        }else {
            disx += move * CGFloat(1)
        }
//       print(dis)
        if y2 > y1 {
            disy += move * CGFloat(-1)
        }else {
            disy += move * CGFloat(1)
        }
        
    }
   
    func ticker() {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss"
        //陷入loop 因為不段觸發
//        if (view.frame.intersects(Eat.frame)) {
//            disx = -disx
//            disy = -disy
//            print(disx, disy)
//        }else{
//            disx = -disx
//            disy = -disy
//        }
        
        //Eat寬碰到view
        if Eat.center.x + self.Eat.frame.width / 2 > self.view.frame.width {
            disx = -disx
        }else {
            disx = disx * 1
        }
        if Eat.center.x - Eat.frame.width / 2 < 0 {
            disx = -disx
        }else {
            disx = disx * 1
        }
        //Eat長碰到view
        if Eat.center.y + self.Eat.frame.height / 2 > self.view.frame.height {
            disy = -disy
        }else {
            disy = disy * 1
        }
        if Eat.center.y - Eat.frame.height / 2 < 0 {
            disy = -disy
        }else {
            disy = disy * 1
        }
//        print(disx, disy)
        
        if (Eat.frame.intersects(Run.frame)) {
            disx = 0
            disy = 0
            print("pass")
            flag = false
           timerTest.invalidate()
            let alertController = UIAlertController (
                title: "GOT YOU", message: "Again?", preferredStyle: .alert
            )
            let okAction = UIAlertAction(title: "Yes", style: .default)
            { (action) in self.dismiss(animated: false, completion: nil)
            }
            alertController.addAction(okAction)
            
            self.present(alertController, animated: true, completion: nil)
        }
        Eat.center.x += disx
        Eat.center.y += disy
        //碰撞
        ani = UIDynamicAnimator(referenceView: view)
        collision = UICollisionBehavior(items: [Eat])
        collision.translatesReferenceBoundsIntoBoundary = true
        ani.addBehavior(collision)

//        print(Eat.center.x, Eat.center.y)
//        print(whatTime)
    }
}


