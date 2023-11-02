[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/wH6E8Dzd)
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
   Test with `./imageTool test/original.pgm info`.
5. Complete `ImageNegative`, `ImageThreshold`, `ImageBrighten`.
6. Complete `ImageValidRect`.
7. Complete `ImageMirror`, `ImageRotate`.
8. Complete `ImageCrop`, `ImagePaste` and `ImageBlend`.
9. Complete `ImageMatchSubImage` and `ImageLocateSubImage`.
10. Complete `ImageBlur`.

You can run `make test1`, `make test2`, etc.
to run simple tests on many of these functions.
But run other tests that you consider appropriate.

## Update repository


Given the nature of the work, it may be necessary to
update this project's upstream repository.
If this happens, you should update your repository with the following commands:

```bash
git remote add upstream git@github.com:detiuaveiro/image8bit-pub.git
git fetch upstream
git rebase upstream/main
```