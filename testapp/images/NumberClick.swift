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
    @IBOutlet var nextbutton: UIButton!
    var startTime:CFAbsoluteTime = 0.0
    var flag = true
    var numValueArr:Array = Array<Int>()
    var buttonCount:Int = 0
    var rightAnswerCount:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        moviemotion()
        setnumValue()
        nextbutton.isHidden = true
    }
    
    @IBAction func clicknum(_ sender: UIButton) {
        let buttonNum:String = sender.currentTitle!
        let path = Bundle.main.path(forResource: "data", ofType:"plist")
        let data = NSMutableDictionary(contentsOfFile: path!)
        
        if (Int(buttonNum) != numValueArr[buttonCount]){
           
            let alertController = UIAlertController(title: "이런", message: "다시 한번해볼까요?", preferredStyle:.alert)
            let alertbutton = UIAlertAction(title: "확인", style: .destructive) {
                (restult : UIAlertAction) -> Void in
            }
            alertController.addAction(alertbutton)
            self.present(alertController,animated: true,completion: nil)

            setdata("orderW")
            setnumValue()
            moviemotion()
        }else if(buttonCount==5){
            if(rightAnswerCount == 5){
                let alertController = UIAlertController(title: "축하해요", message: "5번 정답을 맞추셨군요. 다음 단계로 이동하시고싶으시면 하단의  NEXT 버튼을 클릭해주세요", preferredStyle:.alert)
                let alertbutton = UIAlertAction(title: "확인", style: .destructive) {
                    (restult : UIAlertAction) -> Void in
                }
                alertController.addAction(alertbutton)
                self.present(alertController,animated: true,completion: nil)
                nextbutton.isHidden = false
            }
            setdata("orderR")
            rightAnswerCount += 1
            setnumValue()
            moviemotion()
        }else{
            sender.isHidden = true
            buttonCount += 1
        }
        
    }
    func moviemotion(){
        UIView.animate(withDuration: 3.00, delay: 0.0, options: .curveEaseInOut, animations: {
            
            let move1 =  CGAffineTransform(translationX: 80, y: 80)
            // 가로 , 세로  만큼 움직이는 메소드
            
            let move2 =  CGAffineTransform(scaleX: 2, y: 2)
            // 가로 배, 세로 배 키우는 메소드
            
            let move3 =  CGAffineTransform(rotationAngle: 45)
 
            let move4 =  CGAffineTransform(translationX: -80, y: 80)
            let move8 =  CGAffineTransform(translationX: 40, y: 90)
            let move9 =  CGAffineTransform(translationX: 90, y: 90)

            let move5 =  CGAffineTransform(scaleX: 3, y: 2)
            let move6 =  CGAffineTransform(rotationAngle: -45)
            let move7 =  CGAffineTransform(rotationAngle: 30)
            // 객체를 회전하는 메소드!
            if(self.rightAnswerCount == 0||self.rightAnswerCount == 2||self.rightAnswerCount == 4){
                self.num1.transform  = move2.concatenating(move3)
                self.num2.transform  = move3.concatenating(move1)
                self.num3.transform  = move1.concatenating(move3)
                self.num4.transform  = move2.concatenating(move1)
                self.num5.transform  = move3.concatenating(move1)
                self.num6.transform  = move1.concatenating(move2)

            }else if(self.rightAnswerCount == 1||self.rightAnswerCount == 3||self.rightAnswerCount == 5){
                self.num1.transform  = move6.concatenating(move5)
                self.num2.transform  = move4.concatenating(move7)
                self.num3.transform  = move8.concatenating(move5)
                self.num4.transform  = move5.concatenating(move7)
                self.num5.transform  = move6.concatenating(move8)
                self.num6.transform  = move9.concatenating(move7)
            }
            
        }, completion: nil)
        
    }
    
    func setnumValue(){
        num1.isHidden = false
        num2.isHidden = false
        num3.isHidden = false
        num4.isHidden = false
        num5.isHidden = false
        num6.isHidden = false
        buttonCount = 0
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

        numValueArr.sort()
     }
    
    func setdata(_ buttonname:String){
        let path = Bundle.main.path(forResource: "data", ofType:"plist")
        let data = NSMutableDictionary(contentsOfFile: path!)
        
        var countnum:Float = data?.value(forKey: buttonname)as! Float
        countnum += 1
        data?.setValue(countnum, forKey: buttonname)
        data?.write(toFile: path!, atomically: true)
        
    }
}
