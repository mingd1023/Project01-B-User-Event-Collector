//
//  ArtistView.swift
//  MiniVibe
//
//  Created by TTOzzi on 2020/12/01.
//

import SwiftUI

struct ArtistView: View {
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            ScrollView {
                VStack(spacing: 24) {
                    ArtistThumbnail()
                    //ChartSectionA(width: width, sectionTitle: "노래")
                    
                    VStack {
                        SectionTitle(
                            width: width,
                            destination: ChartList(title: "노래"),
                            title: "노래"
                        )

                        VStack(spacing: 12) {
                            ForEach(0..<5) { _ in
                                TrackRowB(title: "Dynamite", artist: "방탄소년단")
                            }
                            .frame(width: width * .sectionRatio)
                        }
                        .padding(.horizontal, width * .paddingRatio)   
                    }
                    
                    ThumbnailSection(width: width,
                                     destination: ArtistAlbumGridView(title: "앨범"),
                                     title: "앨범")
                    ThumbnailSection(width: width,
                                     destination: ThumbnailList(title: "관련 플레이리스트", info: .playlist),
                                     title: "관련 플레이리스트")
                    ArtistSection(width: width,
                                  sectionTitle: "비슷한 아티스트")
                }
            }
            .navigationTitle("방탄소년단")
            .navigationBarItems(trailing: trailingBarButtons)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    var trailingBarButtons: some View {
        HStack(spacing: 10) {
            Button {
                
            } label: {  Image(systemName: "heart") }
            
            Button {
                
            } label: { Image(systemName: "ellipsis")  }
        }
        .font(.system(size: 17))
        .foregroundColor(.black)
    }
}

struct ArtistView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ArtistView()
        }
    }
}