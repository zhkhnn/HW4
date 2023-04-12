//
//  SettingVIPresenter.swift
//  HW4
//
//  Created by Aruzhan Zhakhan on 12.04.2023.
//

import Foundation
class SettingsPresenterImpl: SettingsPresenter {
    var view: SettingsView?
    var interactor: SettingsInteractor?
    
    func viewDidLoad() {
        // Load the initial state of the view
        view?.notificationsEnabled = true // Replace with your logic
    }
    
    func toggleNotifications() {
        interactor?.toggleNotifications()
    }
    
    func logout() {
        interactor?.logout()
    }
}
