//
//  ContentView.swift
//  HW4
//
//  Created by Aruzhan Zhakhan on 09.04.2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = SettingsViewModel()
    var body: some View {
        NavigationView {
                   Form {
                       Section(header: Text("General")) {
                           Toggle("Dark Mode", isOn: $viewModel.isDarkModeEnabled)
                               .onChange(of: viewModel.isDarkModeEnabled) { _ in
                                   updateDarkMode()
                               }
                       }
                       Section(header: Text("Connectivity")) {
                                           HStack {
                                               Image(systemName: "airplane")
                                                   .foregroundColor(.blue)
                                               Text("Airplane Mode")
                                               Spacer()
                                               Toggle("", isOn: $viewModel.isAirplaneModeEnabled)
                                                   .toggleStyle(SwitchToggleStyle(tint: .blue))
                                           }
                                           HStack {
                                               Image(systemName: "wifi")
                                                   .foregroundColor(.green)
                                               Text("Wi-Fi")
                                               Spacer()
                                               Toggle("", isOn: $viewModel.isWiFiEnabled)
                                                   .toggleStyle(SwitchToggleStyle(tint: .green))
                                           }
                                           HStack {
                                               Image(systemName: "bolt.horizontal.fill")
                                                   .foregroundColor(.purple)
                                               Text("Bluetooth")
                                               Spacer()
                                               Toggle("", isOn: $viewModel.isBluetoothEnabled)
                                                   .toggleStyle(SwitchToggleStyle(tint: .purple))
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
    func updateDarkMode() {
            let isDarkModeEnabled = viewModel.isDarkModeEnabled
            UIApplication.shared.windows.forEach { window in
                window.overrideUserInterfaceStyle = isDarkModeEnabled ? .dark : .light
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
