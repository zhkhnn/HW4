//
//  SettingsViewModel.swift
//  HW4
//
//  Created by Aruzhan Zhakhan on 09.04.2023.
//

import Foundation
class SettingsViewModel: ObservableObject {
    
    // properties
    
    @Published var isDarkModeEnabled: Bool = UserDefaults.standard.bool(forKey: "isDarkModeEnabled") {
        didSet {
            // store value to UserDefaults
            UserDefaults.standard.set(isDarkModeEnabled, forKey: "isDarkModeEnabled")
        }
    }
    @Published var isAirplaneModeEnabled = false
    @Published var isWiFiEnabled = false
    @Published var isBluetoothEnabled = false
    // methods
    
    func toggleDarkMode() {
        isDarkModeEnabled.toggle()
    }
    func toggleAirplaneMode() {
            // add code here to toggle airplane mode
        }
        
        func toggleWiFi() {
            // add code here to toggle WiFi
        }
        
        func toggleBluetooth() {
            // add code here to toggle Bluetooth
        }
    
}
