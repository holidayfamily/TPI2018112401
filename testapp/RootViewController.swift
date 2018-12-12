//
//  RootViewController.swift
//  testapp
//
//  Created by 주 윤령 on 02/12/2018.
//  Copyright © 2018 주 윤령. All rights reserved.
//

import Foundation
import UIKit

class RootViewController: UIViewController {
    
    @IBOutlet weak var userNaleLabel: UILabel!
    @IBOutlet var inputNameButton: UIButton!
    
    @IBOutlet var staratPractict: UIButton!

    @IBOutlet var directButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        inputNameButton.isHidden = true
        staratPractict.isHidden = true
        checkname()
    }
    func checkname(){
        let path = Bundle.main.path(forResource: "data", ofType:"plist")
        let data = NSMutableDictionary(contentsOfFile: path!)
        
        let name:String = data?.value(forKey: "Name") as! String
        let vistCount = data?.value(forKey: "VistCount") as? Int
        if(name == ""){
            userNaleLabel.text = "안녕하세요. 처음 이군요 이름을등록해 주세요"
            inputNameButton.isHidden = false
        }else{
            if(vistCount == 0){
                userNaleLabel.text = "\(name)님 안녕하세요.처음 오셨군요 시작해볼까요?"
            }else{
                userNaleLabel.text = "\(name)님 안녕하세요. \(vistCount)번째 훈련입니다."
            }
            
 
            staratPractict.isHidden = false
            
            
        }
        
    }
    
}
