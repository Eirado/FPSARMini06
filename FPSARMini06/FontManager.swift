//
//  File.swift
//  FPSARMini06
//
//  Created by Maria Clara Reis Guimarães on 20/08/24.
//

import Foundation
import SwiftUI

class FontManager {

    // Enum para representar os diferentes estilos de fonte
    enum FontStyle: String {
        case title = "DharmaGothicE-BoldItalic"
        case regular = "WorkSans-Regular"
        case bold = "WorkSans-BoldItalic"

        var fileName: String {
            return rawValue
        }
    }
    enum FontSizer: CGFloat {
        case SizerLargeText = 64
        case SizerText = 24
        case SizerSmall = 16

        var FontSizerText:  CGFloat  {
            return rawValue
        }
    }

    // Propriedade estática para acessar a instância compartilhada
    static let shared = FontManager()

    private init() {}

    // Método para obter a fonte personalizada com base no estilo fornecido
    func customFont(style: FontStyle, sizer: FontSizer) -> Font {

        if let url = Bundle.main.url(forResource: style.fileName, withExtension: "ttf"){
            CTFontManagerRegisterFontsForURL(url as CFURL, CTFontManagerScope.process, nil)

            let myFont = UIFont(name: style.fileName, size: sizer.FontSizerText) ?? UIFont.systemFont(ofSize: sizer.FontSizerText)

            return Font(myFont)
        } else {

            return Font(UIFont.systemFont(ofSize: sizer.FontSizerText))
        }
    }
}
