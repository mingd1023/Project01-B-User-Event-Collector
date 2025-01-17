//
//  GenreSection.swift
//  MiniVibe
//
//  Created by Sue Cho on 2020/12/04.
//

import SwiftUI

struct GenreItem: View {
    let title: String
    let width: CGFloat
    let color: Color
    
    var body: some View {
        Button {
            
        } label: {
            HStack(spacing: 10) {
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(width: 5, height: 40)
                    .foregroundColor(color)
                Text(title)
                    .foregroundColor(.primary)
            }
        }
        .frame(width: width * .thumbnailRatio, alignment: .leading)
        .padding(.vertical, 5)
        .background(Color.playAndShuffle)
        .cornerRadius(3.0)
    }
}

struct GenreSection: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Text("Genre")
                    .font(.system(size: 16.5))
                    .foregroundColor(.primary)
                    .bold()
                    
                LazyVGrid(
                    columns: .init(repeating: .init(), count: 2)
                ) {
                    GenreItem(title: "이 노래 들어봐", width: geometry.size.width, color: Color(.brown))
                    GenreItem(title: "국내 발라드", width: geometry.size.width, color: .blue)
                    GenreItem(title: "국내 힙합", width: geometry.size.width, color: .yellow)
                    GenreItem(title: "POP", width: geometry.size.width, color: .purple)
                }
            }
            .padding(.horizontal, geometry.size.width * .paddingRatio)
        }
    }
}

struct GenreSection_Previews: PreviewProvider {
    static var previews: some View {
        GenreSection()
    }
}
