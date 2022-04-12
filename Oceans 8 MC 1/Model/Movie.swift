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
    Movie(id: 2, title: "Yuru Camp", releaseDate: "2018", genre: "Anime", synopsis: "Yuru Camp is the story of Rin Shima and her friend Nadeshiko Kagamihara. Rin is a high-school girl who likes camping by herself. Nadeshiko is a member of their school’s Outdoor Activities Club, and likes camping with others. In each episode they do such camping activities such as travelling to the campsite, setting up a tent, cooking food, eating food, and enjoying the scenery.", moviePoster: "yuru-camp-poster", city: "Tokyo", locationImage: [], locationName: []),
    Movie(id: 3, title: "Spirited Away", releaseDate: "2001", genre: "Anime", synopsis: "10-year-old Chihiro (Rumi Hiiragi) and her parents (Takashi Naitô, Yasuko Sawaguchi) stumble upon a seemingly abandoned amusement park. After her mother and father are turned into giant pigs, Chihiro meets the mysterious Haku (Miyu Irino), who explains that the park is a resort for supernatural beings who need a break from their time spent in the earthly realm, and that she must work there to free herself and her parents.", moviePoster: "spirited-away-poster", city: "Matsuyama", locationImage: [], locationName: []),
    Movie(id: 4, title: "The Goblin: The Lonely and Great God", releaseDate: "2016-2017", genre: "Drama", synopsis: "Goblin / Kim Shin(Gong Yoo) who seeks to end his cursed immortal life and needs a human bride (Kim Go Eun) to do so.  His life then becomes intertwined with a grim reaper (Lee Dong Wook) who is unable to remember his past. But when the goblin finally finds his bride, he suddenly realizes he wants to live and be with her.", moviePoster: "spirited-away-poster", city: "Seoul", locationImage: [], locationName: []),
    Movie(id: 5, title: "Start Up", releaseDate: "2020", genre: "Drama", synopsis: "Start-Up tells the stories of people in the startup world. Seo Dal Mi (Bae Suzy), the main character of this film, dreams of becoming Steve Jobs from Korea. She's an adventurer who doesn't have much treasure, but has big plans for himself. She also has experience in various part-time jobs and is a person with high curiosity.", moviePoster: "start-up", city: "Seoul", locationImage: [], locationName: []),
    Movie(id: 6, title: "AADC 2", releaseDate: "2016", genre: "Movie", synopsis: "14 years after their budding romance in high school, Rangga and Cinta reunite in Yogyakarta to have their closure after Rangga had left Cinta with no explanation years prior.", moviePoster: "aadc-2", city: "Yogyakarta", locationImage: [], locationName: []),
    Movie(id: 7, title: "Ode to Joy 2", releaseDate: "2017", genre: "Drama", synopsis: "Who will Andy end up with? Will Fang Sheng Mei finally be happy? Will Qu Xiao Xiao and Zhao Qi Ping end up together? Will Qiu Ying Ying and Yi Qing be in a relationship?", moviePoster: "odetojoy2", city: "China Mainland", locationImage: [], locationName: []),
    Movie(id: 8, title: "Parasite", releaseDate: "2019", genre: "Movie", synopsis: "The struggling Kim family sees an opportunity when the son starts working for the wealthy Park family. Soon, all of them find a way to work within the same household and start living a parasitic life.", moviePoster: "parasite", city: "Seoul", locationImage: [], locationName: []),
    Movie(id: 9, title: "Crazy Rich Asians", releaseDate: "2018", genre: "Movie", synopsis: "Rachel, a professor, dates a man named Nick and looks forward to meeting his family. However, she is shaken up when she learns that Nick belongs to one of the richest families in the country.", moviePoster: "crazyrichasians", city: "Singapore", locationImage: [], locationName: []),
    Movie(id: 10, title: "Doctor Strange", releaseDate: "2016", genre: "Movie", synopsis: "In an accident, Stephen Strange, a famous neurosurgeon, loses the ability to use his hands. He goes to visit the mysterious Ancient One to heal himself and becomes a great sorcerer under her tutelage.", moviePoster: "spirited-away-poster", city: "New York", locationImage: [], locationName: [])
]
