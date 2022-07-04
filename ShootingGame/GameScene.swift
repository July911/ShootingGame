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
    private var cloud: SKSpriteNode?
    
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
    
    func spawnBullet() {
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
        bullet.physicsBody?.categoryBitMask = UInt32(1)
        bullet.physicsBody?.contactTestBitMask = UInt32(2)
        bullet.physicsBody?.allowsRotation = false
        bullet.physicsBody?.isDynamic = true
        bullet.name = "BulletNode"
        bullet.zPosition = -1
        self.bullet = bullet
        
        self.moveBulletToRight()
        self.addChild(self.bullet!)
    }
    
    func spawnCloud() {
        guard let cloud = SKSpriteNode(fileNamed: "cloud")
        else {
            return
        }
        cloud.size = CGSize(
            width: self.size.width / 10,
            height: self.size.height / 5
        )
        //TODO: 수정 필요 
        cloud.position = CGPoint(
            x: self.frame.minX + 40,
            y: self.frame.midY
        )
        cloud.physicsBody = SKPhysicsBody(rectangleOf: cloud.size)
        cloud.physicsBody?.affectedByGravity = false
        cloud.physicsBody?.categoryBitMask = UInt32(2)
        cloud.physicsBody?.contactTestBitMask = UInt32(1)
        cloud.physicsBody?.allowsRotation = false
        cloud.physicsBody?.isDynamic = false
        cloud.name = "PlayerNode"
        self.cloud = cloud
        self.addChild(self.cloud!)
    }
    
    private func resetGame() {
        self.isAlive = true
        self.score = 0
    }
    
    private func moveBulletToRight() {
        let moveForward = SKAction.moveTo(
            x: 600,
            duration: 0.6
        )
        let destroy = SKAction.removeFromParent()
        
        bullet?.run(SKAction.sequence([moveForward, destroy]))
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
