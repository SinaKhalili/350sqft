# 350sqft
This is a tiny (< 80 lines) static site generator, with a little
[troff](https://en.wikipedia.org/wiki/Troff) inspired markup
language. It looks like this:

```
.HEAD

My silly markup language

.TEXT

The spectacle before us was indeed sublime.
Nothing is stopping you from using <em> normal html </em> also.
Hey look, a link!

.LINK

https://something.com

.IMAGE

/link/to/image

```

The file `wrap.py` creates html from the troff-like-langauge and the `Makefile`
is reponsible for calling it and making the `build` folder.