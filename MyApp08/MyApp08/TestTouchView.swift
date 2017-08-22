//
//  TestTouchView.swift
//  MyApp08
//
//  Created by user on 2017/6/26.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit

class TestTouchView: UIView {
    var isInitStat = false
    private var ttvc: testTouchVC?
    
    private func initState() {
         isInitStat = true
        let vc = findSuperVC(whichView: self)
        ttvc = vc as! testTouchVC
        print(ttvc!.a)
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        ttvc = storyboard.instantiateViewController(withIdentifier: "touchvc") as! testTouchVC
    }
    
    
    
    private func findSuperVC(whichView: UIView )
        -> UIViewController? {
            var responder: UIResponder = whichView
            while responder != nil {
                print("ok")
                if let vc = responder as? UIViewController {
                    return vc
                }
            responder = responder.next!
            
    }
    return nil
}
    override func draw(_ rect: CGRect) {
        if !isInitStat { initState() }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("myview: touch")
//        ttvc?.touchesBegan(touches, with: event)
    }
    
}
