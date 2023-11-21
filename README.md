# Work1 AED 2023-2024

This is the source code for the first AED 2023-2024 project.

## Files

- `image8bit.c` - module implementation (to be COMPLETED)
- `image8bit.h` - module interface
- `instrumentation.[ch]` - module for counting operations and measuring times
- `imageTest.c` - simple test program
- `imageTool.c` - more versatile test program
- `Makefile` - rules for compiling and testing using `make`

- `README.md` - this information you are reading
- `Design-by-Contract.md` - explanation of [DbC methodology][dbc],
   followed in this project.


[dbc]: Design-by-Contract.md

## Download images

Run:

- `make pgm` - to download images to `pgm/` folder
- `make setup` - to download images for tests in `test/`

## Compile

- `make` - Compiles and generates the test programs.
- `make clean` - Clean up object and executable files.


## Suggestions for development

We suggest progressive development in the following order:

1. Complete `ImageCreate` and `ImageDestroy`.
2. Compile the programs by running `make`
   and test with

   ```bash
   valgrind ./imageTool test/original.pgm save out.pgm`
   ```
   
   This calls `ImageLoad`, which calls `ImageCreate`
   and then `ImageSave` and `ImageDestroy`.
   Check that all memory has been freed.
3. Complete the internal function `G`,
   which is used by `ImageSetPixel` and `ImageGePixel`.
4. Complete `ImageStats`.
   If you use `ImageGePixel`, it will allow you to test `G`.
   Test with `./imageTool 

Translated with www.DeepL.com/Translator (free version)