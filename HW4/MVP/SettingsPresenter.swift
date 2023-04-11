//
//  SettingsPresenter.swift
//  HW4
//
//  Created by Aruzhan Zhakhan on 09.04.2023.
//

import Foundation
import SwiftUI

class SettingsPresenter {
    var model: SettingsModel
    
    init(model: SettingsModel) {
        self.model = model
    }
    
    func updatePreferences(key: String, value: Any) {
        model.userPreferences[key] = value
    }
    
    // Additional presenter methods for updating the model
}
