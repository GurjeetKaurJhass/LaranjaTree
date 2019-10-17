//
//  GameScene.swift
//  LaranjaTree
//
//  Created by Gurjeet kaur o self.ground = self.childNode(withName: "ground") as! SKSpriteNode

      
//  Copyright © 2019 The Lambton. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene,SKPhysicsContactDelegate {
    var ground:SKSpriteNode!
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        self.ground = self.childNode(withName: "ground") as! SKSpriteNode
        
              self.ground.physicsBody = SKPhysicsBody(rectangleOf: ground.size)
               self.ground.physicsBody?.affectedByGravity = false
               self.ground.physicsBody?.categoryBitMask = 32
               self.ground.physicsBody?.collisionBitMask = 0
               self.ground.physicsBody?.contactTestBitMask = 0
    
        
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
             
              // detect what sprite was touched
                let nodeTouched = atPoint(location).name
                 if (nodeTouched == "tree") {

                  spawnOrange(x:mouseXPosition, y:  mouseYPosition)
                }
       
            }
    
   func spawnOrange(x: CGFloat, y: CGFloat)
   {
       // 1. make an orange
         let orange = SKSpriteNode(imageNamed: "Orange")
         //2. Position the orange on the scren
        orange.position.x = x
        orange.position.y = y
        // 3. show the orange on screen
         addChild(orange)
         orange.zPosition = 999

          // ADD PHYSICS TO THE ORANGE
          // ---------------------------
          // 1. Give the orange a physics body
             orange.physicsBody = SKPhysicsBody(circleOfRadius: orange.size.width / 2)
           // 2. Set gravity / dynamic for the orange
            orange.physicsBody?.affectedByGravity = false
           // 2. Give orange gravity. By default, orange is affected by gravity.
            // orange.physicsBody?.affectedByGravity = true
           // 3. Set category, collision, and contact bit masks
           //  - By default, collison = everything, contact = 0
            orange.physicsBody?.categoryBitMask = 1
           orange.physicsBody?.contactTestBitMask = 0
       //spawnOrange(x: mouseXPosition, y: mouseYPosition)
    let throwOrangeAction = SKAction.applyImpulse(
                CGVector(dx: 100, dy: 100),
               duration: 0.5)
            orange.run(throwOrangeAction)
    
    
    
   }
  
}
