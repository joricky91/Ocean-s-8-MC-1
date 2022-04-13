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
    var latitude: Double
    var longitude: Double
}

var locationArray: [LocationModel] = [
    LocationModel(locationName: "Yeonnamjang", street: "2 Yeonhui-ro 5-gil, Yeonhui-dong, Seodaemun-gu, Seoul, South Korea", hours: "11 am - 9 pm", description: "The restaurant that MinWoo works at as a chef is actually a creator lounge, co-working space, restaurant, and cafe called Yeonnamjang. It is in the Seodaemun district of Seoul.", image: "yeonnamjang", imageCollection: ["yeonnamjang", "yeonnamjang-2"], restriction: "No restriction, but be careful if you visit this place on night", access: "Hongik University Station [홍대입구역], Seoul Subway Line 2 / AREX Line / Gyeongui–Jungang Line, Exit 3 (12 min. walk)", price: "Free", movie: "A Business Proposal", bookmark: false, latitude: 37.56442918598903, longitude: 126.92758237169988),
    LocationModel(locationName: "Cafe Sandeul Hill", street: "342-15 Manchon-dong, Suseong-gu, Daegu, South Korea", hours: "10.30am – 8.30pm", description: "The Goobne chicken restaurant that Ha Ri's family runs is actually a cafe called Sandeul Hill which is also a vegan bakery. This restaurant is located in the Manchon neighborhood, Daegu, South Korea.", image: "cafe-bus-pro", imageCollection: ["cafe-bus-2", "cafe-bus-3"], restriction: "If you park in front of the store, there is a risk of a contact accident.", access: "'Cafe Sandeul Hill' is located on a hill in a residential area near Dongmun Middle School / Dongmun Elementary School, about 100m away, and there is a small walking path next to the nearby train road. It is located in front of the KTX Gulebangdari intersection. If it is difficult to find, you can come about 50m from the entrance of Dongwon Middle School.", price: "Free", movie: "A Business Proposal", bookmark: false, latitude: 35.8744965524049, longitude: 128.64989129777777)
]


