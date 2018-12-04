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
    let info = UserDefaults.standard
    
    @IBOutlet weak var userNaleLabel: UILabel!
    @IBOutlet var inputNameButton: UIButton!
    
    @IBOutlet var staratPractict: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        inputNameButton.isHidden = true
        staratPractict.isHidden = true
        checkname()
    }
    func checkname(){
        
        let name = info.string(forKey: "Name")
        let vistCount = info.string(forKey: "vistCount")
        if(name == nil || name == ""){
              userNaleLabel.text = "안녕하세요. 처음 이군요 이름을등록해 주세요"
            inputNameButton.isHidden = false
        }else{
            userNaleLabel.text = "\(String(describing: name))님 안녕하세요.\(String(describing: vistCount))번째 훈련입니다."
 
            staratPractict.isHidden = false
            
            
        }
        
    }
    
}
