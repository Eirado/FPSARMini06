//
//  Navigator.swift
//  FPSARMini06
//
//  Created by Giovanni Favorin de Melo on 22/07/24.
//


import Foundation
import SwiftUI

struct Navigator: View {
    @Environment(PageManager.self) var pageManager

    var body: some View {
        switch pageManager.page {
        case .menu:
            MenuView()
        case .gameScene:
            GameScene()
        case .inventory:
            InventoryView()
        case .howToPlay:
            HowToPlayView()
        case .settings:
            SettingsView()
        case .pause:
            SettingsView()
//            PauseMenuView()
        case .feedbackView:
            GamePlayFeedbackView()
        }
    }
}
