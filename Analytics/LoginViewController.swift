//
//  LoginViewController.swift
//  Analytics
//
//  Created by Adhyam Nagarajan, Padmaja on 7/31/19.
//  Copyright © 2019 PayPal Inc. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
  
  private let del = UIApplication.shared.delegate as! AppDelegate
  
  init() {
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  enum LoginAnalyticsEvents: AnalyticsEvent {
    
    case viewDidLoad
    case viewWillAppear
    case viewWillDisappear
    
    var name: String {
      switch self {
      case .viewDidLoad:
        return "viewDidLoad"
      default:
        return "unknown"
      }
    }
    
    var metadata: [String : String] {
      switch self {
      case .viewDidLoad:
        return ["success" : self.name]
      default:
        return [:]
      }
    }
  }

  
  override func viewDidLoad() {
    super.viewDidLoad()
    del.analyticsManager.log(event: LoginAnalyticsEvents.viewDidLoad)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    del.analyticsManager.log(event: LoginAnalyticsEvents.viewWillAppear)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    del.analyticsManager.log(event: LoginAnalyticsEvents.viewWillDisappear)
  }
}
