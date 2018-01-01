
#include <stdio.h>
#include <stdlib.h>

#include "font.c"

// https://stackoverflow.com/questions/9296059/read-pixel-value-in-bmp-file
unsigned char* readBMP(char* filename, int *o_width, int *o_height)
{
    FILE* file;
    unsigned char info[54];
    int width;
    int height;
    int size;
    unsigned char *data;

    file = fopen(filename, "rb");
    if(!file) return NULL;

    fread(info, sizeof(unsigned char), 54, file); // read the 54-byte header

    // extract image height and width from header
    width  = *(int*)&info[18];
    height = *(int*)&info[22]; 
    size   = 3 * width * height;
    data   = malloc(size * sizeof(unsigned char)); // allocate 3 bytes per pixel
    if(!data) return NULL;

    fread(data, sizeof(unsigned char), size, file); // read the rest of the data at once
    fclose(file);

    *o_width = width;
    *o_height = height;

    return data;
}

int total_count = 0;

void print_pixel(int color, int count) {
  static int newline = 1;

  unsigned char packed;

  packed = (color & 128) | (count & 127);
  printf("#x%02x%s", packed, (newline & 15) ? " " : " \n");

  total_count += count + 1;

  newline++;
}

int main(int argc, char ** argv) {

  int width;
  int height;
  int run_color;
  int count;
  int color;
  unsigned char *data;
  unsigned char *pixel;
  int x;
  int y;

  width = gimp_image.width;
  height = gimp_image.height;
  data = gimp_image.pixel_data;

  //data = readBMP("font.bmp", &width, &height);
  //if(!data) {
  //  printf("could not open font.bmp\n");
  //  return -1;
  //}

  printf("%d %d\n", width, height);

  // RLE
  run_color = -1;
  count = 0;
  pixel = data;
  for(y = 0; y < height; y++) {
    for(x = 0; x < width; x++) {

      color = *pixel;
      if(color != run_color) {

        if(run_color != -1)
          print_pixel(run_color, count);

        run_color = color;
        count = 0;

      } else {

        if(count > 126) {
          print_pixel(run_color, count);
          count = 0; 
        } else
          count++;
      }

      pixel += 3;

    }
  }

  print_pixel(run_color, count);

  printf("total=%d\n", total_count);


  return 0;
}

