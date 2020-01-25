//
//  ViewController3.swift
//  testapp
//
//  Created by 주 윤령 on 27/11/2018.
//  Copyright © 2018 주 윤령. All rights reserved.
//
import UIKit
import Foundation

class ViewController3: UIViewController {
    
    @IBOutlet weak var coloraverage: UILabel!
    @IBOutlet weak var nameaverage: UILabel!
    @IBOutlet weak var numberaverage: UILabel!
    @IBOutlet weak var orderaverage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
                let path = Bundle.main.path(forResource: "data", ofType:"plist")
                let data = NSMutableDictionary(contentsOfFile: path!)
        
        
                let colorW:Float = data?.value(forKey: "colorW")as! Float
                let colorR:Float = data?.value(forKey: "colorR")as! Float
                let numberW:Float = data?.value(forKey: "numberW")as! Float
                let numberR:Float = data?.value(forKey: "numberR")as! Float
                let nameW:Float = data?.value(forKey: "nameW")as! Float
                let nameR:Float = data?.value(forKey: "nameR")as! Float
                let orderW:Float = data?.value(forKey: "orderW")as! Float
                let orderR:Float = data?.value(forKey: "orderR")as! Float
        
                coloraverage.text = String(format:"%.1f",colorR/(colorW+colorR)*100)+"%"
                nameaverage.text = String(format:"%.1f",numberR/(numberW+numberR)*100)+"%"
                numberaverage.text = String(format:"%.1f",nameR/(nameW+nameR)*100)+"%"
                orderaverage.text = String(format:"%.1f",orderR/(orderW+orderR)*100)+"%"
        
        
    }
    
}
