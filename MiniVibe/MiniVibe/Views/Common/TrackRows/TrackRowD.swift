//
//  TrackRowD.swift
//  MiniVibe
//
//  Created by Sue Cho on 2020/12/02.
//

import SwiftUI

struct TrackRowD: View {
    let order: Int
    let title: String
    let artist: String

    var body: some View {
        HStack {
            HStack {
                Text("\(order)")
                    .font(.title3)
                    .bold()
                    .padding(.horizontal, 4)
                
                Text(title)
                    .font(.title3)
            }
            .padding(.vertical, 10)
            
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "ellipsis")
                    .foregroundColor(.black)
            }
            .padding()
        }
        .padding(.vertical, 8)
    }
}

struct TrackRowD_Previews: PreviewProvider {
    static var previews: some View {
        TrackRowD(order: 1, title: "작은 방 (Feat.아이유)", artist: "스윗소로우")
            .previewLayout(.fixed(width: 375, height: 80))
    }
}