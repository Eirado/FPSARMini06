//
//  TextLibarey.swift
//  FPSARMini06
//
//  Created by Maria Clara Reis Guimarães on 20/08/24.
//

import SwiftUI

struct TextTitle: View {
    @State var text:String
    var body: some View {

        Text(text)
            .font(FontManager.shared.customFont(style: .bold, sizer: .SizerLargeText))

    }
}

#Preview{
    TextTitle(text: "Hello word")
}

struct TextCaption: View {
    @State var text:String
    var body: some View {

        Text(text)
            .font(FontManager.shared.customFont(style: .regular, sizer: .SizerSmall))

    }
}

#Preview{
    TextCaption(text: "Hello word")
}



struct TextBody: View {
    @State var text:String

    var body: some View {

        Text(text)
            .font(FontManager.shared.customFont(style: .regular, sizer: .SizerText))


    }
}

struct TextBodyBold: View {
    @State var text:String

    var body: some View {

        Text(text)
            .font(FontManager.shared.customFont(style: .bold, sizer: .SizerSmall))

    }
}
