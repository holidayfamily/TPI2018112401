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
    
    @IBOutlet weak var nextPageButton: UIButton!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        nextPageButton.isHidden = true;
        
        checkname()
    }
    func checkname(){
        let path = Bundle.main.path(forResource: "data", ofType:"plist")
        let data = NSMutableDictionary(contentsOfFile: path!)
        
        let name:String = data?.value(forKey: "Name") as! String
        var vistCount:Int = data?.value(forKey: "VistCount")as! Int
        if(name == ""){
            userNaleLabel.text = "안녕하세요. 처음 이군요 이름을등록해 주세요"
            inputNameButton.setTitle("이름등록" , for: .normal)
            inputNameButton.isHidden = false;
        }else{
                userNaleLabel.text = "\(name)님 안녕하세요. 시작해볼까요?"
            
                vistCount += 1
                
                data?.setValue(vistCount, forKey: "vistCount")
                data?.write(toFile: path!, atomically: true)
            
            
            
           inputNameButton.isHidden = true;
           nextPageButton.isHidden = false
        }

    }
    func nextView(){
        let view = ViewController()
        present(view, animated: true, completion: nil)
    }
}
