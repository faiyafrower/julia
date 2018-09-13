include("main.jl")

Pkg.add("Images")
Pkg.add("QuartzImageIO") # For Mac
Pkg.add("ImageView") # For viewing images
Pkg.add("ImageMagick") # For importing images

using Images
using QuartzImageIO
using ImageView
using ImageMagick

img = load("testResized/9999.Bmp");
imshow(img)
