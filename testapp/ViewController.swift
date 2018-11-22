//
//  ViewController.swift
//  testapp
//
//  Created by 주 윤령 on 22/11/2018.
//  Copyright © 2018 주 윤령. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var rest: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
       //view.backgroundColor=UIColor.red
        changeBackgroundColor()
        
        
    }

    @IBAction func clickYellowButton(_ sender: Any) {
        if(view.backgroundColor==UIColor.yellow){
            viewtext.text = "잘했어"
        }else{
            viewtext.text = "다시해봐"
        }
        viewtext.text = "바탕화면 색에 해당하는 버튼을 눌러봐"
        changeBackgroundColor()
    }
    
    @IBAction func clickRadButton(_ sender: Any) {
        if(view.backgroundColor==UIColor.red){
            viewtext.text = "잘했어"
        }else{
            viewtext.text = "다시해봐"
        }
        viewtext.text = "바탕화면 색에 해당하는 버튼을 눌러봐"
        changeBackgroundColor()
    }
    
    
    @IBAction func clickBlueButton(_ sender: Any) {
        if(view.backgroundColor==UIColor.blue){
            viewtext.text = "잘했어"
        }else{
            viewtext.text = "다시해봐"
        }
        viewtext.text = "바탕화면 색에 해당하는 버튼을 눌러봐"
        changeBackgroundColor()
    }
    
    @IBAction func clickWhiteButton(_ sender: Any) {
        if(view.backgroundColor==UIColor.white){
            viewtext.text = "잘했어"
        }else{
            viewtext.text = "다시해봐"
        }
        viewtext.text = "바탕화면 색에 해당하는 버튼을 눌러봐"
        changeBackgroundColor()
    }
    
    @IBOutlet weak var viewtext: UILabel!
    
    func changeBackgroundColor(){
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
    
}

