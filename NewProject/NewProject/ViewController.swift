//
//  ViewController.swift
//  NewProject
//
//  Created by Aleksey on 14.03.2020.
//  Copyright © 2020 Aleksey Mikhlev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if isIntersect(view1: firstView, view2: secondView) {
            print("Intersection")
        } else {
            print("Non-intersection")
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.firstView.backgroundColor = UIColor(red: CGFloat.random(in: 0.01...1.0), green: CGFloat.random(in: 0.01...1.0), blue: CGFloat.random(in: 0.01...1.0), alpha: 1.0)
            self.secondView.backgroundColor = UIColor(red: CGFloat.random(in: 0.01...1.0), green: CGFloat.random(in: 0.01...1.0), blue: CGFloat.random(in: 0.01...1.0), alpha: 1.0)
            self.thirdView.backgroundColor = UIColor(red: CGFloat.random(in: 0.01...1.0), green: CGFloat.random(in: 0.01...1.0), blue: CGFloat.random(in: 0.01...1.0), alpha: 1.0)
        }
    }
    
    private func isIntersect(view1: UIView, view2: UIView) -> Bool {
        let leftUpView1: (x: CGFloat, y: CGFloat)
        let rightUpView1: (x: CGFloat, y: CGFloat)
        let leftDownView1: (x: CGFloat, y: CGFloat)
        let rightDownView1: (x: CGFloat, y: CGFloat)
        let leftUpView2: (x: CGFloat, y: CGFloat)
        let rightUpView2: (x: CGFloat, y: CGFloat)
        let leftDownView2: (x: CGFloat, y: CGFloat)
        let rightDownView2: (x: CGFloat, y: CGFloat)

        leftUpView1.x = view1.frame.origin.x
        leftUpView1.y = view1.frame.origin.y
        rightUpView1.x = view1.frame.origin.x + view1.frame.size.width
        rightUpView1.y = view1.frame.origin.y
        leftDownView1.x = view1.frame.origin.x
        leftDownView1.y = view1.frame.origin.y + view1.frame.size.height
        rightDownView1.x = view1.frame.origin.x + view1.frame.size.width
        rightDownView1.y = view1.frame.origin.y + view1.frame.size.height

        leftUpView2.x = view2.frame.origin.x
        leftUpView2.y = view2.frame.origin.y
        rightUpView2.x = view2.frame.origin.x + view2.frame.size.width
        rightUpView2.y = view2.frame.origin.y
        leftDownView2.x = view2.frame.origin.x
        leftDownView2.y = view2.frame.origin.y + view2.frame.size.height
        rightDownView2.x = view2.frame.origin.x + view2.frame.size.width
        rightDownView2.y = view2.frame.origin.y + view2.frame.size.height

        if leftUpView1.x >= leftUpView2.x &&
            leftUpView1.x <= rightUpView2.x &&
            leftUpView1.y >= leftUpView2.y &&
            leftUpView1.y <= leftDownView2.y
        {
            return true
        }

        if leftUpView2.x >= leftUpView1.x &&
            leftUpView2.x <= rightUpView1.x &&
            leftUpView2.y >= leftUpView1.y &&
            leftUpView2.y <= leftDownView1.y
        {
            return true
        }

        if rightUpView1.x >= leftUpView2.x &&
            rightUpView1.x <= rightUpView2.x &&
            rightUpView1.y >= leftUpView2.y &&
            rightUpView1.y <= leftDownView2.y
        {
            return true
        }

        if rightUpView2.x >= leftUpView1.x &&
            rightUpView2.x <= rightUpView1.x &&
            rightUpView2.y >= leftUpView1.y &&
            rightUpView2.y <= leftDownView1.y
        {
            return true
        }

        if leftDownView1.x >= leftUpView2.x &&
            leftDownView1.x <= rightUpView2.x &&
            leftDownView1.y >= leftUpView2.y &&
            leftDownView1.y <= leftDownView2.y
        {
            return true
        }

        if leftDownView2.x >= leftUpView1.x &&
            leftDownView2.x <= rightUpView1.x &&
            leftDownView2.y >= leftUpView1.y &&
            leftDownView2.y <= leftDownView1.y
        {
            return true
        }
        
        if rightDownView1.x >= leftUpView2.x &&
            rightDownView1.x <= rightUpView2.x &&
            rightDownView1.y >= leftUpView2.y &&
            rightDownView1.y <= leftDownView2.y
        {
            return true
        }

        if rightDownView2.x >= leftUpView1.x &&
            rightDownView2.x <= rightUpView1.x &&
            rightDownView2.y >= leftUpView1.y &&
            rightDownView2.y <= leftDownView1.y
        {
            return true
        }
        
        return false
    }
}
