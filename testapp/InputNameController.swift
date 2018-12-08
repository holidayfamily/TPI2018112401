//
//  InputName.swift
//  testapp
//
//  Created by 주 윤령 on 02/12/2018.
//  Copyright © 2018 주 윤령. All rights reserved.
//

import UIKit

class InputNameController: UIViewController{
  
    @IBOutlet var nameText: UITextField!
    
    @IBOutlet var noticLavel: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func inputButton(_ sender: Any) {
        print("input button")
        
                let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString
                let plist = path.strings(byAppendingPaths: ["data.plist"]) [0]
        
                let data = NSMutableDictionary(contentsOfFile: plist)
                let nameValue = nameText.text
                let name = data?.value(forKey:"Name") as? String
                if let _name = name{
                    print(_name)
                }
        
                print("\(nameValue)")
                data?.setValue(nameValue, forKey: "Name")
                data?.setValue(0, forKey: "VistCount")
        
                print("\(data?.value(forKey: "VistCount"))")
                data?.write(toFile: plist, atomically: true)
        
    }
    
}
