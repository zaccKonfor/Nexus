//
//  VideoModel.swift
//  Nexus
//
//  Created by Zacc Konfor on 5/5/26.
//

import UIKit

struct VideoModel {
    let caption: String
    let username: String
    let audioTrackName: String
    let videoFileName: String
    let videoFileFormat: String
    var isSelected: Bool
}

public class VideoData {
    
    static var videoDataModel: [VideoModel] = [
        VideoModel(caption: "transporting oil on a rail way",
                   username: "@Nagato",
                   audioTrackName: "the oil train 🎵",
                   videoFileName: "train",
                   videoFileFormat: "mp4", isSelected: false),
        
        VideoModel(caption: "A tiger in its natural habitat",
                    username: "@Yahiko",
                    audioTrackName: "Tiger in the wild 🎵",
                    videoFileName: "tiger",
                   videoFileFormat: "mp4", isSelected: false),
        
        VideoModel(caption: "follow the white monkey",
                    username: "@Konan",
                    audioTrackName: "Monkey Season 🎵",
                    videoFileName: "white_monkey",
                   videoFileFormat: "mp4", isSelected: false),
        
        VideoModel(caption: "the bird in the wild",
                    username: "@RinNohara",
                    audioTrackName: "birds of a feather 🎵",
                    videoFileName: "small_white_bird",
                   videoFileFormat: "mp4", isSelected: false),
        
        VideoModel(caption: "this is night traffic",
                   username: "@ObitoUchiha",
                   audioTrackName: "from downtown traffic 🎵",
                   videoFileName: "traffic",
                   videoFileFormat: "mp4", isSelected: false),
        
        VideoModel(caption: "rain deer in the wild",
                   username: "@KakashiHatake",
                   audioTrackName: "wild rain deer 🎵",
                   videoFileName: "rain_deer",
                   videoFileFormat: "mp4", isSelected: false),
        
        VideoModel(caption: "Motorcycles riding through town",
                   username: "@NarutoUzumaki",
                   audioTrackName: "a ride through town 🎵",
                   videoFileName: "motorcycles",
                   videoFileFormat: "mp4", isSelected: false),
        
        VideoModel(caption: "the wild lion",
                   username: "@SasukeUchiha",
                   audioTrackName: "a lion's roar 🎵",
                   videoFileName: "lion",
                   videoFileFormat: "mp4", isSelected: false)]
}
