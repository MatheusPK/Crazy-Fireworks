//
//  SKCharacter.swift
//  Crazy Fireworks
//
//  Created by Matheus Kulick on 10/09/20.
//  Copyright © 2020 Matheus Kulick. All rights reserved.
//

import SpriteKit

class SKCharacter:SKSpriteNode {
    
    var characterAim: SKAim!
    var characterGun: SKGun!
    let myTexture = SKTexture(imageNamed: "character2.png")
    
    init() {
        super.init(texture: self.myTexture, color: .white, size: CGSize(width: 40, height: 50))
        self.isUserInteractionEnabled = true
        self.physicsBody = SKPhysicsBody(rectangleOf: self.size)
        self.physicsBody?.categoryBitMask = Category.character
        self.physicsBody?.collisionBitMask = Category.field
        self.physicsBody?.affectedByGravity = false
        self.characterGun = SKGun(gunRadius: self.size.height, gunThickness: 10)
        self.characterAim = SKAim(color: .yellow, thickness: 10, raio: self.size.height)
        self.addChild(self.characterAim)
        self.addChild(self.characterGun)

        
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let parent = self.scene else {return}
        let touch = touches.first!
        let myLocation = touch.location(in: parent)
        let action = SKAction.move(to: myLocation, duration: 0.01)
        self.run(action)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    func shoot() {

        let bullet = SKBullet()
        bullet.position = self.characterAim.bulletSpawn
        self.parent?.addChild(bullet)
        let impulse = CGVector(dx: self.characterAim.direcao.dx * 10, dy: self.characterAim.direcao.dy * 10)
        bullet.physicsBody?.applyImpulse(impulse)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
