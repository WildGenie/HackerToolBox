First, we need to get 2 different based images.

The easiest way is to code a small proggy to load 2 same modules at
the same time and show a messagebox to warn we can dump them
(check "src" directory in C only but it's easy to port).

You will notice there are 2 dll : original.dll and copy_of_original.dll
It's needed because if you load twice the same file (same name), the
system will only load one of course.

There should be other tricky ways to get different bases, find them :-)
