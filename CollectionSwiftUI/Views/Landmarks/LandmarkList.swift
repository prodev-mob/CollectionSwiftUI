//
//  LandmarkList.swift
//  CollectionSwiftUI
//
//  Created by DREAMWORLD on 15/07/23.
//

import SwiftUI

struct LandmarkList: View {
    @State private var showFavoritesOnly = false
    @EnvironmentObject var modelData: ModelData
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
                (!showFavoritesOnly || landmark.isFavorite)
            }
        }
    
    var body: some View {
        NavigationView { //Navigation viewconroller
            //Table view
            List{
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                //for each for repeating view (cell)
                ForEach(filteredLandmarks) { landmark in
                    //Navigate to destination
                    // It links view and pass data
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList().environmentObject(ModelData())
    }
}
