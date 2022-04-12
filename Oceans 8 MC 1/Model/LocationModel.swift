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
    LocationModel(locationName: "Yeonnamjang", street: "2 Yeonhui-ro 5-gil, Yeonhui-dong, Seodaemun-gu, Seoul, South Korea", hours: "11 am - 9 pm", description: "The restaurant that MinWoo works at as a chef is actually a creator lounge, co-working space, restaurant, and cafe called Yeonnamjang. It is in the Seodaemun district of Seoul.", image: "yeonnamjang", imageCollection: ["yeonnamjang", "yeonnamjang-2"], restriction: "No restriction, but be careful if you visit this place on night", access: "Hongik University Station [홍대입구역], Seoul Subway Line 2 / AREX Line / Gyeongui–Jungang Line, Exit 3 (12 min. walk)", price: "Free", movie: "A Business Proposal", bookmark: false),
    LocationModel(locationName: "Stair to Suga Shrine", street: "Japan, 〒160-0018 Tokyo, Shinjuku City, Sugacho, ５", hours: "-", description: "This place is the most iconic location of the film, where Taki and Mitsuha finally met at the end of the film.", image: "stairs-suga-shrine", imageCollection: ["kimi-no-na-wa-stairs", "stairs-1"], restriction: "No restriction, but be careful if you visit this place on night", access: "The stairs actually is a public facility, and locals passed by normally, so it should be easy to find.", price: "Free", movie: "Kimi no na Wa", bookmark: false),
    LocationModel(locationName: "Pedestrian Bridge", description: "The place where Miki Okudera and Taki had conversation before saying goodbye to each other. After Miki left, Taki decided to call up Mitsuha but failed to reach her. It is located at the same Sinanomachi Station.", image: "pedestrian-bridge", imageCollection: ["bridge-kimi-no-na-wa", "bridge2"], movie: "Kimi no na Wa", bookmark: false)
]
