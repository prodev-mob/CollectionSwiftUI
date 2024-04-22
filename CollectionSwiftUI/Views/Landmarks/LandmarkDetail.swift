//
//  LandmarkDetail.swift
//  CollectionSwiftUI
//
//  Created by DREAMWORLD on 15/07/23.
//

import SwiftUI
import _MapKit_SwiftUI

struct LandmarkDetail: View {
    // An environment object invalidates the current view whenever the observable object changes.
    @EnvironmentObject var modelData: ModelData
    var landmark : Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        ScrollView {
            //custom mapview set landmark location
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            //lanmark image
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            //vertical stack
            VStack(alignment: .leading) {
                //horizontal stack
                HStack {
                    Text(landmark.name)// label
                        .font(.title)
                    favoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                       
                }
                
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                // sepratore
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            //safe area spacing
            .padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        LandmarkDetail(landmark: modelData.landmarks[0])
            .environmentObject(modelData)
    }
}
