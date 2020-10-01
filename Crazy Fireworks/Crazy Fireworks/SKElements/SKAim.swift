//
//  Aim.swift
//  DodgeGame
//
//  Created by Matheus Kulick on 21/09/20.
//  Copyright © 2020 Matheus Kulick. All rights reserved.
//

import SpriteKit

class SKAim: SKShapeNode {
    
    var ang: CGFloat = CGFloat.pi/2
    var raio: CGFloat!
    var direcao: CGVector!
    var bulletSpawn: CGPoint!
    var aimSpeed: CGFloat = 0.05
    
    init(color: UIColor, thickness: CGFloat, raio: CGFloat) {
        super.init()
        self.isUserInteractionEnabled = false
        self.lineWidth = thickness
        self.zPosition = 0
        self.raio = raio
        calculatePath()
        self.isHidden = true
    }
    
    func calculatePath() {
        let newPath = CGMutablePath();
        let xBullet = self.parent?.position.x ?? 0
        let yBullet = self.parent?.position.y ?? 0
        let point0 = self.position // centro do personagem onde SKAim e posicionado originalmente
        let point1 = CGPoint(x: point0.x + cos(self.ang) * self.raio, y: point0.y + sin(self.ang) * self.raio)
        
        self.bulletSpawn = CGPoint(x: xBullet + cos(self.ang)*self.raio, y: yBullet + sin(self.ang)*self.raio)
        newPath.addLines(between: [point0, point1])
        self.path = newPath
        self.ang += self.aimSpeed
        self.direcao = CGVector(dx: point1.x - point0.x, dy: point1.y - point0.y).unitary
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
