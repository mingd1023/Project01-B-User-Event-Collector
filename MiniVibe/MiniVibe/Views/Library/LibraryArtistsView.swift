//
//  LibraryArtistsView.swift
//  MiniVibe
//
//  Created by TTOzzi on 2020/12/03.
//

import SwiftUI

struct LibraryArtistsView: View {
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            ScrollView {
                LazyVGrid(
                    columns: [.init()],
                    spacing: 20,
                    pinnedViews: [.sectionHeaders]
                ) {
                    Section(header: boomAndChillButton(width: width)) {
                        HStack {
                            Button {
                                
                            } label: {
                                Image(systemName: "checkmark.circle")
                            }
                            .padding(4)
                            Text("10명")
                            Spacer()
                            Button {
                                
                            } label: {
                                HStack(spacing: 2) {
                                    Image(systemName: "arrow.up.arrow.down")
                                    Text("Recently Added")
                                }
                            }
                        }
                        .foregroundColor(.primary)
                        
                        HStack {
                            Image(systemName: "plus")
                                .font(.system(size: 30, weight: .ultraLight))
                                .frame(width: 60, height: 60)
                                .background(Color.playAndShuffle)
                                .clipShape(Circle())
                            
                            Text("아티스트 추가")
                                .foregroundColor(.primary)
                            
                            Spacer()
                        }
                        
                        ForEach(0..<10) { _ in
                            NavigationLink(destination:
                                            ArtistView(viewModel: .init(id: 3))
                                            .logTransition(identifier: .artist(id: 3), componentId: .artistRow)
                            ) {
                                LibraryArtistRow(artist: "방탄소년단")
                            }
                        }
                    }

                }
                .padding(.horizontal, geometry.size.width * .paddingRatio)
                .padding(.bottom, 70)
            }
        }
    }
    
    @ViewBuilder
    func boomAndChillButton(width: CGFloat) -> some View {
        HStack(spacing: width * .spacingRatio) {
            Button(action: {}, label: {
                HStack {
                    Image(systemName: "shuffle")
                    Text("BOOM")
                        .font(.system(size: 18, weight: .semibold))
                }
                .padding()
                .foregroundColor(.purple)
                .frame(width: width * .thumbnailRatio)
            })
            .background(Color.playAndShuffle)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            
            Button(action: {}, label: {
                HStack {
                    Image(systemName: "shuffle")
                    Text("CHILL")
                        .font(.system(size: 18, weight: .semibold))
                }
                .padding()
                .foregroundColor(.blue)
                .frame(width: width * .thumbnailRatio)
            })
            .background(Color.playAndShuffle)
            .clipShape(RoundedRectangle(cornerRadius: 5))
        }
    }
}

struct LibraryArtistsView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryArtistsView()
    }
}
