//
//  MultiselectTabBar.swift
//  MiniVibe
//
//  Created by Sue Cho on 2020/12/01.
//

import SwiftUI

struct MultiselectTabBar: View {
    var barItems: [CustomTabbarItem]
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.pink)
            
            HStack {
                ForEach(barItems, id: \.caption) { item in
                    Spacer()
                    
                    Button {
                        // action
                        item.itemFunction()
                    } label: {
                        VStack(spacing: 5) {
                            item.icon
                                .font(.system(size: 20))
                            
                            Text(item.caption)
                                .font(.caption)
                        }
                    }
                    .foregroundColor(.white)
                    
                    Spacer()
                }
            }
            
        }
        .ignoresSafeArea(edges: .bottom)
        .frame(height: 15, alignment: .bottom)
    }
}

struct MultiselectTabBar_Previews: PreviewProvider {
    static var previews: some View {
        MultiselectTabBar(barItems: [AddToPlaylist(), Delete()])
    }
}
