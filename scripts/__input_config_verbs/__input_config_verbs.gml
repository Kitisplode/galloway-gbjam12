//This script contains the default profiles, and hence the default bindings and verbs, for your game
//
//  Please edit this macro to meet the needs of your game!
//
//The struct return by this script contains the names of each default profile.
//Default profiles then contain the names of verbs. Each verb should be given a binding that is
//appropriate for the profile. You can create bindings by calling one of the input_binding_*()
//functions, such as input_binding_key() for keyboard keys and input_binding_mouse() for
//mouse buttons

return {
    
    keyboard_and_mouse:
	{
        up:    input_binding_key(vk_up),
        down:  input_binding_key(vk_down),
        left:  input_binding_key(vk_left),
        right: input_binding_key(vk_right),
		
		a: input_binding_key("X"),
		b: input_binding_key("C"),
		x: input_binding_key("Z"),
		y: input_binding_key("S"),
		
		//l: input_binding_key("A"),
		//r: input_binding_key("E"),
		//l2: input_binding_key("Q"),
		//r2: input_binding_key("R"),
		
		start: input_binding_key(vk_space),
		select: input_binding_key(vk_enter)
	},
    
    gamepad:
    {
        up:    [input_binding_gamepad_axis(gp_axislv, true),  input_binding_gamepad_button(gp_padu)],
        down:  [input_binding_gamepad_axis(gp_axislv, false), input_binding_gamepad_button(gp_padd)],
        left:  [input_binding_gamepad_axis(gp_axislh, true),  input_binding_gamepad_button(gp_padl)],
        right: [input_binding_gamepad_axis(gp_axislh, false), input_binding_gamepad_button(gp_padr)],
        
        a:  input_binding_gamepad_button(gp_face1),
        b:  input_binding_gamepad_button(gp_face2),
        x:  input_binding_gamepad_button(gp_face3),
        y: input_binding_gamepad_button(gp_face4),
        
        start: input_binding_gamepad_button(gp_start),
        select: input_binding_gamepad_button(gp_select)
    }
    
    //touch:
    //{
    //    up:    input_binding_virtual_button(),
    //    down:  input_binding_virtual_button(),
    //    left:  input_binding_virtual_button(),
    //    right: input_binding_virtual_button(),
        
    //    accept:  input_binding_virtual_button(),
    //    cancel:  input_binding_virtual_button(),
    //    action:  input_binding_virtual_button(),
    //    special: input_binding_virtual_button(),
        
    //    pause: input_binding_virtual_button(),
    //}
    
};