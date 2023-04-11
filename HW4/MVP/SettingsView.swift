//
//  SettingsView.swift
//  HW4
//
//  Created by Aruzhan Zhakhan on 09.04.2023.
//

import SwiftUI

struct SettingsView: View {
    @State var userPreferences: [String: Any] = [:]
    
    var presenter: SettingsPresenter
        
    init(userPreferences: [String: Any]) {
            let model = SettingsModel(userPreferences: userPreferences)
            presenter = SettingsPresenter(model: model)
        }
    
    var body: some View {
        NavigationView{
            Form {
                Section(header: Text("Connectivity")) {
                    HStack {
                        Image(systemName: "airplane")
                            .foregroundColor(.blue)
                        Text("Airplane Mode")
                        Spacer()
                        if let airplaneEnabled = userPreferences["airplane"] as? Bool {
                            Toggle("", isOn: Binding<Bool>(get: { airplaneEnabled }, set: { userPreferences["airplane"] = $0 }))
                                .onChange(of: airplaneEnabled) { value in
                                    presenter.updatePreferences(key: "airplane", value: value)
                                }
                        }
                    }
                    HStack {
                        Image(systemName: "wifi")
                            .foregroundColor(.green)
                        Text("Wi-Fi")
                        Spacer()
                        if let wifienabled = userPreferences["wifi"] as? Bool {
                            Toggle("", isOn: Binding<Bool>(get: { wifienabled }, set: { userPreferences["wifi"] = $0 }))
                                .onChange(of: wifienabled) { value in
                                    presenter.updatePreferences(key: "wifi", value: value)
                                }
                        }
                    }
                    HStack {
                        Image(systemName: "bolt.horizontal.fill")
                            .foregroundColor(.purple)
                        Text("Bluetooth")
                        Spacer()
                        if let bluetoothenabled = userPreferences["bluetooth"] as? Bool {
                            Toggle("", isOn: Binding<Bool>(get: { bluetoothenabled }, set: { userPreferences["bluetooth"] = $0 }))
                                .onChange(of: bluetoothenabled) { value in
                                    presenter.updatePreferences(key: "bluetooth", value: value)
                                }
                        }
                    }
                }
                Section(header: Text("Notifications")) {
                    HStack {
                        Image(systemName: "app.badge")
                        Text("Notifications")
                    }
                    HStack {
                        Image(systemName: "speaker.wave.2")
                        Text("Sound")
                    }
                    HStack {
                        Image(systemName: "ellipsis")
                        Text("Focus")
                    }
                    HStack {
                        Image(systemName: "timer")
                        Text("Screen Time")
                    }
                }
            }
            
            .navigationTitle("Settings")
        }
    }
}
