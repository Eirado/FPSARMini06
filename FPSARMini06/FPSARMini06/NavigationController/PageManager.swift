//
//  PageManager.swift
//  FPSARMini06
//
//  Created by Letícia Malagutti on 23/07/24.
//

/*
 Página que contém o struct com o organizador de páginas
 */

import Foundation
import SwiftUI

enum Page {
    case menu
    case gameScene
}

@Observable class PageManager {
//    var page: Page = .menu // MARK: Comentar linha quando for testar o jogo em si
    var page: Page = .gameScene // MARK: Comentar página quando for testar o menu
}
