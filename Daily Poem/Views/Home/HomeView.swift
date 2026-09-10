//
//  Home.swift
//  Daily Poem
//
//  Created by Daud Dimas Prasetyo on 09/09/26.
//

import SwiftUI

// MARK: - Home Feed Screen
struct HomeView: View {
    @StateObject private var viewModel = PoetryViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(UIColor.systemGroupedBackground).ignoresSafeArea()
                
                if viewModel.isLoading {
                    ProgressView("Fetching poems...")
                } else if let errorMessage = viewModel.errorMessage {
                    VStack(spacing: 12) {
                        Image(systemName: "exclamationmark.triangle")
                            .font(.largeTitle)
                            .foregroundColor(.orange)
                        Text(errorMessage)
                            .foregroundColor(.secondary)
                        Button("Try Again") {
                            Task { await viewModel.fetchRandomPoems() }
                        }
                        .buttonStyle(.borderedProminent)
                    }
                } else {
                    ScrollView {
                        LazyVStack(spacing: 16) {
                            ForEach(viewModel.poems) { poem in
                                PoemCardView(poem: poem)
                            }
                        }
                        .padding(.vertical)
                    }
                    .refreshable {
                        await viewModel.fetchRandomPoems()
                    }
                }
            }
            .navigationTitle("Discover")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        Task { await viewModel.fetchRandomPoems() }
                    } label: {
                        Image(systemName: "arrow.clockwise")
                    }
                }
            }
        }
        .task {
            if viewModel.poems.isEmpty {
                await viewModel.fetchRandomPoems()
            }
        }
    }
}
