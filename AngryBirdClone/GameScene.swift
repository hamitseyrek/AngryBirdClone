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
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
