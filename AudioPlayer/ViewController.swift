//
//  ViewController.swift
//  AudioPlayer
//
//  Created by Francisco Hernandez on 05/11/22.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {

    
    @IBOutlet var btnPlay: UIButton!
    @IBOutlet var btnStop: UIButton!
    @IBOutlet var sliderDuration: UISlider!
    @IBOutlet var sliderVolume: UISlider!
                
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
        
    @IBAction func playButtonPress(_ sender: Any) {
    }
    
    @IBAction func stopButtonPress(_ sender: Any) {
        
    }
    
    @IBAction func durationSlider(_ sender: Any) {
    }
    
    
    @IBAction func volumeSlider(_ sender: Any) {
    }
    
}

