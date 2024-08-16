//
//  ScoreController.swift
//  FPSARMini06
//
//  Created by Luiz Felipe on 08/08/24.
//

import Foundation

public class ScoreController: ObservableObject {
    public static var score: Int = 0
}

class settingsPersistence{
    public static var pauseGame:Bool = false
    public static let defaults = UserDefaults.standard
    
}
