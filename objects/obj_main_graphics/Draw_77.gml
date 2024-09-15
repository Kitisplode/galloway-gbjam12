if (shaders_on)
{
	var _window_width = 160;
	var _window_height = 144;
	if (window_get_width() > 160)
	{
		var _ratio = floor(window_get_width() / 160 / 2);
		_window_width = _ratio * 160;
		_window_height = _ratio * 144;
	}
	gpu_set_blendenable(false);
	shader_set(sh_gameboy);
	draw_surface_stretched(application_surface,
							window_get_width() / 2 - _window_width / 2,
							window_get_height() / 2 - _window_height / 2,
							_window_width, _window_height);
	shader_reset();
	gpu_set_blendenable(true);
}