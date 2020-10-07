//
//  SKExtensions.swift
//  Crazy Fireworks
//
//  Created by Matheus Kulick on 21/09/20.
//  Copyright © 2020 Matheus Kulick. All rights reserved.
//

import SpriteKit

extension CGVector {
    
    var module: CGFloat {
        return sqrt(pow(self.dx, 2) + pow(self.dy, 2))
    }
    
    var unitary: CGVector {
        let myModule = self.module
        return CGVector(dx: self.dx/myModule, dy: self.dy/myModule)
    }
}
