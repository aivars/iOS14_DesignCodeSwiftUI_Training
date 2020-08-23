//
//  CloseButton.swift
//  DesignCodeCourse
//
//  Created by Aivars Meijers on 21/08/2020.
//

import SwiftUI

struct CloseButton: View {
    var body: some View {
        Image(systemName: "xmark")
                .font(.system(size: 17, weight: .bold))
                .foregroundColor(.white)
                .padding(.all, 10)
                .background(Color.black.opacity(0.6))
                .mask(Circle())
    }
}

struct CloseButton_Previews: PreviewProvider {
    static var previews: some View {
        CloseButton()
    }
}
