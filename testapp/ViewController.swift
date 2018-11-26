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
    var countRightAnswer:Int = 0
    var bgcolorDic = [0:UIColor.white,1:UIColor.blue,2:UIColor.red,3:UIColor.yellow]
    @IBOutlet weak var textLable: UILabel!
    override func viewDidLoad() {
        nextStepButton.isHidden = true
        super.viewDidLoad()
        changeBackgroundColor()
    }
    
    
    @IBOutlet weak var nextStepButton: UIButton!

    @IBAction func clickButton(_ sender: UIButton) {
        
        let buttonid:Int = Int(sender.restorationIdentifier!)!
        var checkflag:Bool = false
        if(bgcolorDic[buttonid]==view.backgroundColor){
            checkflag = true
        }

        if(checkflag){
            textLable.text = "잘했어 다시한번 눌러봐"
            countRightAnswer += 1
        }else{
            textLable.text = "다시 눌러보자"
        }
        changeBackgroundColor()
    }
    

    
    func changeBackgroundColor(){
        if(countRightAnswer > 4){
            nextPage()
            nextStepButton.isHidden = false
        }
   
        let colornum = Int.random(in: 0...3)
        view.backgroundColor = bgcolorDic[colornum]

    }
    
    func nextPage(){
        
        let alertController = UIAlertController(title: "LEVEL UP", message: "5번 정답을 맞추셨군요. 다음 단계로 이동하시고싶으시면 하단의  NEXT 버튼을 클릭해주세요", preferredStyle: .alert)
        
        let staylevel = UIAlertAction(title: "확인", style: .destructive) { (result : UIAlertAction) -> Void in
           
        }
        alertController.addAction(staylevel)
        self.present(alertController, animated: true, completion: nil)
    }
    
}

