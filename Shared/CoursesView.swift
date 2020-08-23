//
//  CoursesView.swift
//  DesignCodeCourse
//
//  Created by Aivars Meijers on 15/08/2020.
//

import SwiftUI

import SwiftUI

struct CoursesView: View {
    @State var show = false
    @Namespace var namespace
    @State var selectedItem: Course? = nil
    @State var isDisabled = false
    
    var body: some View {
        ZStack {
            #if os(iOS)
            content
                .navigationBarHidden(true)
            fullContent
                .background(VisualEffectBlur(blurStyle: .systemMaterial).edgesIgnoringSafeArea(.all))
            #else
            content
            fullContent
                .background(VisualEffectBlur().edgesIgnoringSafeArea(.all))
            #endif
        }
        .navigationBarTitle("Courses")
    }
    var content: some View {
        ScrollView {
            LazyVGrid (
                columns: [
                    GridItem(.adaptive(minimum: 160), spacing: 16)
                ],
                spacing: 16
            ){
                ForEach(courses) { item in
                    VStack {
                        CourseItem(course: item)
                            .matchedGeometryEffect(id: item.id, in: namespace, isSource: !show)
                            .frame(height: 200)
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    show.toggle()
                                    selectedItem = item
                                    isDisabled = true
                                }
                            }
                            .padding(16)
                            .disabled(isDisabled)
                    }
                    .matchedGeometryEffect(id: "container\(item.id)", in: namespace, isSource: !show)
                }
            }
            .frame(maxWidth: .infinity)
        }
        .zIndex(1)
    }
    
    @ViewBuilder
    var fullContent: some View {
        if selectedItem != nil {
            ZStack(alignment: .topTrailing) {
                CourseDetail(course: selectedItem!, namespace: namespace)
                                    
                CloseButton()
                    .padding(16)
                    .onTapGesture {
                        withAnimation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0)) {
                            show.toggle()
                            selectedItem = nil
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                isDisabled = false
                            }
                        }
                    }
            }
            .zIndex(2)
            .frame(minWidth: 712, maxWidth: .infinity)
        }
    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}
