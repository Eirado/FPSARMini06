//
//  LoadModels.swift
//  FPSARMini06
//
//  Created by Gabriel Eirado on 05/08/24.
//

import RealityKit
import Combine


extension Entity {
    static func loadModelAsync() -> Publishers.Map<Publishers.Collect<Publishers.MergeMany<Publishers.Map<LoadRequest<ModelEntity>, (AnimationAssets, ModelEntity)>>>, [AnimationAssets: ModelEntity]> {
        
        let anims = AnimationAssets.allCases.map { anim in Entity.loadModelAsync(named: anim.assetName).map { (anim, $0) } }
        return Publishers.MergeMany(anims).collect().map { [AnimationAssets: ModelEntity](uniqueKeysWithValues: $0) }
        
    }
    
    enum AnimationAssets: String, CaseIterable, Hashable {
        case diver_anim_stand_idle
        case diver_anim_walk
        case diver_anim_jumpdown_whole_noroot

        var assetName: String { "frogDrone.usdz" }
    }
}

