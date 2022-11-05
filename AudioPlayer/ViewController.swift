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
    
    @IBOutlet var iVSound: UIImageView!
    var audioPlayer = AVAudioPlayer()
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let gifURL = Bundle.main.url(forResource: "song", withExtension: ".gif"){
            let elGif = UIImage.animatedImage(withAnimatedGIFURL: gifURL)
            let imgContainer = UIImage.animatedImage(withAnimatedGIFURL: gifURL)
            iVSound.image = elGif
            
            
        }
        cargarAudio()
    }

    func cargarAudio(){
        guard let url = Bundle.main.url(forResource: "MUSIC3", withExtension: "mp3")
        else{
            print("Ocurrio un error")
            return
        }
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            inicializarInterfaz()
        }
        catch{
            print("ocurrio un error,\(error.localizedDescription)")
        }
        
        
    }
    
    func inicializarInterfaz(){
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(actualizaSlider), userInfo: nil, repeats: true)
        sliderDuration.value = 0
        sliderDuration.maximumValue = Float(audioPlayer.duration)
        btnStop.isEnabled = false
        btnPlay.isEnabled = true
        audioPlayer.delegate = self
        audioPlayer.volume = 0.5
        sliderVolume.value = 0.5
    }
    
    @IBAction func playButtonPress(_ sender: Any) {
        audioPlayer.play()
        btnStop.isEnabled = true
        btnPlay.isEnabled = false
    }
    
    @IBAction func stopButtonPress(_ sender: Any) {
        audioPlayer.stop()
        btnStop.isEnabled = false
        btnPlay.isEnabled = true
    }
    
    
    @IBAction func durationSlider(_ sender: Any) {
        audioPlayer.currentTime = Double(sliderDuration.value)
    }
    
    
    @IBAction func volumeSlider(_ sender: Any) {
        audioPlayer.volume = sliderVolume.value
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        timer?.invalidate()
        inicializarInterfaz()
    }
    
     @objc func actualizaSlider(){
         sliderDuration.value = Float(audioPlayer.currentTime)
    }
    
}

