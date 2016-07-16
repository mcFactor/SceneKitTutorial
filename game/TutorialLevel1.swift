//
//  TutorialLevel1.swift
//
//  Part of the SceneKit Tutorial Series: From Zero to Hero at:
//  http://www.rogerboesch.com:2368/scenekit-tutorial-series-from-zero-to-hero/
//
//  Created by Roger Boesch on 12/07/16.
//  Copyright © 2016 Roger Boesch. All rights reserved.
//
//  Feel free to use this code in every way you want, but please consider also
//  to give esomething back to the community.
//
//  I don't own the license rights for the assets used in this tutorials
//  So before you use for something else then self-learning, please check by yourself the license behind
//  or even better replace it with your own art. Thank you!
//

import UIKit
import SceneKit

// -----------------------------------------------------------------------------

class TutorialLevel1: SCNScene, SCNSceneRendererDelegate, SCNPhysicsContactDelegate {
    private let levelWidth = 320
    private let levelLength = 320
    
    private var _terrain: RBTerrain?
    private var _player: Player?

    // -------------------------------------------------------------------------
    // MARK: - Place objects

    private func addPlayer() {
        _player = Player()
        _player!.position = SCNVector3(160, 3, 0)
        self.rootNode.addChildNode(_player!)

        let moveAction = SCNAction.moveBy(x: 0, y: 0, z: 200, duration: 20)
        _player!.run(moveAction)
    }

    // -------------------------------------------------------------------------

    private func addTerrain() {
        // Create terrain
        _terrain = RBTerrain(width: levelWidth, length: levelLength, scale: 128)

        let generator = RBPerlinNoiseGenerator(seed: nil)
        _terrain?.formula = {(x: Int32, y: Int32) in
            return generator.valueFor(x: x, y: y)
        }

        _terrain!.create(withColor: UIColor.green())
        _terrain!.position = SCNVector3Make(0, 0, 0)
        self.rootNode.addChildNode(_terrain!)
    }

    // -------------------------------------------------------------------------
    // MARK: - Initialisation
    
    func create() {
        addTerrain()
        addPlayer()
    }
    
    // -------------------------------------------------------------------------
    
    override init() {
        super.init()
    }
    
    // -------------------------------------------------------------------------
    
    required init(coder: NSCoder) {
        fatalError("Not yet implemented")
    }
    
    // -------------------------------------------------------------------------
    
}
