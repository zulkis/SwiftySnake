//
//  GameScene.swift
//  SwiftySnake
//
//  Created by Alexey Minaev on 29/03/16.
//  Copyright (c) 2016 Alexey Minaev. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var dummySprite : SKSpriteNode!
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        let sprite = SKSpriteNode(imageNamed:"Spaceship")
        sprite.color = SKColor.redColor()
        sprite.position = CGPoint(x: 0, y: self.frame.size.height/2)
        sprite.setScale(0.5)
        sprite.zRotation = CGFloat(-90.0 * M_PI/180.0)
        
        self.dummySprite = sprite
        
        self.addChild(sprite)
    }
    
    var lastUpdateTimeInterval: CFTimeInterval = 0
    
    override func update(currentTime: CFTimeInterval) {
        // Handle time delta.
        // If we drop below 60fps, we still want everything to move the same distance.
        var timeSinceLast = currentTime - self.lastUpdateTimeInterval
        self.lastUpdateTimeInterval = currentTime
        if (timeSinceLast > 1) { // more than a second since last update
            timeSinceLast = 1.0 / 60.0
            self.lastUpdateTimeInterval = currentTime
        }
        
        updateWithTimeSinceLastUpdate(timeSinceLast)
    }
    
    /*
        This method will be called every frame iteration of scene-specific updates
    */
    func updateWithTimeSinceLastUpdate(dt: CFTimeInterval) {
        // Lets move our dummy plane
        let velocity = 100.0 // pts/sec
        
        let lastPositionX : Double = Double(self.dummySprite.position.x)
        let lastPositionY : Double = Double(self.dummySprite.position.y)
        self.dummySprite.position = CGPoint(x: lastPositionX + velocity*dt, y: lastPositionY)
    }
}
