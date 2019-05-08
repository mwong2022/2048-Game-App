//  GameScene.swift GameApp
//  Created by Mason Wong on 5/2/19.
//  Copyright © 2019 Mason Wong. All rights reserved.
import SpriteKit
import GameplayKit
class GameScene: SKScene {
    var tile = Tile();
    var tilez = [[Tile]]();
    private var label: SKLabelNode?
    private var spinnyNode : SKShapeNode?
    override func didMove(to view: SKView) {
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)));
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)));
        leftSwipe.direction = .left;
        let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)));
        upSwipe.direction = .up;
        let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)));
        downSwipe.direction = .down;
        view.addGestureRecognizer(rightSwipe);
        view.addGestureRecognizer(leftSwipe);
        view.addGestureRecognizer(upSwipe);
        view.addGestureRecognizer(downSwipe);
        let newX1 = Int.random(in: 0 ..< 4);
        let newY1 = Int.random(in: 0 ..< 4);
        var newX2 = Int.random(in: 0 ..< 4);
        var newY2 = Int.random(in: 0 ..< 4);
        while newX1 == newX2 && newY1 == newY2 {
            newX2 = Int.random(in: 0..<4);
            newY2 = Int.random(in: 0..<4);
        }
        print(newX1);
        print(newY1);
        print(newX2);
        print(newY2);
        for a in 0...3 {
            var rows = [Tile]();
            for b in 0...3 {
                rows.append(Tile());
                self.addChild(rows[b].sprite);
                rows[b].sprite.position = CGPoint(x: (a * 65) - 65, y: (b * 60) - 60);
            }
            tilez.append(rows);
        }
        tilez[newX1][newY1].sprite.texture = Tile.two;
        tilez[newX2][newY2].sprite.texture = Tile.two;
    }
    func moveLeft() {
        for a in 1...3 {
            for b in 0...3 {
                var nextA = a - 1;
                var nextB = b;
                while tilez[nextA][nextB].sprite.texture == Tile.blank && nextA >= 0{
                    
                    print("looping")
                    let tempTile = tilez[nextA + 1][nextB].sprite.texture;
                    tilez[nextA][nextB].sprite.texture = tempTile;
                    tilez[nextA + 1][nextB].sprite.texture = Tile.blank;
                    nextA -= 1
                }
            }
        }
    }
    func moveRight() {
        for a in 0...2 {
            for b in 0...3 {
                
            }
        }
    }
    func moveUp() {
        for a in 0...3 {
            for b in 1...3 {
                
            }
        }
    }
    func moveDown() {
        for a in 0...3 {
            for b in 0...2 {
                
            }
        }
    }
    @objc func handleSwipe(sender: UISwipeGestureRecognizer) {
        if sender.state == .ended {
            switch sender.direction {
            case.right:  moveRight();
            case.left:  moveLeft();
            case.up:  moveUp();
            case.down:  moveDown();
            default:
                break
            }
        }
    }
    func touchDown(atPoint pos : CGPoint) {
    }
    func touchMoved(toPoint pos : CGPoint) {
    }
    func touchUp(atPoint pos : CGPoint) {
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    override func update(_ currentTime: TimeInterval) {
    }
}
