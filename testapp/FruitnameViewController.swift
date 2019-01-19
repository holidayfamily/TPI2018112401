//
//  FruitnameViewController.swift
//  testapp
//
//  Created by 주 윤령 on 14/01/2019.
//  Copyright © 2019 주 윤령. All rights reserved.
//

import UIKit

class FruitnameViewController: UIViewController {

    @IBOutlet var imageview: UIImageView!
    var timer:Timer?
    var count = 1
    let fruitimageDic = [1:"apple.png",2:"pear.png",3:"peach.png",4:"strawberry.png",5:"weatermelon.png",6:"plum.png",7:"orientalmelon.png",8:"orange.png"]
    @IBAction func itemButton(_ sender: UIButton) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        imageview.image = UIImage(named: "apple.png")
       bnamebutton1.isHidden = true
        startTimer()
    }
    
    @IBOutlet weak var bnamebutton1: UIButton!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startTimer(){
        self.timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    
    @objc func update(){
        count += 1
        if(count < 9){
            let imagename:String = fruitimageDic[count]!
            imageview.image = UIImage(named: imagename)
            
        }else{
            self.stopTimer()
        }
    }
    
    func stopTimer(){
      bnamebutton1.isHidden = false
        self.timer?.invalidate()
        self.timer = nil
        
        
        
    }
    

}
