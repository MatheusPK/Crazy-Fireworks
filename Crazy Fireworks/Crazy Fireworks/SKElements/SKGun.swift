//
//  SKGun.swift
//  DodgeGame
//
//  Created by Matheus Kulick on 25/09/20.
//  Copyright © 2020 Matheus Kulick. All rights reserved.
//

import SpriteKit

class SKGun: SKSpriteNode {
    
    let gunTexture = SKTexture(imageNamed: "gun.png")
    
    init(gunRadius: CGFloat, gunThickness: CGFloat) {
        super.init(texture: gunTexture, color: .blue, size: CGSize(width: gunThickness, height: gunRadius))
        self.anchorPoint = CGPoint(x: 0.5, y: 0)
        self.zPosition = 1
        
    }
    
    func calculateRotation(gunRotationSpeed: CGFloat) {
        self.zRotation += gunRotationSpeed
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

