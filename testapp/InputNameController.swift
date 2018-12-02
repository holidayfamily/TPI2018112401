//
//  InputName.swift
//  testapp
//
//  Created by 주 윤령 on 02/12/2018.
//  Copyright © 2018 주 윤령. All rights reserved.
//

import UIKit

class InputNameController: UIViewController{
    @IBOutlet weak var InputName: UILabel!
    @IBOutlet weak var inputNameBox: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        print("in InputNameController")
        InputName
        InputName.text = "이름을 입력해주세요"
    }
    
}
