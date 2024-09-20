/// @description Split the given paragraph into its separate strings.


// Loop through the paragraph.
var temp_string_segment_start = 0;
var temp_final_string = "";
for (var i = 0; i <= string_length(text); i += 1)
{
	// Extract the character from the string.
	var temp_extracted_character = string_copy(text, i, 1);
	// If the character is a newline or we reached the end of the string,
	// split the string up to this point into a new string.
	if (temp_extracted_character == "\n" || i == string_length(text))
	{
		var temp_segment_length = i - temp_string_segment_start;
		if (i == string_length(text)) temp_segment_length += 1;
		var temp_extracted_string = string_copy(text, temp_string_segment_start, temp_segment_length);
		ds_list_add(string_list, temp_extracted_string);
		temp_final_string += "\"" + temp_extracted_string + "\" "
		temp_string_segment_start = i + 0;
	}
}
//window_set_caption(temp_final_string);