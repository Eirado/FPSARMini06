//
//  ScoreUpdateSystem.swift
//  FPSARMini06
//
//  Created by Luiz Felipe on 09/08/24.
//

import Foundation
import Combine

protocol ScoreUpdatingSystem: AnyObject {
    var score: Published<Int>.Publisher { get }
}
