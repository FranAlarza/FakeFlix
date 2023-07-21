//
//  InfoManager.swift
//  FakeFlix
//
//  Created by Francisco Javier Alarza on 20/7/23.
//

import Foundation
import AVFoundation

enum InfoDictionaryNames: String {
    case apiConfig
}

final class InfoManager {
    
    static let shared = InfoManager()
    private var audioPlayer: AVAudioPlayer?
    
    private init() {}
    
    public func get(for key: String, in array: InfoDictionaryNames) -> String? {
        guard
            let dictionary = Bundle.main.object(forInfoDictionaryKey: array.rawValue) as? Dictionary<String,String>
        else { return nil }
        return dictionary[key]
        
    }
    
    public func playSound(sound: String, type: String) {
        if let path = Bundle.main.path(forResource: sound, ofType: type) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(filePath: path))
                audioPlayer?.play()
            } catch {
                print("Unable to play te sound")
            }
        }
    }
    
}
