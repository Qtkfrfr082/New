shader_type canvas_item;

uniform vec4 glow_color = vec4(1.0, 1.0, 0.0, 1.0); // Yellow color
uniform float glow_size = 0.2; // Size of the glow
uniform float glow_strength = 5.0; // Strength of the glow

void fragment() {
    vec2 uv = FRAGCOORD.xy / SCREEN_PIXEL_SIZE;
    vec4 tex_color = texture(TEXTURE, UV);
    
    vec4 glow = vec4(0.0);
    float total = 0.0;

    for (float x = -glow_size; x <= glow_size; x += glow_size / 5.0) {
        for (float y = -glow_size; y <= glow_size; y += glow_size / 5.0) {
            vec4 sample = texture(TEXTURE, UV + vec2(x, y));
            glow += sample;
            total += 1.0;
        }
    }

    glow /= total;
    glow = vec4(glow_color.rgb * glow_strength, glow.a);

    COLOR = tex_color + glow * (1.0 - tex_color.a);
}
