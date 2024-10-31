//
//  RecordViewController.swift
//  Cube
//
//  Created by XTSW-MAC-1137-2 on 12/08/24.
//

import UIKit
import AVFoundation

class RecordViewController: UIViewController {

    var audioRecorder: AVAudioRecorder?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func startRecording(_ sender: UIButton) {
        // Start recording audio
        let filename = getDocumentsDirectory().appendingPathComponent("recording.m4a")
        let settings = [AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
                        AVSampleRateKey: 12000,
                        AVNumberOfChannelsKey: 1,
                        AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue]
        
        do {
            audioRecorder = try AVAudioRecorder(url: filename, settings: settings)
            audioRecorder?.record()
        } catch {
            showAlert("Recording failed!")
        }
    }

    @IBAction func stopRecording(_ sender: UIButton) {
        // Stop recording
        audioRecorder?.stop()
        audioRecorder = nil
    }

    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }

    func showAlert(_ message: String) {
        let alert = UIAlertController(title: "Record", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
