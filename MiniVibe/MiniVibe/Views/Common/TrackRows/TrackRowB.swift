//
//  TrackRowB.swift
//  MiniVibe
//
//  Created by Sue Cho on 2020/12/02.
//

import SwiftUI
import KingfisherSwiftUI

struct TrackRowB: View {
    @EnvironmentObject private var nowPlaying: NowPlaying
    let track: TrackInfo

    var body: some View {
        HStack {
            NavigationLink(destination: AlbumView(id: track.albumId ?? 0)) {
                KFImage(URL(string: track.album.imageUrl))
                    .resizable()
                    .frame(width: 50, height: 50)
                    .border(Color.gray, width: 0.7)
            }
            
            Button {
                nowPlaying.addTrack(track: track)
            } label: {
                VStack(alignment: .leading, spacing: 4) {
                    Spacer()
                    Text(track.title)
                        .font(.system(size: 17))
                        .foregroundColor(.black)
                        
                    Text(track.artist.name)
                        .font(.system(size: 13))
                        .foregroundColor(.secondary)
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

struct TrackRowB_Previews: PreviewProvider {
    static var previews: some View {
        TrackRowB(track: .init(id: 0, title: "ABCD", lyrics: "", albumId: 0, album: .init(id: 0, title: "", imageUrl: ""), artist: .init(id: 0, name: "aaaa")))
            .previewLayout(.fixed(width: 375, height: 80))
    }
}
