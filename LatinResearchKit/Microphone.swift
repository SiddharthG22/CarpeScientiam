//
//  Microphone.swift
//  LatinResearchKit
//
//  Created by Siddharth Ganapathy on 9/6/21.
//

import Foundation
import ResearchKit


public var MicrophoneTask: ORKOrderedTask {
    return ORKOrderedTask.audioTask(withIdentifier: "AudioTask", intendedUseDescription: "You will be asked to pronounce a word.", speechInstruction: "Everyone who speaks Latin uses this word on a daily basis.", shortSpeechInstruction: "Say Salve!", duration: 10, recordingSettings: nil, checkAudioLevel: true, options: .excludeLocation)
}
