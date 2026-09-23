if (position_meeting(mouse_x, mouse_y, id)) {
    // mouse está em cima do botão
	tam += 0.1;
	tam = clamp(tam,tam_min,tam_max);
} else {
    // mouse não está em cima
	tam -= 0.1;
	tam = clamp(tam,tam_min,tam_max);
}