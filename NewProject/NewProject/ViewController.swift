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
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
        
    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
        self.firstView.backgroundColor = UIColor(red: CGFloat.random(in: 0.01...1.0), green: CGFloat.random(in: 0.01...1.0), blue: CGFloat.random(in: 0.01...1.0), alpha: 1.0)
        self.secondView.backgroundColor = UIColor(red: CGFloat.random(in: 0.01...1.0), green: CGFloat.random(in: 0.01...1.0), blue: CGFloat.random(in: 0.01...1.0), alpha: 1.0)
        self.thirdView.backgroundColor = UIColor(red: CGFloat.random(in: 0.01...1.0), green: CGFloat.random(in: 0.01...1.0), blue: CGFloat.random(in: 0.01...1.0), alpha: 1.0)
        }
    }
}
