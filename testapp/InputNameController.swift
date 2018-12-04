//
//  InputName.swift
//  testapp
//
//  Created by 주 윤령 on 02/12/2018.
//  Copyright © 2018 주 윤령. All rights reserved.
//

import UIKit

class InputNameController: UIViewController{
  
    @IBOutlet var nameLabel: UILabel!
    let info = UserDefaults.standard
    @IBOutlet var inputName: UITextField!
    @IBOutlet var inputButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func inputName(_ sender: Any) {
        let nameValue = inputName.text
        info.set(nameValue, forKey: "Name")
        info.set(0, forKey: "vistCount")
    }
    
}
