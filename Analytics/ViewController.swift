//
//  ViewController.swift
//  Analytics
//
//  Created by Adhyam Nagarajan, Padmaja on 7/31/19.
//  Copyright © 2019 PayPal Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let vm = MyAccountController()
    self.addChild(vm)
    self.view.addSubview(vm.view)
    // Do any additional setup after loading the view.
  }


}

