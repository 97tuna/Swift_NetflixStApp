//
//  PlayerViewController.swift
//  MyNetflix
//
//  Created by joonwon lee on 2020/04/01.
//  Copyright © 2020 com.joonwon. All rights reserved.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController {
    
    @IBOutlet weak var playerView: PlayerView!
    @IBOutlet weak var controlView: UIView!
    @IBOutlet weak var playButton: UIButton!
    
    let player = AVPlayer()
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask { // 오른쪽 랜드스케이프 오른쪽 고정 (강제로 하는 방법임)
        return .landscapeRight
    }

    override func viewDidLoad() {
        super.viewDidLoad() // 해당하는 뷰컨트롤러가 메모리에 올라온 것.
        playerView.player = player // 플레이어 뷰의 플레이어가 누구냐, 아웃풋을 설정해줌.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        play()
    }
    
    
    @IBAction func togglePlayButton(_ sender: Any) {
        if player.isPlaying {
            pause()
        } else {
            play()
        }
    }
    
    func play() {
        player.play()
        playButton.isSelected = true
    }
    
    func pause() {
        player.pause()
        playButton.isSelected = false
    }
    
    func reset() {
        player.pause()
        player.replaceCurrentItem(with: nil)
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) { //  나갈때는 관계 정리 확실히 하고 나갈 수 있도록 함.
        reset()
        dismiss(animated: false, completion: nil)
    }
}

extension AVPlayer { // 플레이어가 진행인지 아닌지 확인하는 것
    var isPlaying: Bool {
        guard self.currentItem != nil else { return false }
        return self.rate != 0
    }
}
