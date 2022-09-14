//
//  GameScene.swift
//  Project14
//
//  Created by teddy on 2022-09-14.
//

import SpriteKit

class GameScene: SKScene {
    var slots = [WhackSlot]()
    
    var gameScore: SKLabelNode!
    var score: Int = 0 {
        didSet {
            gameScore.text = "Score: \(score)"
        }
    }
    
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "whackBackground")
        background.position = CGPoint(x: 512, y: 384)
        background.blendMode = .replace
        background.zPosition = -1
        addChild(background)
        
        gameScore = SKLabelNode(fontNamed: "Chalkduster")
        gameScore.text = "Score: 0"
        gameScore.position = CGPoint(x: 8, y: 8)
        gameScore.horizontalAlignmentMode = .left
        gameScore.fontSize = 48
        addChild(gameScore)
        
        // Rows 1 and 3
        for i in 0..<5 {
            createSlot(at: CGPoint(x: 100 + (i * 170), y: 410))
            createSlot(at: CGPoint(x: 100 + (i * 170), y: 230))
        }
        // Rows 2 and 4
        for i in 0..<4 {
            createSlot(at: CGPoint(x: 180 + (i * 170) , y: 320))
            createSlot(at: CGPoint(x: 180 + (i * 170) , y: 140))
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    func createSlot(at position: CGPoint) {
        let whackSlot = WhackSlot()
        whackSlot.configurate(at: position)
        slots.append(whackSlot)
        addChild(whackSlot)
    }
}
