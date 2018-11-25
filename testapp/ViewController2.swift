//
//  ViewController2.swift
//  testapp
//
//  Created by 주 윤령 on 25/11/2018.
//  Copyright © 2018 주 윤령. All rights reserved.
//

import UIKit
class ViewController2: UIViewController {
override func viewDidLoad() {
        super.viewDidLoad()
 
    }

    @IBOutlet weak var numberNum: UILabel!
    
    @IBOutlet weak var numberText: UILabel!
    
    @IBAction func checkanswer(_ sender: Any) {
        
    }
    
    func setContent(){
        numberNum.text = ""
        numberText.text = ""
    }
}

