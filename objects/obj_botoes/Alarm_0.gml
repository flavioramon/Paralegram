if (image_index == 1) image_index = 2; //start - stop
else if (image_index == 3) image_index = 0; //stop - start
else if (image_index == 9) image_index = 10; //1x = 2x
else if (image_index == 11) image_index = 12; //2x = 4x
else if (image_index == 13) image_index = 8; //4x = 1x
else image_index --; //outros