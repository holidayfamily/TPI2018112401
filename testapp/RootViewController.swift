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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkname()
    }
    func checkname(){
        
        let name = info.string(forKey: "Name")
        print("name is \(name)")
        if(name == nil || name == ""){
            print("go input name controller")
            let inputview = InputNameController()
        self.navigationController?.pushViewController(inputview, animated: true)
        }else{
            userNaleLabel.text = name ?? "" + "님 안녕하세요."
        }
        
    }
    
}
