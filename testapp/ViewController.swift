//
//  ViewController.swift
//  testapp
//
//  Created by 주 윤령 on 22/11/2018.
//  Copyright © 2018 주 윤령. All rights reserved.
//

import UIKit
import CoreFoundation

class ViewController: UIViewController {
    var startTime:CFAbsoluteTime = 0.0
    var countRrightAnswer:Int = 0
    
    @IBOutlet weak var textLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        changeBackgroundColor()
    }
    
    
    @IBAction func clickButton(_ sender: UIButton) {
        
        let buttonid:String = sender.restorationIdentifier!
        var checkflag:Bool = false
        switch buttonid {
        case "white":
            if(view.backgroundColor == UIColor.white){
                checkflag = true
                countRrightAnswer += countRrightAnswer
            }
        case "blue":
            if(view.backgroundColor == UIColor.blue){
                checkflag = true
                countRrightAnswer += countRrightAnswer
            }
        case "red":
            if(view.backgroundColor == UIColor.red){
                checkflag = true
                countRrightAnswer += countRrightAnswer
            }
        case "yellow":
            if(view.backgroundColor == UIColor.yellow){
                checkflag = true
                countRrightAnswer += countRrightAnswer
            }
        default:
            checkflag = false
        }
        if(checkflag){
            textLable.text = "잘했어 다시한번 눌러봐"
        }else{
            textLable.text = "다시 눌러보자"
        }
        changeBackgroundColor()
    }
    
    

    
    func changeBackgroundColor(){
        if(countRrightAnswer > 5){
            
        }
     //   textLable.text = "바탕화면 색에 해당하는 버튼을 눌러봐"
        let colornum = Int.random(in: 0 ... 3)
        if(colornum == 0){
            view.backgroundColor = UIColor.red
        } else if(colornum == 1){
            view.backgroundColor = UIColor.blue
        } else if (colornum == 2) {
            view.backgroundColor = UIColor.white
        }else {
            view.backgroundColor = UIColor.yellow
        }
    }
    
    func nextPage(){
        let alertController = UIAlertController(title: "LEVEL UP", message: "5번 정답을 맞추셨군요. 다음 단계로 이동하시겠습니까?", preferredStyle: .alert)
        
        let staylevel = UIAlertAction(title: "취소", style: .destructive) { (result : UIAlertAction) -> Void in
            
            print("취소")
            
        }
        
        let nextLevel = UIAlertAction(title: "확인", style: .default) { (result : UIAlertAction) -> Void in
            
            let testNumberViewC = self.storyboard?.instantiateViewController(withIdentifier: “testNumber”)
            testNumberViewC?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
            self.present(testNumberViewC!, animated: true, completion: nil)

            
        }
        
        alertController.addAction(staylevel)
        alertController.addAction(nextLevel)
        
        self.present(alertController, animated: true, completion: nil)
        
        
     }
    
    func checkTime(){
        startTime = CFAbsoluteTimeGetCurrent()
        var flag = true
        while(flag){
            let timeGab = CFAbsoluteTimeGetCurrent() - startTime
            if(timeGab>2){
                flag=false
            }
        }
        changeBackgroundColor()
    }
    
}

