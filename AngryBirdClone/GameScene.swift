//
//  GameScene.swift
//  AngryBirdClone
//
//  Created by Hamit Seyrek on 6.02.2022.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    //MARK: - Variables
    var bird = SKSpriteNode()
    var box1 = SKSpriteNode()
    var box2 = SKSpriteNode()
    var box3 = SKSpriteNode()
    var box4 = SKSpriteNode()
    var box5 = SKSpriteNode()
    var gameStarted = false
    var originalPosition : CGPoint?
    
    override func didMove(to view: SKView) {
        
        /*
         // MARK: - Create an object with code
         let texture = SKTexture(imageNamed: "bird")
         bird = SKSpriteNode(texture: texture)
         bird.position = CGPoint(x: -self.frame.width / 5, y: 0)
         bird.size = CGSize(width: self.frame.width / 16, height: self.frame.height / 10)
         bird.zPosition = 1
         self.addChild(bird)
         */
        
        // set frame physics body
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        self.scene?.scaleMode = .aspectFit
        
        //make bird physics body
        bird = childNode(withName: "bird") as! SKSpriteNode
        let birdTexture = SKTexture(imageNamed: "bird")
        bird.physicsBody = SKPhysicsBody(circleOfRadius: birdTexture.size().height / 14)
        bird.physicsBody?.affectedByGravity = false
        bird.physicsBody?.isDynamic = true
        bird.physicsBody?.mass = 0.2
        originalPosition = bird.position
        
        // define size and texture for bricks
        let boxTexture = SKTexture(imageNamed: "brick")
        let boxSize = CGSize(width: boxTexture.size().width / 6.5, height: boxTexture.size().height / 6.5)
        
        // make box1 physics body
        box1 = childNode(withName: "box1") as! SKSpriteNode
        box1.physicsBody = SKPhysicsBody(rectangleOf: boxSize)
        box1.physicsBody?.affectedByGravity = true
        box1.physicsBody?.allowsRotation = true
        box1.physicsBody?.isDynamic = true
        box1 .physicsBody?.mass = 0.1
        
        // make box2 physics body
        box2 = childNode(withName: "box2") as! SKSpriteNode
        box2.physicsBody = SKPhysicsBody(rectangleOf: boxSize)
        box2.physicsBody?.affectedByGravity = true
        box2.physicsBody?.allowsRotation = true
        box2.physicsBody?.isDynamic = true
        box2 .physicsBody?.mass = 0.3
        
        // make box3 physics body
        box3 = childNode(withName: "box3") as! SKSpriteNode
        box3.physicsBody = SKPhysicsBody(rectangleOf: boxSize)
        box3.physicsBody?.affectedByGravity = true
        box3.physicsBody?.allowsRotation = true
        box3.physicsBody?.isDynamic = true
        box3 .physicsBody?.mass = 0.3
        
        // make box4 physics body
        box4 = childNode(withName: "box4") as! SKSpriteNode
        box4.physicsBody = SKPhysicsBody(rectangleOf: boxSize)
        box4.physicsBody?.affectedByGravity = true
        box4.physicsBody?.allowsRotation = true
        box4.physicsBody?.isDynamic = true
        box4 .physicsBody?.mass = 0.3
        
        // make box5 physics body
        box5 = childNode(withName: "box5") as! SKSpriteNode
        box5.physicsBody = SKPhysicsBody(rectangleOf: boxSize)
        box5.physicsBody?.affectedByGravity = true
        box5.physicsBody?.allowsRotation = true
        box5.physicsBody?.isDynamic = true
        box5.physicsBody?.mass = 0.3
    }
    
    
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        startGame(touches: touches)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        startGame(touches: touches)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        startGame(touches: touches, isTouchesEnded: true)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // reset game when bird stop
        if let birdPhysicsBody = bird.physicsBody {
            if birdPhysicsBody.velocity.dx <= 0.1 && birdPhysicsBody.velocity.dy <= 0.1 && birdPhysicsBody.angularVelocity <= 0.1 && gameStarted == true {
                bird.physicsBody?.affectedByGravity = false
                bird.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
                bird.physicsBody?.angularVelocity = 0
                bird.position = originalPosition!
                gameStarted = false
            }
        }
    }
    
    //MARK: - Special Fuchtions
    //get and move node in touch point that is bird
    func startGame(touches : Set<UITouch>, isTouchesEnded : Bool = false) {
        if gameStarted == false {
            if let touch = touches.first {
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)
                if touchNodes.isEmpty == false {
                    for node in touchNodes {
                        if let sprite = node as? SKSpriteNode {
                            if sprite == bird {
                                // is touches ended?
                                if isTouchesEnded == true {
                                    let dx = touchLocation.x - originalPosition!.x
                                    let dy = touchLocation.y - originalPosition!.y
                                    
                                    let impulse = CGVector(dx: -dx, dy: -dy)
                                    bird.physicsBody?.applyImpulse(impulse)
                                    bird.physicsBody?.affectedByGravity = true
                                    
                                    gameStarted = true
                                } else {
                                    bird.position = touchLocation
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
}

