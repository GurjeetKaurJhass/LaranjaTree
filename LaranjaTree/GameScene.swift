//
//  GameScene.swift
//  LaranjaTree
//
//  Created by Gurjeet kaur on 2019-10-11.
//  Copyright © 2019 The Lambton. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene,SKPhysicsContactDelegate {
    
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        }
    override func update(_ currentTime: TimeInterval) {
    
    }
    
    
    func didBegin(_ contact: SKPhysicsContact) {
            print("collision occured")
            
            let nodeA = contact.bodyA.node
            let nodeB = contact.bodyB.node
            
            if (nodeA == nil || nodeB == nil) {
                return
            }
            
            print("COLLISION DETECTED")
            print("Sprite 1: \(nodeA!.name)")
            print("Sprite 2: \(nodeB!.name)")
            print("------")
            
    //        if (nodeA!.name == "player" && nodeB!.name == "enemy") {
    //            // player die
    //            print("RESETTING POSITION-AAAA")
    //            restartPlayer()
    //        }
            
            
        }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
             print("Touched the screen")
             
             // GET THE POSITION WHERE THE MOUSE WAS CLICKED
             // ---------------------------------------------
             let mouseTouch = touches.first
             if (mouseTouch == nil) {
                 return
             }
             let location = mouseTouch!.location(in: self)
            let mouseXPosition = location.x
            let mouseYPosition = location.y
             
           // 1. make an orange
           let orange = SKSpriteNode(imageNamed: "Orange")
           // 2. Position the orange on the scren
           orange.position.x = mouseXPosition
           orange.position.y = mouseYPosition
            // 3. show the orange on screen
           addChild(orange)
        
        // ADD PHYSICS TO THE ORANGE
               // ---------------------------
              // 1. Give the orange a physics body
                 orange.physicsBody = SKPhysicsBody(circleOfRadius: orange.size.width / 2)
               // 2. Set gravity / dynamic for the orange
                orange.physicsBody?.affectedByGravity = false
         }
    
   
  
}
