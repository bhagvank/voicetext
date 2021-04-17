//
//  ViewController.swift
//  VoiceText


import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    @IBOutlet var textField: UITextView!
    
   
    var speakingRate = 0.5
    
    
    let synthesizer = AVSpeechSynthesizer()
    var voiceSpeech = AVSpeechUtterance(string: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
        
    }

    @objc func dismissKeyboard() {
        
        view.endEditing(true)
    }
   
    // play the input text
    @IBAction func playBtn(_ sender: UIButton) {
        
        voiceSpeech = AVSpeechUtterance(string: textField.text)
        voiceSpeech.rate = Float(speakingRate)
        synthesizer.speak(voiceSpeech)
        
    }
    
    // stop the voice
    @IBAction func stopBtn(_ sender: UIButton) {
        
        synthesizer.stopSpeaking(at: .immediate)
        
    }
    



}

