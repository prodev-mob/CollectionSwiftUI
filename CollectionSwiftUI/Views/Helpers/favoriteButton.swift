//
//  favoriteButton.swift
//  CollectionSwiftUI
//
//  Created by DREAMWORLD on 28/07/23.
//

import SwiftUI

struct favoriteButton: View {
    
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
} 

struct favoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        favoriteButton(isSet: .constant(true))
    }
}
