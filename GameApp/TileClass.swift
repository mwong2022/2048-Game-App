//
//  TileClass.swift
//  GameApp
//
//  Created by Mason Wong on 5/2/19.
//  Copyright © 2019 Mason Wong. All rights reserved.
import SpriteKit
import GameplayKit
import Foundation
class Tile {
    static let blank = SKTexture(imageNamed: "backgroundImage");
    static let two = SKTexture(imageNamed: "two");
    static let four = SKTexture(imageNamed: "four");
    static let eight = SKTexture(imageNamed: "eight");
    static let sixteen = SKTexture(imageNamed: "sixteen");
    static let thirtyTwo = SKTexture(imageNamed: "thirtyTwo");
    static let sixtyFour = SKTexture(imageNamed: "sixtyFour");
    static let oneTwentyEight = SKTexture(imageNamed: "oneTwentyEight");
    static let twoFiftySix = SKTexture(imageNamed: "twoFiftySix");
    static let fiveTwelve = SKTexture(imageNamed: "fiveTwelve");
    static let tenTwentyFour = SKTexture(imageNamed: "tenTwentyFour");
    static let twentyFortyEight = SKTexture(imageNamed: "twentyFortyEight");
    static let fortyNinetySix = SKTexture(imageNamed: "fortyNinetySix");
    var sprite : SKSpriteNode
    var count = 0;
    
    func setCount(newCount: Int) {
        count = newCount
        if newCount == 0 {
            sprite.texture = Tile.blank
        }else if newCount == 2 {
            sprite.texture = Tile.two;
        } else if newCount == 4 {
            sprite.texture = Tile.four;
        } else if newCount == 8 {
            sprite.texture = Tile.eight;
        } else if newCount == 16 {
            sprite.texture = Tile.sixteen;
        } else if newCount == 32 {
            sprite.texture = Tile.thirtyTwo;
        } else if newCount == 64 {
            sprite.texture = Tile.sixtyFour;
        } else if newCount == 128 {
            sprite.texture = Tile.oneTwentyEight;
        } else if newCount == 256 {
            sprite.texture = Tile.twoFiftySix;
        } else if newCount == 512 {
            sprite.texture = Tile.fiveTwelve;
        } else if newCount == 1024 {
            sprite.texture = Tile.tenTwentyFour;
        }  else if newCount == 2048 {
            sprite.texture = Tile.twentyFortyEight;
        } else if newCount == 4096 {
            sprite.texture = Tile.fortyNinetySix;
        }
    }
    init() {
        sprite = SKSpriteNode(texture: Tile.blank);
        sprite.size = CGSize(width: 110, height: 100)
    }
}
