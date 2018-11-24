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
    override func viewDidLoad() {
        super.viewDidLoad()
        changeBackgroundColor()
    }

    @IBAction func clickYellowButton(_ sender: Any) {
        print("clickYellowButton=\(view.backgroundColor==UIColor.yellow)")
        if(view.backgroundColor==UIColor.yellow){
            viewText.text = "잘했어"
            checkTime()
        }else{
            viewText.text = "다시해봐"
        }
        
        
        
    }
    
    @IBAction func clickRadButton(_ sender: Any) {
        print("clickRadButton=\(view.backgroundColor==UIColor.red)")
        if(view.backgroundColor==UIColor.red){
            viewText.text = "잘했어"
            checkTime()
        }else{
            viewText.text = "다시해봐"
        }
        
    }
    
    
    @IBAction func clickBlueButton(_ sender: Any) {
        print("clickBlueButton=\(view.backgroundColor==UIColor.blue)")
        if(view.backgroundColor==UIColor.blue){
            viewText.text = "잘했어"
            checkTime()
        }else{
            viewText.text = "다시해봐"
        }
        
    }
    
    @IBAction func clickWhiteButton(_ sender: Any) {
        print("clickWhiteButton=\(view.backgroundColor==UIColor.white)")
        if(view.backgroundColor==UIColor.white){
            viewText.text = "잘했어"
            checkTime()
        }else{
            viewText.text = "다시해봐"
        }
        
        
    }
    
    
    @IBOutlet weak var viewText: UITextField!
    
    func changeBackgroundColor(){
     //   viewText.text = "바탕화면 색에 해당하는 버튼을 눌러봐"
        let colornum = Int.random(in: 0 ... 3)
        if(colornum==0){
            view.backgroundColor=UIColor.red
        } else if(colornum==1){
            view.backgroundColor=UIColor.blue
        } else if (colornum==2) {
            view.backgroundColor=UIColor.white
        }else {
            view.backgroundColor=UIColor.yellow
        }
    
    }
    
    func checkTime(){    
        changeBackgroundColor()
    }
    
    
}

