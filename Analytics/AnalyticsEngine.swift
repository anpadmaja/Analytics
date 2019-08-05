//
//  AnalyticsEngine.swift
//  Analytics
//
//  Created by Adhyam Nagarajan, Padmaja on 7/31/19.
//  Copyright © 2019 PayPal Inc. All rights reserved.
//

import Foundation

enum AnalyticsEngineList {
  case CloudKitAnalytics
  case AnotherAnalytics
  
  var engine: AnalyticsEngine {
    switch self {
    case .CloudKitAnalytics:
      return CloudKitAnalyticsEngine.sharedInstance
    default:
      return AnotherAnalyticsEngine.sharedInstance
    }
  }
}

class AnalyticsManager {
  private let engine: AnalyticsEngine

  init(engine: AnalyticsEngineList) {
    self.engine = engine.engine
  }
  func log(event: AnalyticsEvent) {
    engine.sendAnalyticsEvent(named: event.name, metadata: event.metadata)
  }
}

protocol AnalyticsEvent {
  var name: String {get}
  var metadata: [String: String] {get}
}

protocol AnalyticsEngine {
  static var sharedInstance: AnalyticsEngine {get}
  func sendAnalyticsEvent(named: String, metadata: [String: String])
}

class CloudKitAnalyticsEngine: AnalyticsEngine {

  private init() {}
  
  static var sharedInstance: AnalyticsEngine {
    get {
      return CloudKitAnalyticsEngine()
    }
  }
  
  func sendAnalyticsEvent(named name: String, metadata: [String : String]) {
    //print("sending \(name) with \(metadata) to ASL")
  }
}

class AnotherAnalyticsEngine: AnalyticsEngine {
  
  private init() {}
  
  static var sharedInstance: AnalyticsEngine {
    get {
      return AnotherAnalyticsEngine()
    }
  }
  
  func sendAnalyticsEvent(named name: String, metadata: [String : String]) {
    //print("sending \(name) with \(metadata) to ASL")
  }
}
