//
//  CustomPageControllerView.swift
//  RezervoApp
//
//  Created by Ali  Farizli  on 05.03.23.
//

import SwiftUI
import Combine

struct CustomPageControllerView: View {
    var numberOfItems: Int
    var widthOfItem: CGFloat
    var didChangeContentOffset = PassthroughSubject<CGFloat, Never>()
    @State var scrollContentOffset: CGFloat = 0.0
    @State var text = ""
    
    var body: some View {
        HStack {
            ForEach(0..<numberOfItems, id: \.self) { num in
                let width = calculateWidth(num: num)
                Rectangle()
                    .foregroundColor(.white.opacity(width.opacity))
                    .frame(width: width.width, height: 10, alignment: .center)
                    .cornerRadius(5)
                    
            }
            .onReceive(didChangeContentOffset) { value in
                
                scrollContentOffset = value
            }
        }
    }
    func calculateWidth(num: Int) -> (width: CGFloat, opacity: CGFloat){
        let convertedNum = CGFloat(num)
        let displacementFrac = (scrollContentOffset - widthOfItem)/widthOfItem
        let upperIndex = displacementFrac.rounded(.up)
        let lowwerIndex = displacementFrac.rounded(.down)
        var additionalWidth: CGFloat = 0.0
        var opacity = 0.3
        if upperIndex == convertedNum - 1{
            additionalWidth = (displacementFrac - lowwerIndex) * 30.0
            opacity += (displacementFrac - lowwerIndex) * 0.7
        }else if lowwerIndex == convertedNum - 1{
            additionalWidth = (upperIndex - displacementFrac) * 30.0
            opacity += (upperIndex - displacementFrac) * 0.7
        }
        if displacementFrac == -1.0 && convertedNum == 0{
            return (40.0, 1)
        }
        let width = 10.0 + additionalWidth
        return (width, opacity)
    }
}
struct CustomPageControllerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomPageControllerView(numberOfItems: 3, widthOfItem: 120)
    }
}
