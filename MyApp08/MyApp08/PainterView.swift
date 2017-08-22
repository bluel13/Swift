//
//  PainterView.swift
//  MyApp08
//
//  Created by user on 2017/6/23.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit

class PainterView: UIView {
    private var viewW: CGFloat = 0
    private var viewH: CGFloat = 0
    private var lines: Array<Array<(CGFloat, CGFloat)>> = []
    private var recycle: Array<Array<(CGFloat, CGFloat)>> = []
    private var isInit = false
    private var context: CGContext?
    private var imgApple = UIImage(named: "vvvo.png")
    
    private var ballImg = UIImage(named: "ball.png")
    private var imgH:CGFloat?
    private var imgW:CGFloat?
    private var ballW:CGFloat?
    private var ballH:CGFloat?
    private var ballX:CGFloat = 1
    private var ballY:CGFloat = 1
    private var dX:CGFloat = 2
    private var dY:CGFloat = 2
    private var i = 0
    
    
    
    private func initState(_ rect:CGRect) {
        isInit = true
        viewW = rect.size.width
        viewH = rect.size.height
        context = UIGraphicsGetCurrentContext()
        
         imgW = imgApple?.size.width
         imgH = imgApple?.size.height
        imgApple?.draw(in: CGRect(x: 0, y: 0, width: imgW!, height: imgH!))
        
//        ballW = ballImg?.size.width
//        ballH = ballImg?.size.height
        
//        Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true, block: { (timer) in
//            self.refreashView()
//        })
        
    }
//    func refreashView() {
//        i += 1
//        if i % 2 == 0 {
//            moveBall()
//        }
//        setNeedsDisplay()
//    }
    
//    func moveBall() {
//        if ballX < 0 || ballX + ballW! > viewW {
//            dX *= -1
//        }
//        if ballY < 0 || ballY + ballH! > viewH {
//            dY *= -1
//        }
//        
//       ballX += dX
//        ballY += dY
//        
//      setNeedsDisplay()
//        
//    }
    
    
    //呈現外觀
    override func draw( _ rect: CGRect) {
        if !isInit {initState(rect)}
//        viewW = rect.size.width
//        viewH = rect.size.height
        
//        let context:CGContext? = UIGraphicsGetCurrentContext()
        
        context?.setLineWidth(2)
        context?.setStrokeColor(red: 0, green: 0, blue: 1, alpha: 1)
        
      
//        ballImg?.draw(in: CGRect(x: ballX, y: ballY, width: ballW!, height: ballH!))
        
        //從1開始有線(0點-1點)
        
        
        for j in 0..<lines.count {
            if lines[j].count <= 1 {continue}
           for i in 1..<lines[j].count {
            let (p0x, p0y) = lines[j][i-1]
            let (p1x, p1y) = lines[j][i]  //i替換1有奇效
            
        context?.move(to: CGPoint(x: p0x, y: p0y))
        context?.addLine(to: CGPoint(x: p1x, y: p1y))
        context?.drawPath(using: CGPathDrawingMode.stroke)
            
            
        }
//        print("\(viewW) x \(viewH)")
   }
    
//        var img = UIImage(named: "vvvo.png")
//        var imgW = img?.size.width
//        var imgH = img?.size.height
//        var temp = UIImageView (image: img)
//        temp.frame = CGRect(x: 0, y: 0, width: imgW!, height: imgH!)
//        addSubview(temp)
    
        //    let imgCG = img?.cgImage
        //        context?.draw(imgCG!, in: CGRect(x: 0, y: 0, width: imgW!, height: imgH!))
        
//        img?.draw(in: CGRect(x: 0, y: 0, width: imgW!, height: imgH!))
//    
    }


override func touchesBegan( _ touches: Set<UITouch>, with event: UIEvent?) {
    let touch: UITouch = touches.first!
    let point: CGPoint = touch.location(in: self)
    recycle = [[]]
    lines += [[]]
    
    lines[lines.count-1] += [(point.x, point.y)]
    
    print("\(point.x) x \(point.y)")
}

override func touchesMoved( _ touches: Set<UITouch>, with event: UIEvent?) {
    let touch: UITouch = touches.first!
    let point: CGPoint = touch.location(in: self)
    
    lines[lines.count-1] += [(point.x, point.y)]
    setNeedsDisplay()
    }

//override func touchesEnded( _ touches: Set<UITouch>, with event: UIEvent?) {
//    let touch: UITouch = touches.first!
//    let point: CGPoint = touch.location(in: self)
//    lines += [(point.x, point.y)]
//}


func clear() {
    lines = [[]]
    recycle = [[]]
    setNeedsDisplay()
}

    func undo() {
        if lines.count > 0 {
            recycle += [lines.remove(at: lines.count-1)]
            setNeedsDisplay()
        }
}
    func redo() {
        if recycle.count > 0 {
            lines += [recycle.remove(at:recycle.count-1)]
            setNeedsDisplay()
        }
        
}
}
