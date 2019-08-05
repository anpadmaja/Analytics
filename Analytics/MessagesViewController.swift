//
//  MessagesViewController.swift
//  Analytics
//
//  Created by Adhyam Nagarajan, Padmaja on 7/31/19.
//  Copyright © 2019 PayPal Inc. All rights reserved.
//

import Foundation
import UIKit

class MessagesViewController: UIViewController {
  private let del = UIApplication.shared.delegate as! AppDelegate
  
  enum MessagesAnalyticsEvents: AnalyticsEvent {
    
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
  
  init() {
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    del.analyticsManager.log(event: MessagesAnalyticsEvents.viewDidLoad)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    del.analyticsManager.log(event: MessagesAnalyticsEvents.viewWillAppear)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    del.analyticsManager.log(event: MessagesAnalyticsEvents.viewWillDisappear)
  }
}
