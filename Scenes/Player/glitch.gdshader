shader_type canvas_item;

uniform float glitch_strength : hint_range(0.0, 1.0) = 0.5; // Strength of the glitch effect
uniform float speed : hint_range(0.0, 10.0) = 1.0; // Speed of the glitch effect

float rand(vec2 uv) {
    return fract(sin(dot(uv.xy, vec2(12.9898, 78.233))) * 43758.5453);
}

void fragment() {
    vec2 uv = UV;
    
    // Create a time variable for animation
    float time = TIME * speed;
    
    // Apply a sine wave to create a glitch effect
    float glitch = sin(uv.y * 10.0 + time) * glitch_strength;
    
    // Add some random noise to the glitch
    float noise = (rand(uv * 100.0) - 0.5) * 0.02;
    
    // Apply the glitch and noise to the UV coordinates
    vec2 glitch_uv = uv + vec2(glitch + noise, 0.0);
    
    // Sample the texture with the distorted UV coordinates
    vec4 tex_color = texture(TEXTURE, glitch_uv);
    
    // Set the fragment color
    COLOR = tex_color;
}
