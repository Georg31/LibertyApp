//
//  CustomView.swift
//  Liberty_APP
//
//  Created by George Digmelashvili on 1/8/21.
//

import UIKit

class CustomView: UIView {
    
    var imgV = UIImageView()
    var label = UILabel()
    
    override func draw(_ rect: CGRect) {
        config(rect)
    }
    
    
    func config(_ rect: CGRect){
        let welcome = UIView(frame: rect)
        imgV = UIImageView(frame: CGRect(x: rect.midX - 100, y: 80, width: 200, height: 200))
        label = UILabel(frame: CGRect(x: rect.minX, y: imgV.frame.maxY + 50, width: rect.width, height: 42))
        label.font = UIFont(name: label.font.familyName, size: 35)
        label.textColor = .red
        label.textAlignment = .center
        label.text = "Welcome"
        imgV.image = UIImage(named: "liberty-icon")
        welcome.backgroundColor = .white
        welcome.addSubview(label)
        welcome.addSubview(imgV)
        self.addSubview(welcome)
        animate()
    }

    func animate(){
        UIView.animate(withDuration: 1.5, delay: 1, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.00001, options: []) { [self] in
            self.alpha = 0
            self.label.frame.origin.y += 300
            self.imgV.frame.origin.y -= 300
        } completion: { (f) in
            self.removeFromSuperview()
        }
    }
}
