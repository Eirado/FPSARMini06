//
//  DamageFlashShader.metal
//  FPSARMini06
//
//  Created by Luiz Felipe on 07/08/24.
//

#include <metal_stdlib>
using namespace metal;

struct VertexOut {
    float4 position [[position]];
    float2 uv;
};

vertex VertexOut vertex_main(uint vertexID [[vertex_id]]) {
    float4 positions[4] = {
        float4(-1.0, -1.0, 0.0, 1.0),
        float4( 1.0, -1.0, 0.0, 1.0),
        float4(-1.0,  1.0, 0.0, 1.0),
        float4( 1.0,  1.0, 0.0, 1.0)
    };
    
    VertexOut out;
    out.position = positions[vertexID];
    out.uv = (positions[vertexID].xy + float2(1.0, 1.0)) * 0.5;
    return out;
}

fragment half4 fragment_main(VertexOut in [[stage_in]], constant float &opacity [[buffer(0)]]) {
    float4 color = float4(1.0, 0.0, 0.0, opacity);
    return half4(color);
}
