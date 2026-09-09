//
//  PoemCardView.swift
//  Daily Poem
//
//  Created by Daud Dimas Prasetyo on 09/09/26.
//


// MARK: - Poem Card View

import SwiftUI

struct PoemCardView: View {
    let poem: Poem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Book/Poem Title
            Text(poem.title)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .lineLimit(2)
            
            // Author
            Text("by \(poem.author)")
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
            
            Divider()
            
            // Quote (Max 3 lines with truncation)
            Text("“\(poem.excerpt)”")
                .font(.body)
                .italic()
                .foregroundColor(.primary.opacity(0.85))
                .lineLimit(3)
                .truncationMode(.tail)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(Color(UIColor.secondarySystemGroupedBackground))
                .shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 4)
        )
        .padding(.horizontal)
    }
}
