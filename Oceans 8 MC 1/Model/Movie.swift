//
//  Movie.swift
//  Oceans 8 MC 1
//
//  Created by Jonathan Ricky Sandjaja on 08/04/22.
//

import Foundation

struct Movie {
    var title: String
    var releaseDate: String
    var genre: String
    var synopsis: String
    var location: [Location]
}

let movieArray: [Movie] = [
    Movie(title: "Spiderman No Way Home", releaseDate: "2021", genre: "Action", synopsis: "With Spider-Man's identity now revealed, Peter asks Doctor Strange for help. When a spell goes wrong, dangerous foes from other worlds start to appear, forcing Peter to discover what it truly means to be Spider-Man.", location: []),
    Movie(title: "Kimi no na Wa", releaseDate: "2016", genre: "Anime", synopsis: "Two teenagers share a profound, magical connection upon discovering they are swapping bodies. Things manage to become even more complicated when the boy and girl decide to meet in person.", location: [])
]
