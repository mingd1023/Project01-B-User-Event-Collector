//
//  MainTab.swift
//  MiniVibe
//
//  Created by TTOzzi on 2020/11/26.
//

import SwiftUI

struct MainTab: View {
    @State private var contentFrame = CGRect.zero
    @State private var isPlayerPresented = false
    @EnvironmentObject private var nowPlaying: NowPlaying
    
    init() {
        UITabBar.appearance().barTintColor = .systemBackground
        UITabBar.appearance().clipsToBounds = true
    }
    
    var body: some View {
        TabView {
            Today()
                .tabItem {
                    Image(systemName: "house.fill")
                }
            
            Chart()
                .tabItem {
                    Image(systemName: "chart.bar.fill")
                }
            
            Text("검색")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            
            Text("보관함")
                .tabItem {
                    Image(systemName: "person.fill")
                }
        }
        .accentColor(.pink)
        .onPreferenceChange(Size.self, perform: { value in
            contentFrame = value.last ?? .zero
        })
        .overlay(
            PlayerPreview(coordinate: contentFrame)
                .onTapGesture {
                    nowPlaying.isPlayerOpen.toggle()
                }
                .sheet(isPresented: $nowPlaying.isPlayerOpen) {
                    PlayerView()
                }
        )
    }
}

struct MainTab_Previews: PreviewProvider {
    static var previews: some View {
        MainTab()
            .environmentObject(NowPlaying())
    }
}

struct Size: PreferenceKey {
    typealias Value = [CGRect]
    static var defaultValue: [CGRect] = []
    static func reduce(value: inout [CGRect], nextValue: () -> [CGRect]) {
        value.append(contentsOf: nextValue())
    }
}