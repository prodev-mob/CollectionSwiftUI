//
//  LandmarkRow.swift
//  CollectionSwiftUI
//
//  Created by DREAMWORLD on 15/07/23.
//

import SwiftUI

struct LandmarkRow: View {
    
    var landmark: Landmark
    
    var body: some View {
        HStack {
            //Direct add Image with out UIImageView
            landmark.image
                .resizable() // Aspectfit
                .frame(width: 50,height: 50)
            Text(landmark.name) // UILable + .text
            Spacer() // edgeInsets
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkRow(landmark: ModelData().landmarks[0])
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
