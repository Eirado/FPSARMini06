//
//  TimerManager.swift
//  FPSARMini06
//
//  Created by Luiz Felipe on 12/08/24.
//

import Foundation
import SwiftUI

class TimerManager: ObservableObject {
    @Published var timeRemaining: Int = 5
    @Published var timerRunning: Bool = false
    private var timer: Timer?
    private var isPaused: Bool = false

    
    func startTimer() {
        print("rodando: \(timerRunning)")
        guard !timerRunning else { return }
        timerRunning = true
        isPaused = false
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if self.timeRemaining > 0 && self.isPaused == false{
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
        isPaused = true
        timer?.invalidate()
    }
    
    func resumeTimer() {
        print(isPaused)
        guard isPaused else { return }
        isPaused = false
        startTimer()
    }
    

}
