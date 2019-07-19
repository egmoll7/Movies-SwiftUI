//
//  MovieCell.swift
//  Movies
//
//  Created by Eduardo Moll on 6/5/19.
//  Copyright © 2019 eduardo moll. All rights reserved.
//

import SwiftUI
import Combine

struct MovieCell : View {
    // MARK: - Properties
    let movie: Movie
    @State var posterImage =  UIImage()
    
    // MARK: - UI
    var body: some View {
        Group {
            HStack(spacing: 12) {
                Image(uiImage: posterImage)
                    .resizable()
                    .frame(width: 45, height: 60)
                    .aspectRatio(contentMode: .fill)
                VStack(alignment: .leading) {
                    Text(movie.title)
                        .font(.headline)
                    
                    Text(movie.overview)
                        .font(.subheadline)
                        .lineLimit(4)
                        .foregroundColor(.secondary)
                }
            }
        }.onAppear {
            self.loadImage(path: self.movie.posterPath)
        }
    }
    
    private func loadImage(path: String) {
        APIManager().getImage(path: path) { (result) in
            switch result {
            case .success(let image):
                self.posterImage = image
            case .failure(_):
                break
            }
        }
    }
}

#if DEBUG
struct MovieCell_Previews : PreviewProvider {
    static var previews: some View {
        MovieCell(movie: Movie(id: 1,
                               rating: 7.3,
                               title: "Aladdin",
                               posterPath: "/3iYQTLGoy7QnjcUYRJy4YrAgGvp.jpg",
                               overview: "A kindhearted street urchin named Aladdin embarks on a magical adventure after finding a lamp that releases a wisecracking genie while a power-hungry Grand Vizier vies for the same lamp that has the power to make their deepest wishes come true."))
    }
}
#endif
