//
//  RCValues.swift
//  listenyourheart
//
//  Created by Антон Иванов on 2/7/19.
//  Copyright © 2019 Антон Иванов. All rights reserved.
//

import Foundation

import Firebase

enum ValueKey: String {
    case requiredSubscription
    
}

class RCValues {
    
    static let sharedInstance = RCValues()
    var loadingDoneCallback: (() -> Void)?
    var fetchComplete = false
    
    private init() {
        loadDefaultValues()
        fetchCloudValues()
    }
    
    func loadDefaultValues() {
        let appDefaults: [String: Any?] = [
            ValueKey.requiredSubscription.rawValue: 0
        ]
        RemoteConfig.remoteConfig().setDefaults(appDefaults as? [String: NSObject])
    }
    
    
    
    func fetchCloudValues() {
        // 1
        // WARNING: Don't actually do this in production!
        let fetchDuration: TimeInterval = 0
        // Временно
        activateDebugMode()
        RemoteConfig.remoteConfig().fetch(withExpirationDuration: fetchDuration) { [weak self] status, error in
            
            if let error = error {
                print("Uh-oh. Got an error fetching remote values \(error)")
                return
            }
            
            // 2
            RemoteConfig.remoteConfig().activateFetched()
            print("Retrieved values from the cloud!")
            print("Our app's primary color is \(RemoteConfig.remoteConfig().configValue(forKey: "requiredSubscription").stringValue ?? "undefined")")
            
            
            self?.fetchComplete = true
            self?.loadingDoneCallback?()
        }
    }
    
    // для продакшина обязаельно в  false
    func activateDebugMode() {
        let debugSettings = RemoteConfigSettings(developerModeEnabled: true)
        RemoteConfig.remoteConfig().configSettings = debugSettings
    }
    
    func color(forKey key: ValueKey) -> UIColor {
        let colorAsHexString = RemoteConfig.remoteConfig()[key.rawValue].stringValue ?? "#FFFFFF"
        let convertedColor = UIColor(cgColor: colorAsHexString as! CGColor)
        return convertedColor
    }
    
    
    func int(forKey key: ValueKey) -> Int {
        return (RemoteConfig.remoteConfig()[key.rawValue].numberValue?.intValue)!
    }
    
    func bool(forKey key: ValueKey) -> Bool {
        return RemoteConfig.remoteConfig()[key.rawValue].boolValue
    }
    
    func string(forKey key: ValueKey) -> String {
        return RemoteConfig.remoteConfig()[key.rawValue].stringValue ?? ""
    }
    
    func double(forKey key: ValueKey) -> Double {
        if let numberValue = RemoteConfig.remoteConfig()[key.rawValue].numberValue {
            return numberValue.doubleValue
        } else {
            return 0.0
        }
    }
    
}

