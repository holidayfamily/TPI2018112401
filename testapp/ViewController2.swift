//
//  ViewController2.swift
//  testapp
//
//  Created by 주 윤령 on 25/11/2018.
//  Copyright © 2018 주 윤령. All rights reserved.
//

import UIKit
import CoreFoundation

class ViewController2: UIViewController {
override func viewDidLoad() {
        super.viewDidLoad()
        nextStepButton.isHidden =  true
    
      //  nextStepButton.isHidden = true

    }
    @IBOutlet weak var commentText: UITextView!
 
    
    @IBOutlet weak var nextStepButton: UIButton!
    @IBOutlet weak var numberNum: UILabel!
    @IBOutlet weak var numberText: UILabel!
    var numberDic = [0:"영",1:"하나",2:"둘",3:"셋",4:"넷",5:"다섯",6:"여섯"]
    var num1:Int = 0
    var num2:Int = 0
    
    var countRightAnswer:Int = 0
    @IBAction func checkanswer(_ sender: UIButton) {
        let buttonid:String = sender.restorationIdentifier!
        var mathValue:Bool = false

        if(num1==num2){
            mathValue=true
        }
        if(buttonid=="YES"){
            if(mathValue){
                commentText.text = "잘했어 다시한번 눌러봐"
                countRightAnswer += 1
                setdata("numberR")
                
            }else{
                commentText.text = "다시 눌러보자"
                setdata("numberW")
            }
        }
        if(buttonid=="NO"){
            if(mathValue){
                commentText.text = "다시 눌러보자"
                setdata("numberW")
            }else{
                commentText.text = "잘했어 다시한번 눌러봐"
                countRightAnswer += 1
                setdata("numberR")
            }
        }
        
        setContent()
    }

    func setContent(){
        if(countRightAnswer > 4){
            nextPage()
          //  nextStepButton.isHidden = false
        }
         num1 = Int.random(in:0...6)
         num2 = Int.random(in:0...6)
     
        numberNum.text = String(num1)
        numberText.text = numberDic[num2]
    }
    func nextPage(){
        
        let alertController = UIAlertController(title: "LEVEL UP", message: "5번 정답을 맞추셨군요. 다음 단계로 이동하시고싶으시면 하단의  NEXT 버튼을 클릭해주세요", preferredStyle: .alert)
        
        let staylevel = UIAlertAction(title: "확인", style: .destructive) { (result : UIAlertAction) -> Void in
            
        }
        alertController.addAction(staylevel)
        self.present(alertController, animated: true, completion: nil)
        nextStepButton.isHidden =  false

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

