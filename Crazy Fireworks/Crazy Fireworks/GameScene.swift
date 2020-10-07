//
//  GameScene.swift
//  Crazy Fireworks
//
//  Created by Matheus Kulick on 10/09/20.
//  Copyright © 2020 Matheus Kulick. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    
    
    var npc = SKCharacter()
    let board = SKField(color: .red, thickness: 5)
    
    override func didMove(to view: SKView) {
        
        physicsWorld.contactDelegate = self
        scrollableBackground(image: "background.jpg")
        self.addChild(board)
        self.addChild(npc)
    }
    
    override func update(_ currentTime: TimeInterval) {
        self.npc.characterAim.calculatePath()
        self.npc.characterGun.calculateRotation(gunRotationSpeed: self.npc.characterAim.aimSpeed)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let _ = touches.first {
            self.npc.shoot()
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        guard let bullet = (contact.bodyA.node as? SKBullet) ?? (contact.bodyB.node as? SKBullet) else {return}
            
        bullet.physicsBody?.restitution = CGFloat.random(in: 0.75...1.25)
        if (bullet.numCollisionLeft == 0) {
            addParticle(particle: bullet.dead()!)
            bullet.removeFromParent()
        }
        else {
            bullet.numCollisionLeft -= 1
        }
    }
    
    func addParticle(particle: SKEmitterNode!) {
        let addEmitterAction = SKAction.run({self.addChild(particle)})
        let emitterDuration = CGFloat(particle.particleLifetime)
        let wait = SKAction.wait(forDuration: TimeInterval(emitterDuration))
        let remove = SKAction.run({particle.removeFromParent()})
        let sequence = SKAction.sequence([addEmitterAction, wait, remove])
        self.run(sequence)
    }
    
    func scrollableBackground(image: String) {
        var parallax = SKSpriteNode()
        let movF = SKAction.move(by: CGVector(dx: -frame.width, dy: 0), duration: TimeInterval(frame.width/200))
        let resetF = SKAction.move(by: CGVector(dx: frame.width, dy: 0), duration: 0)
        let repF = SKAction.repeatForever(SKAction.sequence([movF, resetF]))
        var i: CGFloat = 0
        while i < 2 {
            parallax = SKSpriteNode(imageNamed: image)
            parallax.position.x = frame.width * i
            parallax.size.width = frame.width
            parallax.size.height = frame.height
            parallax.zPosition = -1
            parallax.run(repF)
            self.addChild(parallax)
            i += 1
        }
    }
}
