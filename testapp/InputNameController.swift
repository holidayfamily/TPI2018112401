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
      
        let path = Bundle.main.path(forResource: "data", ofType:"plist")
        let data = NSMutableDictionary(contentsOfFile: path!)
       
        let nameValue = nameText.text
//        let alertController = UIAlertController(title: "LEVEL UP", message: path, preferredStyle: .alert)
//
//        let staylevel = UIAlertAction(title: "확인", style: .destructive) { (result : UIAlertAction) -> Void in
//
//        }
//        alertController.addAction(staylevel)
//        self.present(alertController, animated: true, completion: nil)
    

        data?.setValue(nameValue, forKey: "Name")
        data?.setValue(0, forKey: "VistCount")
        data?.write(toFile: path!, atomically: true)
    }
    
}
