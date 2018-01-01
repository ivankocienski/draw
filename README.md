# Draw

A simple wrapper for boring GL drawing routines. I like to throw together simple (and sometimes not so simple) graphical apps and I have found it hard to locate a decent drawing library that doesn't have some sort of gotcha. So this just pulls together various boring GL routines into one place

## Requirements

- GL
- GLFW for the demo

## API

    configure WIDTH HEIGHT

Must be called first to set stuff up

    set-clear-color R G B

Color of background

    set-color R G B

Color of drawing

    clear

Clear screen (or sub region)

    line X1 Y1 X2 Y2

Draws a line

	  box X Y WIDTH HEIGHT

Draws a box

	  filled-box X Y WIDTH HEIGHT

Draws a filled box

	  texture-box X Y WIDTH HEIGHT

Draws a textured box, texture must be bound before calling

	  circle X Y X-RADIUS Y-RADIUS STEPS

Draws a circle in STEPS line segments. STEPS is 10 by default. Increase for bigger circles

	  text X Y STRING

Draws text. Not a fast routine as it has to convert strings into list of ASCII numbers on each call

	  sub-region X Y WIDTH HEIGHT
 
For setting up a smaller box to be drawn into with clipping and translation so 0,0 is X,Y


