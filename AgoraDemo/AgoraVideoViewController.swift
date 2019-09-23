//
//  AgoraVideoViewController.swift
//  AgoraDemo
//
//  Created by Jonathan Fotland on 9/23/19.
//  Copyright © 2019 Jonathan Fotland. All rights reserved.
//

import UIKit
import AgoraRtcEngineKit

class AgoraVideoViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var localVideoView: UIView!
    @IBOutlet weak var muteButton: UIButton!
    @IBOutlet weak var hangUpButton: UIButton!
    
    let appID = "YourAppIDHere"
    var agoraKit: AgoraRtcEngineKit?
    let tempToken: String? = nil
    var userID: UInt = 0
    var channelName = "default"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpVideo()
        joinChannel()
    }
    
    func setUpVideo() {
        getAgoraEngine().enableVideo()
        
        let videoCanvas = AgoraRtcVideoCanvas()
        videoCanvas.uid = userID
        videoCanvas.view = localVideoView
        videoCanvas.renderMode = .fit
        getAgoraEngine().setupLocalVideo(videoCanvas)
    }
    
    func joinChannel() {
        localVideoView.isHidden = false
        
        getAgoraEngine().joinChannel(byToken: tempToken, channelId: channelName, info: nil, uid: userID) { [weak self] (sid, uid, elapsed) in
            self?.userID = uid
        }
    }
    
    private func getAgoraEngine() -> AgoraRtcEngineKit {
        if agoraKit == nil {
            agoraKit = AgoraRtcEngineKit.sharedEngine(withAppId: appID, delegate: self)
        }
        
        return agoraKit!
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: "videoCell", for: indexPath)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AgoraVideoViewController: AgoraRtcEngineDelegate {
    
}
