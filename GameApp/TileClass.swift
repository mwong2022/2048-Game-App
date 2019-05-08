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
    
    init() {
        sprite = SKSpriteNode(texture: Tile.blank);
        sprite.size = CGSize(width: 55, height: 50)
    }
}
