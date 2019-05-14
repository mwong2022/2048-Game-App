//  GameScene.swift GameApp
//  Created by Mason Wong on 5/2/19.
//  Copyright © 2019 Mason Wong. All rights reserved.
import SpriteKit
import GameplayKit
class GameScene: SKScene {
    var controller : GameViewController?
    var tilez = [[Tile]]();
    var score = 0;
    var isFull = true;
    var tileMoved : Bool = false;
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
        for a in 0...3 {
            var rows = [Tile]();
            for b in 0...3 {
                rows.append(Tile());
                self.addChild(rows[b].sprite);
                rows[b].sprite.position = CGPoint(x: (a * 110) - 155, y: (b * 100) - 110);
            }
            tilez.append(rows);
        }
        tilez[newX1][newY1].setCount(newCount: 2);
        tilez[newX2][newY2].setCount(newCount: 2);
    }
    func moveLeft() {
        for a in 1...3 {
            for b in 0...3 {
                if tilez[a][b].count == 0 {
                    continue
                }
                var nextA = a - 1;
                var nextB = b;
                while  nextA >= 0 && tilez[nextA][nextB].count == 0 {
                    let tempTile = tilez[nextA + 1][nextB];
                    tilez[nextA][nextB].setCount(newCount: tempTile.count);
                    tempTile.setCount(newCount: 0);
                    nextA -= 1
                    tileMoved = true;
                }
                
                if nextA >= 0 && tilez[nextA][nextB].sprite.texture == tilez[nextA + 1][nextB].sprite.texture {
                    tilez[nextA][nextB].setCount(newCount: tilez[nextA][nextB].count * 2);
                    score += tilez[nextA][nextB].count;
                    tilez[nextA + 1][nextB].setCount(newCount: 0);
                    tileMoved = true;
                }
            }
        }
    }
    func moveRight() {
        for a in stride(from: 2, to: -1, by: -1) {
            for b in 0...3 {
                var nextA = a + 1;
                var nextB = b;
                while  nextA <= 3 && tilez[nextA][nextB].count == 0 {
                    let tempTile = tilez[nextA - 1][nextB];
                    tilez[nextA][nextB].setCount(newCount: tempTile.count);
                    tilez[nextA - 1][nextB].setCount(newCount: 0);
                    nextA += 1
                    tileMoved = true;
                }
                if nextA <= 3 && tilez[nextA][nextB].sprite.texture == tilez[nextA - 1][nextB].sprite.texture {
                    tilez[nextA][nextB].setCount(newCount: tilez[nextA][nextB].count * 2);
                    score += tilez[nextA][nextB].count;
                    tilez[nextA - 1][nextB].setCount(newCount: 0);
                    tileMoved = true;
                }
            }
        }
    }
    func moveDown() {
        for a in 0...3 {
            for b in 1...3 {
                var nextA = a;
                var nextB = b - 1;
                while  nextB >= 0 && tilez[nextA][nextB].count == 0 {
                    let tempTile = tilez[nextA][nextB + 1];
                    tilez[nextA][nextB].setCount(newCount: tempTile.count);
                    tempTile.setCount(newCount: 0);
                    nextB -= 1
                    tileMoved = true;
                }
                if nextB >= 0 && tilez[nextA][nextB].sprite.texture == tilez[nextA][nextB + 1].sprite.texture {
                    tilez[nextA][nextB].setCount(newCount: tilez[nextA][nextB].count * 2);
                    score += tilez[nextA][nextB].count;
                    tilez[nextA][nextB + 1].setCount(newCount: 0);
                    tileMoved = true;
                }
            }
        }
    }
    func moveUp() {
        for a in 0...3 {
            for b in stride(from: 3, to: -1, by: -1) {
                var nextA = a;
                var nextB = b + 1;
                while  nextB <= 3 && tilez[nextA][nextB].count == 0 {
                    let tempTile = tilez[nextA][nextB - 1];
                    tilez[nextA][nextB].setCount(newCount: tempTile.count);
                    tilez[nextA][nextB - 1].setCount(newCount: 0);
                    nextB += 1
                    tileMoved = true;
                }
                if nextB <= 3 && tilez[nextA][nextB].sprite.texture == tilez[nextA][nextB - 1].sprite.texture {
                    tilez[nextA][nextB].setCount(newCount: tilez[nextA][nextB].count * 2);
                    score += tilez[nextA][nextB].count;
                    tilez[nextA][nextB - 1].setCount(newCount: 0);
                    tileMoved = true;
                }
            }
        }
    }
    
    func spawnTile() {
        var newNumber = Int.random(in: 0 ..< 3);
        var newNum1 = Int.random(in: 0 ..< 4);
        var newNum2 = Int.random(in: 0 ..< 4);
        var newNum = 2
        while tilez[newNum1][newNum2].count > 0  {
            newNum1 = Int.random(in: 0 ..< 4);
            newNum2 = Int.random(in: 0 ..< 4);
        }
        if newNumber == 0 {
            newNum = 4;
        }
        tilez[newNum1][newNum2].setCount(newCount: newNum);
    }
    func isGameOver() -> Bool {
        for x in 0...3 {
            for y in 0...3 {
                if tilez[x][y].count == 0 {
                    print(")")
                    return false;
                }
                if x > 0 {
                    if tilez[x][y].count == tilez[x - 1][y].count {
                        print(1);
                        return false
                    }
                } else if x < 3 {
                    if tilez[x][y].count == tilez[x + 1][y].count {
                        print(2);
                        return false
                    }
                }
                if y > 0 {
                    if tilez[x][y].count == tilez[x][y - 1].count {
                        print(3);
                        return false
                    }
                } else if y < 3 {
                    if tilez[x][y].count == tilez[x][y + 1].count {
                        print(4);
                        return false
                    }
                }
            }
        }
        return true
    }
    @objc func handleSwipe(sender: UISwipeGestureRecognizer) {
        tileMoved = false;
        if sender.state == .ended {
            switch sender.direction {
            case.right:  moveRight();
            case.left:  moveLeft();
            case.up:  moveUp();
            case.down:  moveDown();
            default:
                break
            }
            controller!.scoreLabel.text = String(score);
            if tileMoved {
                spawnTile();
                print(score);
                
            }
            if (isGameOver()) {
                controller?.gameOver();
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
