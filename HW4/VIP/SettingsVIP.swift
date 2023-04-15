//
//  SettingsVIP.swift
//  HW4
//
//  Created by Aruzhan Zhakhan on 12.04.2023.
//

import SwiftUI
protocol SettingsVIPProtocol: View {
    var presenter: SettingsVIPPresenter? { get set }
}
struct SettingsVIP: View {
    @State var notificationsEnabled = false
    var presenter: SettingsVIPPresenter?
    var interactor: SettingsInteractor?
        
        var body: some View {
            Form {
                Section(header: Text("Notifications")) {
                    Toggle(isOn: $notificationsEnabled) {
                        Text("Enable notifications")
                    }
                }
                Button(action: {
                    presenter?.logout()
                }, label: {
                    Text("Logout")
                })
            }
            .navigationBarTitle("Settings")
            .onAppear {
                presenter?.viewDidLoad()
            }
        }
}
extension SettingsVIP: SettingsVIPProtocol{
    
}


// Interactor
protocol SettingsInteractorProtocol {
    func toggleNotifications()
    func logout()
}
final class SettingsInteractor: SettingsInteractorProtocol {
    var presenter: SettingsVIPPresenter?
    func toggleNotifications() {
        // Implement your logic to toggle notifications
    }
    
    func logout() {
        // Implement your logic to log out the user
    }
}

// Presenter
protocol SettingsPresenterProtocol {
    func viewDidLoad()
    func toggleNotifications()
    func logout()
}


final class SettingsVIPPresenter: SettingsPresenterProtocol {
    var view: SettingsVIP?
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
@ViewBuilder func constructMainView() -> some View{
    let view = SettingsVIP()
    let interactor = SettingsInteractor()
    let presenter = SettingsVIPPresenter()

    interactor.presenter = presenter
    presenter.view = view
    presenter.interactor = interactor
    view
}



