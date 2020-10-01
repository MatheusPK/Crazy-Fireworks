//
//  SKField.swift
//  DodgeGame
//
//  Created by Matheus Kulick on 16/09/20.
//  Copyright © 2020 Matheus Kulick. All rights reserved.
//

import SpriteKit

class SKField: SKShapeNode {
    init(color: UIColor, thickness: CGFloat) {
        super.init()
        self.isUserInteractionEnabled = false
        let myPath = CGMutablePath()
        let height = UIScreen.main.bounds.height
        let width = UIScreen.main.bounds.width
        
        let bottomBoard = [
            CGPoint(x: -width/2, y: -height/2),
            CGPoint(x: -width/2, y: -height/2 + thickness),
            CGPoint(x: width/2, y: -height/2 + thickness),
            CGPoint(x: width/2, y: -height/2)
        ]
        
        let topBoard = [
            CGPoint(x: -width/2, y:height/2),
            CGPoint(x: -width/2, y:height/2 - thickness),
            CGPoint(x: width/2, y:height/2 - thickness),
            CGPoint(x: width/2, y:height/2)
        ]
        
        let rightBoard = [
            CGPoint(x: width/2, y: -height/2 + thickness),
            CGPoint(x: width/2 - thickness, y: -height/2 + thickness),
            CGPoint(x: width/2 - thickness, y: height/2 - thickness),
            CGPoint(x: width/2, y:height/2 - thickness)
        ]
        
        let leftBoard = [
            CGPoint(x: -width/2, y: -height/2 + thickness),
            CGPoint(x: -width/2 + thickness, y: -height/2 + thickness),
            CGPoint(x: -width/2 + thickness, y:height/2 - thickness),
            CGPoint(x: -width/2, y:height/2 - thickness)
        ]
        
        myPath.addLines(between: bottomBoard)
        myPath.closeSubpath()
        myPath.addLines(between: topBoard)
        myPath.closeSubpath()
        myPath.addLines(between: rightBoard)
        myPath.closeSubpath()
        myPath.addLines(between: leftBoard)
        myPath.closeSubpath()
        self.path = myPath
        self.fillColor = color
        self.strokeColor = color
        self.physicsBody = SKPhysicsBody(bodies: [physicsBodyFrom(bottomBoard), physicsBodyFrom(topBoard), physicsBodyFrom(rightBoard), physicsBodyFrom(leftBoard)])
        
        self.physicsBody?.categoryBitMask = Category.field
        self.physicsBody?.collisionBitMask = Category.bullet
        self.physicsBody?.contactTestBitMask = Category.allBut(Category.field)
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.pinned = true
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.density = CGFloat.greatestFiniteMagnitude
        self.physicsBody?.usesPreciseCollisionDetection = true
        self.physicsBody?.isDynamic = false
        self.isHidden = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func physicsBodyFrom(_ coordenates:[CGPoint])->SKPhysicsBody {
        let physicsBodyPath = CGMutablePath()
        physicsBodyPath.addLines(between: coordenates)
        let physicsBody = SKPhysicsBody(polygonFrom: physicsBodyPath)
        self.physicsBody?.categoryBitMask = Category.field
        self.physicsBody?.collisionBitMask = Category.bullet
        self.physicsBody?.contactTestBitMask = Category.allBut(Category.field)
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.pinned = true
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.density = CGFloat.greatestFiniteMagnitude
        self.physicsBody?.usesPreciseCollisionDetection = true
        //        self.physicsBody?.isDynamic = false
        return physicsBody
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("to no field")
    }
    
}
