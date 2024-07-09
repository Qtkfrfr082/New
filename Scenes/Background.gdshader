shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture;
uniform float curvature : hint_range(0.0, 1.0) = 0.1;
uniform float scanline_intensity : hint_range(0.0, 1.0) = 0.5;
uniform float vignette_intensity : hint_range(0.0, 1.0) = 0.1;
uniform vec2 resolution = vec2(1024.0, 768.0);
uniform float time;
uniform float noise_intensity : hint_range(0.0, 1.0) = 0.2;
uniform float zigzag_frequency : hint_range(0.0, 50.0) = 10.0;

float rand(vec2 co) {
    return fract(sin(dot(co.xy, vec2(12.9898, 78.233))) * 43758.5453);
}

void fragment() {
    vec2 uv = FRAGCOORD.xy / resolution.xy;
    vec2 centered_uv = uv - 0.5;
    
    // Apply curvature
    centered_uv /= vec2(1.0 - curvature * centered_uv.y, 1.0 - curvature * centered_uv.x);
    uv = centered_uv + 0.5;
    
    // Clamp to screen edges
    uv = clamp(uv, vec2(0.0), vec2(1.0));
    
    // Get the original color
    vec4 color = texture(SCREEN_TEXTURE, uv);
    
    // Apply moving scanlines
    float scanline = sin((uv.y + time * 5.0) * resolution.y * 3.14) * scanline_intensity;
    color.rgb *= 1.0 - scanline;
    
    // Apply vignette
    float vignette = length(centered_uv) * vignette_intensity;
    color.rgb *= 1.0 - vignette;
    
    // Apply noise
    float noise = rand(uv + time) * noise_intensity;
    color.rgb += noise;
    
    // Apply sharp zigzag lines
    float zigzag = abs(sin(uv.y * zigzag_frequency + time * 5.0)) * 0.5;
    color.rgb *= 1.0 - zigzag;
    
    // Output the color
    COLOR = color;
}
