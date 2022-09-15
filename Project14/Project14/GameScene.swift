//
//  GameScene.swift
//  Project14
//
//  Created by teddy on 2022-09-14.
//

import SpriteKit

class GameScene: SKScene {
    var slots = [WhackSlot]()
    
    var popupTime = 0.85
    
    var gameScore: SKLabelNode!
    var score: Int = 0 {
        didSet {
            gameScore.text = "Score: \(score)"
        }
    }
    
    var numRounds = 0
    
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
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.createEnemey()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        let location = touch.location(in: self)
        let tappedNodes = nodes(at: location)
        
        for node in tappedNodes {
            guard let whackSlot = node.parent?.parent as? WhackSlot else { continue }
            if !whackSlot.isVisible { continue }
            if whackSlot.isHit { continue }
            
            whackSlot.hit()
            if node.name == "charFriend" {
                score -= 5
                
                run(SKAction.playSoundFileNamed("whackBad.caf", waitForCompletion: false))
            } else if node.name == "charEnemy" {
                whackSlot.charNode.xScale = 0.85
                whackSlot.charNode.yScale = 0.85
                score += 1
                
                run(SKAction.playSoundFileNamed("whack.caf", waitForCompletion: false))
                
            }
        }
    }
    
    func createSlot(at position: CGPoint) {
        let whackSlot = WhackSlot()
        whackSlot.configurate(at: position)
        slots.append(whackSlot)
        addChild(whackSlot)
    }
    
    func createEnemey() {
        numRounds += 1
        if numRounds > 30 {
            for slot in slots {
                slot.hide()
            }
            
            let gameOver = SKSpriteNode(imageNamed: "gameOver")
            gameOver.position = CGPoint(x: 512, y: 384)
            gameOver.zPosition = 1
            addChild(gameOver)
            
            let finalScoreLabel = SKLabelNode(text: "Final score: \(score)")
            finalScoreLabel.fontName = "HelveticaNeue-Bold"
            finalScoreLabel.fontSize = 48
            finalScoreLabel.horizontalAlignmentMode = .center
            finalScoreLabel.position = CGPoint(x: 512, y: 300)
            finalScoreLabel.zPosition = 1
            addChild(finalScoreLabel)
            
            return
        }
        
        popupTime *= 0.991
        
        slots.shuffle()
        slots[0].show(hideTime: popupTime)
        
        if Int.random(in: 0...12) > 4 { slots[1].show(hideTime: popupTime) }
        if Int.random(in: 0...12) > 8 { slots[2].show(hideTime: popupTime) }
        if Int.random(in: 0...12) > 10 { slots[3].show(hideTime: popupTime) }
        if Int.random(in: 0...12) > 12 { slots[4].show(hideTime: popupTime) }
        
        let minDelay = popupTime / 2
        let maxDelay = popupTime * 2
        let delay = Double.random(in: minDelay...maxDelay)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.createEnemey()
        }
    }
}
