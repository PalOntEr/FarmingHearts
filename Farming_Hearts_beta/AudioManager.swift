//
//  AudioManager.swift
//  Farming_Hearts_beta
//
//  Created by Jose Vazquez on 11/11/24.
//

import UIKit
import AVFoundation

class AudioManager {
    static let shared = AudioManager()
    var audioPlayer: AVAudioPlayer?

    private init() {}

    func playBackgroundMusic(_ filename: String) {
        guard let asset = NSDataAsset(name: filename) else {
            print("Could not find file: \(filename)")
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(data: asset.data)
            audioPlayer?.numberOfLoops = -1 // Infinite loop
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
            print("Music started playing")
        } catch {
            print("Could not create audio player: \(error)")
        }
    }

    func stopBackgroundMusic() {
        audioPlayer?.stop()
    }
}
