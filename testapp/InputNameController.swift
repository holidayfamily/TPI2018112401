//
//  InputName.swift
//  testapp
//
//  Created by 주 윤령 on 02/12/2018.
//  Copyright © 2018 주 윤령. All rights reserved.
//

import UIKit

class InputNameController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let contentlavel = UILabel()
        let inputNameBox = UITextField()
        self.view.backgroundColor = UIColor.white
        contentlavel.frame = CGRect(x:119,y:123, width:137,height:21)
        inputNameBox.frame = CGRect(x:134,y:203, width:106,height:31)
        inputNameBox.placeholder = "이름"
        contentlavel.text = "이름을 입력해주세요"
        self.view.addSubview(contentlavel)
        self.view.addSubview(inputNameBox)
    }
    
}
