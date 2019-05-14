//
//  GameViewController.swift
//  GameApp
//
//  Created by Mason Wong on 5/2/19.
//  Copyright © 2019 Mason Wong. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    let evc = "EndViewController";
    var gcv : GameScene?;
    override func viewDidLoad() {
        super.viewDidLoad();
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                gcv = scene as! GameScene;
                gcv!.controller = self;
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
    func gameOver() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let controller = storyboard.instantiateViewController(withIdentifier: evc);
        self.present(controller, animated: true, completion: nil);
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
