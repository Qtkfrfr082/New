shader_type canvas_item;

uniform vec4 glow_color = vec4(1.0, 1.0, 1.0, 1.0); // Default glow color is white
uniform float glow_intensity = 0.5; // Default intensity

void fragment() {
    vec4 tex_color = texture(TEXTURE, UV);
    vec4 glow = glow_color * tex_color.a;
    COLOR = tex_color + glow * glow_intensity;
}
