//
//  MyViewController.swift
//  Analytics
//
//  Created by Adhyam Nagarajan, Padmaja on 7/31/19.
//  Copyright © 2019 PayPal Inc. All rights reserved.
//

import UIKit

protocol Trackable {
  var analyticsManager: AnalyticsManager {get set}
  
}

class MyAccountController: UIViewController {
  
  private let analyticsManager = AnalyticsManager(engine: .CloudKitAnalytics)
  let analyticsEvent = MyAccountEventClass(name: "MyAccountController")
  
  private let del = UIApplication.shared.delegate as! AppDelegate
  
  enum MyAccountAnalyticsEvents: AnalyticsEvent {
    
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
    analyticsManager.log(event: MyAccountAnalyticsEvents.viewDidLoad)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    analyticsManager.log(event: MyAccountAnalyticsEvents.viewWillAppear)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    analyticsManager.log(event: MyAccountAnalyticsEvents.viewWillDisappear)
  }
}

class MyAccountEventClass: AnalyticsEvent {
  
  var name: String
  var metadata: [String : String]
  
  init(name: String, metadata: [String: String] = [:]) {
    self.name = name
    self.metadata = metadata
  }
  
  func screenViewed() {
    
  }
  
  func changeNameSelected() {
    
  }
}
