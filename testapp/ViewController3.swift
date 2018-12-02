//
//  ViewController3.swift
//  testapp
//
//  Created by 주 윤령 on 27/11/2018.
//  Copyright © 2018 주 윤령. All rights reserved.
//
import UIKit

import CoreFoundation

class ViewController3: UIViewController {
    @IBOutlet weak var textLavel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    
    @IBAction func animationstart(_ sender: Any) {
        // movievieww()
        moviemotion()
    }
    
    func movievieww(){
        textLavel.isUserInteractionEnabled = true
        textLavel.isEnabled = true
        
        let pulse1 = CASpringAnimation(keyPath: "transform.scale")
        pulse1.duration = 0.6
        pulse1.fromValue = 1.0
        pulse1.toValue = 1.12
        pulse1.autoreverses = true
        pulse1.repeatCount = 1
        pulse1.initialVelocity = 0.5
        pulse1.damping = 0.8
        
        let animationGroup = CAAnimationGroup()
        animationGroup.duration = 2.7
        animationGroup.repeatCount = 1000
        animationGroup.animations = [pulse1]
        
        textLavel.layer.add(animationGroup, forKey: "pulse")

    }
    

    func moviemotion(){
        // withDuration: 지속시간
        // delay: 애니메이션 실행 딜레이 (1.0설정시 1초이후 발동함)
        // options: 애니메이션 효과 옵션 curveLinear - 일정한 속도 curveEaseOut - 시작 빠름 점점 느리게 curveEaseIn - 시작 느림 점점 빠르게 curveEaseInOut - 천천히 시작 점점 빠르게
        // animations: 애니메이션 실행할 클로저
        // completion: 애니메이션 종료후 실행할 클로저
        UIView.animate(withDuration: 3.00, delay: 0.0, options: .curveEaseInOut, animations: {
            
            
            var move1 =  CGAffineTransform(translationX: 80, y: 80)
            // 가로 100, 세로 100 만큼 움직이는 메소드
            
            var move2 =  CGAffineTransform(scaleX: 2, y: 2)
            // 가로 2배, 세로 2배 키우는 메소드
            
            var move3 =  CGAffineTransform(rotationAngle: 3.14)
            // 객체를 회전하는 메소드!
            self.textLavel.transform  = move2.concatenating(move3)
        }, completion: nil)

    }
}
