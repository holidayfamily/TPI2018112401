//
//  NumberClick.swift
//  testapp
//
//  Created by 주 윤령 on 11/12/2018.
//  Copyright © 2018 주 윤령. All rights reserved.
//

import UIKit
import CoreFoundation

class NumberClick: UIViewController {
    
    @IBOutlet var noticText: UITextView!
    @IBOutlet var num1: UIButton!
    @IBOutlet var num2: UIButton!
    @IBOutlet var num3: UIButton!
    @IBOutlet var num4: UIButton!
    @IBOutlet var num5: UIButton!
    @IBOutlet var num6: UIButton!
    var startTime:CFAbsoluteTime = 0.0
    var flag = true
    var numValueArr:Array = Array<Int>()
    override func viewDidLoad() {
        super.viewDidLoad()
        moviemotion()
        setnumValue()
       // setNumber()
    }
    
    @IBAction func clicknum(_ sender: UIButton) {
        let buttonid:String = sender.restorationIdentifier!
        
    }
    func moviemotion(){
        UIView.animate(withDuration: 3.00, delay: 0.0, options: .curveEaseInOut, animations: {
            
            var move1 =  CGAffineTransform(translationX: 80, y: 80)
            // 가로 100, 세로 100 만큼 움직이는 메소드
            
            var move2 =  CGAffineTransform(scaleX: 2, y: 2)
            // 가로 2배, 세로 2배 키우는 메소드
            
            var move3 =  CGAffineTransform(rotationAngle: 45)
            // 객체를 회전하는 메소드!
            self.num1.transform  = move2.concatenating(move3)
            self.num2.transform  = move3.concatenating(move1)
            self.num3.transform  = move1.concatenating(move3)
            self.num4.transform  = move2.concatenating(move1)
            self.num5.transform  = move3.concatenating(move1)
            self.num6.transform  = move1.concatenating(move2)
            
        }, completion: nil)
        
    }
    func setNumber(){
        startTime = CFAbsoluteTimeGetCurrent()
        
        while(flag){
            let timeGab = CFAbsoluteTimeGetCurrent() - startTime
             print(timeGab)
            if(timeGab>4){
                
                moviemotion()
                flag=false
            }
        }

    }
    
    func setnumValue(){
        numValueArr.removeAll()
        while numValueArr.count < 6 {
            let numValue:Int = Int.random(in: 1...99)
            if(!numValueArr.contains(numValue)){
                numValueArr.append(numValue)
            }
          

        }
        num1.setTitle(String(numValueArr[0]), for: .normal)
        num2.setTitle(String(numValueArr[1]), for: .normal)
        num3.setTitle(String(numValueArr[2]), for: .normal)
        num4.setTitle(String(numValueArr[3]), for: .normal)
        num5.setTitle(String(numValueArr[4]), for: .normal)
        num6.setTitle(String(numValueArr[5]), for: .normal)
     }
}
