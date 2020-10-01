//
//  SKBullet2.swift
//  DodgeGame
//
//  Created by Matheus Kulick on 25/09/20.
//  Copyright © 2020 Matheus Kulick. All rights reserved.
//

import SpriteKit

class SKBullet: SKSpriteNode {
    
    var numCollisionLeft:Int = 10
    
    let bulletTexture = SKTexture(imageNamed: "bullet2.png")
    
    init() {
        super.init(texture: bulletTexture, color: .white, size: bulletTexture.size())
        self.isUserInteractionEnabled = false
        self.physicsBody = SKPhysicsBody(circleOfRadius: self.size.height/2)
        self.physicsBody?.categoryBitMask = Category.bullet
        self.physicsBody?.collisionBitMask = Category.all
        self.physicsBody?.contactTestBitMask = Category.all
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = true
        self.physicsBody?.restitution = 1
        self.physicsBody?.allowsRotation = true
        self.physicsBody?.friction = 0
        self.physicsBody?.linearDamping = 0
        self.physicsBody?.angularDamping = 0
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func dead() -> SKEmitterNode? {
        let myParticle: SKEmitterNode = SKEmitterNode(fileNamed: "spark.sks")!
        myParticle.numParticlesToEmit = .random(in: 0...200)
        myParticle.particleColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
        myParticle.position = self.position
        myParticle.particleLifetime = 1
        return myParticle
    }
    
}

