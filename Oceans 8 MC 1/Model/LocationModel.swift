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
    LocationModel(locationName: "Cafe Sandeul Hill", street: "342-15 Manchon-dong, Suseong-gu, Daegu, South Korea", hours: "10.30am – 8.30pm", description: "The Goobne chicken restaurant that Ha Ri's family runs is actually a cafe called Sandeul Hill which is also a vegan bakery. This restaurant is located in the Manchon neighborhood, Daegu, South Korea.", image: "cafe-bus-pro", imageCollection: ["cafe-bus-2", "cafe-bus-3"], restriction: "If you park in front of the store, there is a risk of a contact accident.", access: "'Cafe Sandeul Hill' is located on a hill in a residential area near Dongmun Middle School / Dongmun Elementary School, about 100m away, and there is a small walking path next to the nearby train road. It is located in front of the KTX Gulebangdari intersection. If it is difficult to find, you can come about 50m from the entrance of Dongwon Middle School.", price: "Free", movie: "A Business Proposal", bookmark: false, latitude: 35.8744965524049, longitude: 128.64989129777777),
    LocationModel(locationName: "Stair to Suga Shrine", street: "Japan, 〒160-0018 Tokyo, Shinjuku City, Sugacho, ５", hours: "-", description: "This place is the most iconic location of the film, where Taki and Mitsuha finally met at the end of the film.", image: "stairs-suga-shrine", imageCollection: ["kimi-no-na-wa-stairs", "stairs-1"], restriction: "No restriction, but be careful if you visit this place on night", access: "The stairs actually is a public facility, and locals passed by normally, so it should be easy to find.", price: "Free", movie: "Kimi no na Wa", bookmark: false, latitude: 35.89999, longitude: 128.999999),
    LocationModel(locationName: "Pedestrian Bridge", description: "The place where Miki Okudera and Taki had conversation before saying goodbye to each other. After Miki left, Taki decided to call up Mitsuha but failed to reach her. It is located at the same Sinanomachi Station.", image: "pedestrian-bridge", imageCollection: ["bridge-kimi-no-na-wa", "bridge2"], movie: "Kimi no na Wa", bookmark: false, latitude: 35.89999, longitude: 128.999999),
    LocationModel(locationName: "Dogo Onsen", street: "5-6 Dogoyunomachi", hours: "Everyday 6AM-11PM", description: "Was build in 1894. It is actually one of the oldest public bathhouse in Japan! Around Dogo Onsen, there are some other bathhouses and also more attractions such as shopping arcade, temples and shrines.", image: "spirited-away-location-1", imageCollection: [], restriction: "Please do not bring food and drinks into Dogo Onsen Honkan, Dogo Onsen Annex Asuka-no-Yu, or Dogo Onsen Tsubaki-no-Yu from the outside.", access: "Dogo Onsen is located in the main tourist hub of Matsuyama and is a five-minute walk from the Dogo tram stop along a bustling shopping arcade. If you are heading to Dogo from JR Matsuyama Station, take the #5 tram. You'll get there in about 30 minutes.", price: "Free (General Admission)", movie: "Spirited Away", bookmark: false, latitude: 35.89999, longitude: 128.999999),
    LocationModel(locationName: "Edo Tokyo Tatemono-en", street: "3 Chome-7-1 Sakuracho, Koganei, Tokyo", hours: "Everydat 9:30AM–5:30PM", description: "The Edo-Tokyo Open Air Architectural Museum in Koganei Park, Tokyo, Japan, is a museum of historic Japanese buildings.", image: "spirited-away-location-2", imageCollection: [], access: "From Musashi-Koganai station (JR Chuo line) 5 min from the north exit of Musashi-Koganei station. With the bus from bus stop 2 or 3: Get off at “Koganei-Koen Nishiguchi”. The museum is 5 min walk from there.", price: "200-400 Yen", movie: "Spirited Away", bookmark: false, latitude: 35.89999, longitude: 128.999999)
]


