//
//  MovieDetails.swift
//  Movies
//
//  Created by Eduardo Moll on 6/5/19.
//  Copyright © 2019 eduardo moll. All rights reserved.
//

import SwiftUI

struct MovieDetails : View {
    // MARK: - Properties
    let movie: Movie
    
    // MARK: - UI
    var body: some View {
        VStack {
            Image(systemName: "photo")
            .imageScale(.large)
            
            Text(movie.overview)
            .lineLimit(0)
            
            Spacer()
        }
        
        .padding()
        .navigationBarTitle(Text(movie.title), displayMode: .inline)
    }
}

#if DEBUG
struct MovieDetails_Previews : PreviewProvider {
    static var previews: some View {
        MovieDetails(movie: Movie(id: 1,
                                  rating: 7.3,
                                  title: "Aladdin",
                                  posterPath: "/3iYQTLGoy7QnjcUYRJy4YrAgGvp.jpg",
                                  overview: "A kindhearted street urchin named Aladdin embarks on a magical adventure after finding a lamp that releases a wisecracking genie while a power-hungry Grand Vizier vies for the same lamp that has the power to make their deepest wishes come true."
        ))
    }
}
#endif
