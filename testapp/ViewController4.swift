//
//  ViewController4.swift
//  testapp
//
//  Created by 주 윤령 on 22/01/2019.
//  Copyright © 2019 주 윤령. All rights reserved.
//

import UIKit
import CoreFoundation

class ViewController4: UIViewController {
    var startTime:CFAbsoluteTime = 0.0
    var countRrightAnswer:Int = 0

    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var nextbutton: UIButton!
    var count = 0
    let fruitimageDic = [0:"apple.png",1:"pear.png",2:"peach.png",3:"strawberry.png",4:"weatermelon.png",5:"plum.png",6:"orientalmelon.png",7:"orange.png"]
    let fruitNameDic = [0:"사과",1:"배",2:"복숭아",3:"딸기",4:"수박",5:"자두",6:"참외",7:"오렌지"]
    var imageValueArr:Array = Array<Int>()
    var rightanswer:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        nextbutton.isHidden = true
        imageview.isHidden = false
        button1.isHidden = true
        button2.isHidden = true
        button3.isHidden = true

        changeimage()

    }

    
    func changeimage(){
        imageValueArr.removeAll()
        while imageValueArr.count < 3 {
            let numValue:Int = Int.random(in: 0...7)
            if(!imageValueArr.contains(numValue)){
                imageValueArr.append(numValue)
            }
            
        }
        
        button1.setTitle(fruitNameDic[imageValueArr[0]], for: .normal)
        button2.setTitle(fruitNameDic[imageValueArr[1]], for: .normal)
        button3.setTitle(fruitNameDic[imageValueArr[2]], for: .normal)
        
        imageValueArr.shuffle()
        imageview.image = UIImage(named: fruitimageDic[imageValueArr[0]]!)
        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(setinterval), userInfo: nil, repeats: false)


    }
    @IBAction func clickname(_ sender: UIButton) {
        let buttonname:String = sender.currentTitle!
        
        if(buttonname == fruitNameDic[imageValueArr[0]]){
            setdata("nameR")
            rightanswer += 1
            if(rightanswer == 3){
                let alertController  = UIAlertController(title: "축하해요", message: "NEXT 버튼을 클릭해서 다음 스테이지로 갈까요?", preferredStyle: .alert)
                let alertAction  = UIAlertAction(title: "확인", style: .destructive) { (result:UIAlertAction) -> Void in }
                
                alertController.addAction(alertAction)
                self.present(alertController, animated: true, completion: changeimage)
                nextbutton.isHidden = false
            }else{
                setinterval(true)
                changeimage()
                
            }
        }else{
            setdata("nameW")
            setinterval(true)
            changeimage()
            
        }
    }

    @objc func setinterval(_ flag:Bool){
        imageview.isHidden = !flag
        button1.isHidden = flag
        button2.isHidden = flag
        button3.isHidden = flag

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

