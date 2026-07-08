#version 300 es
precision highp float;

in vec2 v_texcoord;
out vec4 fragColor;
uniform sampler2D tex;

void main() {
    vec4 texColor = texture(tex, v_texcoord);
    // Calcul de luminance standard
    float gray = dot(texColor.rgb, vec3(0.299, 0.587, 0.114));
    fragColor = vec4(vec3(gray), texColor.a);
}