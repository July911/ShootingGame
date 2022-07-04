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
    private var bullet: SKSpriteNode?
    private var enemy: SKSpriteNode?
    
    private var touchLocation: CGPoint?
    private var isAlive = true
    private var score = 0
    
    override func didMove(to view: SKView) {
        self.configureSceneSetting()
    }
    
    func configurePlayerAirplane() {
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
        player.physicsBody?.categoryBitMask = UInt32(0)
        player.physicsBody?.contactTestBitMask = UInt32(2)
        player.physicsBody?.allowsRotation = false
        player.physicsBody?.isDynamic = false
        player.name = "PlayerNode"
        self.player = player
        self.addChild(self.player!)
    }
    
    func configureBullet() {
        guard let bullet = SKSpriteNode(fileNamed: "arror") else {
            return
        }
        bullet.size = CGSize(
            width: self.size.width / 20,
            height: self.size.height / 10
        )
        bullet.position = CGPoint(
            x: self.player?.position.x ?? .zero,
            y: self.player?.position.y ?? .zero
        )
        bullet.physicsBody = SKPhysicsBody(rectangleOf: bullet.size)
        bullet.physicsBody?.affectedByGravity = false
        bullet.physicsBody?.categoryBitMask = UInt32(0)
        bullet.physicsBody?.contactTestBitMask = UInt32(2)
        bullet.physicsBody?.allowsRotation = false
        bullet.physicsBody?.isDynamic = false
        bullet.name = "BulletNode"
        self.bullet = bullet
        self.addChild(self.bullet!)
    }
    
    func resetGame() {
        self.isAlive = true
        self.score = 0
    }
    
    func touchDown(atPoint pos : CGPoint) {
       
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let player = player else {
            return
        }

        for touch in touches {
            self.touchLocation = touch.location(in: player)
            movePlayerOnTouch()
        }
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
    
    private func configureSceneSetting() {
        self.backgroundColor = .black
        physicsWorld.contactDelegate = self
    }
    
    private func movePlayerOnTouch() {
        self.player?.position.y = self.touchLocation?.y
    }
}

extension GameScene: SKPhysicsContactDelegate {
    
}
