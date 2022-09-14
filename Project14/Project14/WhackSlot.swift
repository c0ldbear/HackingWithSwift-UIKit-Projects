//
//  WhackSlot.swift
//  Project14
//
//  Created by teddy on 2022-09-14.
//

import SpriteKit
import UIKit

class WhackSlot: SKNode {
    // No init() => Use parent init()
    
    func configurate(at position: CGPoint) {
        self.position = position
        
        let sprite = SKSpriteNode(imageNamed: "whackHole")
        addChild(sprite)
    }
}
