//
//  PlayerMenu.swift
//  MiniVibe
//
//  Created by TTOzzi on 2020/12/01.
//

import SwiftUI

struct PlayerMenu: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject private var nowPlaying: NowPlaying
    @ObservedObject var viewModel: TrackViewModel
    
    var body: some View {
        VStack(spacing: 36) {
            Spacer()
            let track = viewModel.track
            MenuThumbnailButton(imageUrl: track.album.imageUrl,
                                title: track.title,
                                subtitle: track.artist.name)
            MenuButton(type: .like(track.liked)) {
                viewModel.like()
            }
            MenuButton(type: .exclude) {
                
            }
            MenuButton(type: .download(.music)) {
                
            }
            MenuButton(type: .addToPlaylist) {
                
            }
            MenuButton(type: .share) {
                
            }
            MenuCloseButton {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct PlayerMenu_Previews: PreviewProvider {
    static var previews: some View {
        PlayerMenu(viewModel: .init(track: trackinfo, eventLogger: EventLogger(persistentContainer: .init())))
    }
}
