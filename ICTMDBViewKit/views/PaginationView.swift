//
//  PaginationView.swift
//  ICTMDBViewKit
//
//  Created by Engin Gülek on 24.12.2025.
//

import SwiftUI
public struct PaginationView: View {
    let currentPage: Int
    let totalPages: Int
    let prevAction: () -> Void
    let nextAction: () -> Void
    
    public init(currentPage: Int,
         totalPages: Int,
         prevAction: @escaping () -> Void,
         nextAction: @escaping () -> Void) {
        self.currentPage = currentPage
        self.totalPages = totalPages
        self.prevAction = prevAction
        self.nextAction = nextAction
    }
    
    public var body: some View {
        HStack(spacing: 25) {
            Button(action: prevAction) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(currentPage > 1 ? .black : .gray.opacity(0.5))
            }
            .disabled(currentPage <= 1)
            Text("\(currentPage) / \(totalPages)")
                .font(.system(size: 16, weight: .semibold))
                .monospacedDigit()
            
            Button(action: nextAction) {
                Image(systemName: "chevron.right")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(currentPage < totalPages ? .black : .gray.opacity(0.5))
            }
            .disabled(currentPage >= totalPages)
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 12)
        .background(Color(.systemGray6))
        .clipShape(Capsule())
        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}
