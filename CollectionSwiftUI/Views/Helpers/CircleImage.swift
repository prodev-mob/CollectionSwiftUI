//
//  CircleImage.swift
//  CollectionSwiftUI
//
//  Created by DREAMWORLD on 15/07/23.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        //no need to add imageview
        // here image is imageview 🙃
        if #available(iOS 15.0, *) {
            image
            //cliping in circle (masking)
                .clipShape(Circle())
            // overlay circle border
                .overlay {
                    Circle().stroke(.white, lineWidth: 4)
                }
            //the easiest way to drop shadow
                .shadow(radius: 7)
        } else {
            image
                .clipShape(Circle())
                .shadow(radius: 7)
            // Fallback on earlier versions
        }
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
