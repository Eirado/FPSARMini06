//
//  TimerManager.swift
//  FPSARMini06
//
//  Created by Luiz Felipe on 12/08/24.
//

import Foundation
import SwiftUI

class TimerManager: ObservableObject {
    @Published var timeRemaining: Int = 60
    @Published var timerRunning: Bool = false
    private var timer: Timer?


    
    func startTimer() {
        guard !timerRunning else { return }
        timerRunning = true
        settingsPersistence.pauseGame = false
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if self.timeRemaining > 0 && settingsPersistence.pauseGame == false{
                self.timeRemaining -= 1
                print("tempo restante: \(self.timeRemaining)")
            } else {
                self.timerRunning = false
                timer.invalidate()
            }
        }
    }
    
    func pauseTimer() {
        guard timerRunning else { return }
        timerRunning = false
        settingsPersistence.pauseGame = true
        timer?.invalidate()
    }
    
    func resumeTimer() {
        print(settingsPersistence.pauseGame)
        guard settingsPersistence.pauseGame else { return }
        settingsPersistence.pauseGame = false
        startTimer()
    }
    

}
