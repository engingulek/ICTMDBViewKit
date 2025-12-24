//
//  SectionHeader.swift
//  ICTMDBViewKit
//
//  Created by Engin Gülek on 24.12.2025.
//

import SwiftUI

import SwiftUI

public struct SectionHeader: View {
    let iconName: String
    let iconColor: Color
    let title: String
    let onTappedAllList: () -> Void
    
    public init(
        iconName: String,
        iconColor: Color,
        title: String,
        onTappedAllList: @escaping () -> Void // @escaping eklemek uzun vadede faydalı olur
    ) {
        self.iconName = iconName
        self.iconColor = iconColor
        self.title = title
        self.onTappedAllList = onTappedAllList
    }
    
    public var body: some View {
        HStack {
           
            HStack(spacing: 8) {
                Image(systemName: iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 25)
                    .foregroundStyle(iconColor)
                
                Text(title)
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            
            Spacer()
            
            
            Button(action: onTappedAllList) {
                Text("All List")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
            }
        }
        .padding(.horizontal)
    }
}



#Preview {
    SectionHeader(iconName: "circle.fill", iconColor: .green, title: "Airing Today") {
        
    }
}
