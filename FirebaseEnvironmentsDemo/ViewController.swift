//
//  ViewController.swift
//  FirebaseEnvironmentsDemo
//
//  Created by Tyler Milner on 7/28/17.
//  Copyright © 2017 Bottle Rocket Studios. All rights reserved.
//

import UIKit

/// Represents the possible Firebase App IDs that we want to toggle based on build type (development vs production).
enum FirebaseAppId: String {
    case dev = "1:363200679145:ios:0e3504839b48e874"
    case prod = "1:110276521110:ios:0e3504839b48e874"
    
    var environment: String {
        switch self {
        case .dev:
            return "dev"
        case .prod:
            return "prod"
        }
    }
}

/// Represents the GoogleService-Info.plist contained in the app bundle.
struct GoogleServiceInfo: Decodable {
    let appId: String
    
    private enum CodingKeys: String, CodingKey {
        case appId = "GOOGLE_APP_ID"
    }
}

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet private var firebaseAppIdLabel: UILabel!
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupFirebaseAppIdLabel()
    }
    
    // MARK: - Private
    
    private func setupFirebaseAppIdLabel() {
        guard let googleServiceInfoPlistPath = Bundle.main.path(forResource: "GoogleService-Info", ofType: "plist") else {
            fatalError("Couldn't locate GoogleService-Info.plist")
        }
        
        do {
            let plistData = try Data.init(contentsOf: URL(fileURLWithPath: googleServiceInfoPlistPath))
            
            let plistDecoder = PropertyListDecoder()
            let googleServiceInfo = try plistDecoder.decode(GoogleServiceInfo.self, from: plistData)
            
            let rawAppId = googleServiceInfo.appId
            guard let appId = FirebaseAppId(rawValue: rawAppId) else {
                fatalError("Invalid appId: \(rawAppId)")
            }
            
            firebaseAppIdLabel.text = buildAppIdStatusText(from: appId)
        } catch {
            fatalError("\(error)")
        }
    }
    
    private func buildAppIdStatusText(from appId: FirebaseAppId) -> String {
        return "Firebase AppId:" + "\n" + appId.rawValue + "\n" + "(\(appId.environment))"
    }
}
