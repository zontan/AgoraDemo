//
//  MainViewController.swift
//  AgoraDemo
//
//  Created by Jonathan Fotland on 1/20/20.
//  Copyright © 2020 Jonathan Fotland. All rights reserved.
//

import UIKit
import AgoraUIKit

class MainViewController: UIViewController {

    @IBOutlet weak var appIDField: UITextField!
    @IBOutlet weak var channelNameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTouchStartCall(_ sender: UIButton) {
        guard let channelName = channelNameField.text, channelName != "" else {
            //TODO: Error message
            let alert = UIAlertController(title: "No Channel Name", message: "Please enter a channel name.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        
        
        let agoraView = AgoraVideoViewController.create(appID: "c49176d2f14f43d48b801a43152730d6", token: nil, channel: channelName)
        
        //agoraView.hideAudioMute()
        agoraView.hideVideoMute()
        //agoraView.hideSwitchCamera()
        
        agoraView.setMaxStreams(streams: 2)
                
        navigationController?.pushViewController(agoraView, animated: true)
    }
    
    

}
