//
//  GameScene.swift
//  ShootingGame
//
//  Created by 조영민 on 2022/07/04.
//
// 모든것은 Node로 움직인다.
import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var player: SKSpriteNode?
    
    override func didMove(to view: SKView) {
        self.backgroundColor = .black
        physicsWorld.contactDelegate = self
    }
    
    func playerAirplane() {
        guard let player = SKSpriteNode(fileNamed: "airplane")
        else {
            return
        }
        player.size = CGSize(
            width: self.size.width / 10,
            height: self.size.height / 5
        )
        player.position = CGPoint(x: self.frame.minX + 40, y: self.frame.midY)
        player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
        player.physicsBody?.affectedByGravity = false
        player.physicsBody?.categoryBitMask = UInt32(1)
        player.physicsBody?.contactTestBitMask = UInt32(3)
        player.physicsBody?.allowsRotation = false
        player.physicsBody?.isDynamic = false
        player.name = "PlayerNode"
        self.player = player
        self.addChild(self.player!)
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
        // Called before each frame is rendered
    }
}

extension GameScene: SKPhysicsContactDelegate {
    
}
