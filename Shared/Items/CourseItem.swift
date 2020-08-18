//
//  CourseItem.swift
//  DesignCodeCourse
//
//  Created by Aivars Meijers on 18/08/2020.
//

import SwiftUI

struct CourseItem: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 4.0) {
            Spacer()
            HStack {
                HStack {
                    Spacer()
                    Image("Illustration 1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                Spacer()
            }
            Text("SwiftUI for iOS 14")
                .fontWeight(.bold)
                .foregroundColor(.white)
                
            Text("20 Sections")
                .font(.footnote)
                .foregroundColor(.white)
        }
        .padding(.all)
        .background(Color.blue)
        .cornerRadius(20.0)
        .shadow(radius: 10)
    }
}

struct CourseItem_Previews: PreviewProvider {
    static var previews: some View {
        CourseItem()
    }
}
