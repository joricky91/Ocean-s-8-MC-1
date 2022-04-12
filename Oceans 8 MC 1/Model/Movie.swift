//
//  Movie.swift
//  Oceans 8 MC 1
//
//  Created by Jonathan Ricky Sandjaja on 08/04/22.
//

import Foundation

struct Movie {
    var id: Int
    var title: String
    var releaseDate: String
    var genre: String
    var synopsis: String
    var moviePoster: String
    var city: String
    var locationImage: [Location]
    var locationName: [Location]
}

let movieArray: [Movie] = [
    Movie(id: 0, title: "A Business Proposal", releaseDate: "2022", genre: "Drama", synopsis: "Shin Ha-ri (Kim Se-jeong) goes on a blind date in place of her friend, Jin Young-seo (Seol In-ah), whose father had arranged it. Young-seo had not wanted to attend and asks Ha-ri to go instead with the goal of having Ha-ri 'getting rejected' by her friend's prospective partner. However, the plans go awry when the prospective partner turns out to be Kang Tae-mu (Ahn Hyo-seop), the CEO of the company where Ha-ri works. Tae-mu decides to marry his blind date partner without knowing she is fake Jin Young-seo or that she is his employee, which she tries assiduously to hide. ", moviePoster: "business-proposal-poster", city: "Seoul", locationImage: [], locationName: []),
    Movie(id: 1, title: "Kimi no na Wa", releaseDate: "2016", genre: "Anime", synopsis: "Two teenagers share a profound, magical connection upon discovering they are swapping bodies. Things manage to become even more complicated when the boy and girl decide to meet in person.", moviePoster: "kimi-no-na-wa-poster", city: "Tokyo", locationImage: [], locationName: []),
    Movie(id: 2, title: "Yuru Camp", releaseDate: "2018", genre: "Anime", synopsis: "Yuru Camp is the story of Rin Shima and her friend Nadeshiko Kagamihara. Rin is a high-school girl who likes camping by herself. Nadeshiko is a member of their school’s Outdoor Activities Club, and likes camping with others. In each episode they do such camping activities such as travelling to the campsite, setting up a tent, cooking food, eating food, and enjoying the scenery.", moviePoster: "yuru-camp-poster", city: "Tokyo", locationImage: [], locationName: [])
]
