//
//  Location.swift
//  Oceans 8 MC 1
//
//  Created by Jonathan Ricky Sandjaja on 08/04/22.
//

import Foundation

struct LocationModel {
    var locationName: String
    var street: String?
    var hours: String?
    var description: String
    var image: String
    var imageCollection: [String]
    var restriction: String?
    var access: String?
    var price: String?
    var movie: String
    var bookmark: Bool
}

var locationArray: [LocationModel] = [
    LocationModel(locationName: "Stair to Suga Shrine", street: "Japan, 〒160-0018 Tokyo, Shinjuku City, Sugacho, ５", hours: "-", description: "This place is the most iconic location of the film, where Taki and Mitsuha finally met at the end of the film.", image: "stairs-suga-shrine", imageCollection: ["indonesia", "korea"], restriction: "No restriction, but be careful if you visit this place on night", access: "The stairs actually is a public facility, and locals passed by normally, so it should be easy to find.", price: "Free", movie: "Kimi no na Wa", bookmark: false),
    LocationModel(locationName: "Korea", street: "Shibuya No. 17", hours: "-", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras bibendum mi vitae metus pulvinar ullamcorper. Maecenas dapibus tristique rutrum. Donec auctor, nisi sed condimentum rutrum, augue elit convallis eros, sed faucibus est odio sit amet tortor.", image: "korea", imageCollection: ["indonesia", "korea"], restriction: "No restriction, but be careful if you visit this place on night", access: "Anyone could access this place, because this place is a public facility", price: "Free", movie: "Spiderman No Way Home", bookmark: false)
]
