This folder is filled with some/all of the garbage I used to make this game and thought would be funny
to leave in the finished product for some odd reason.

LAUNCHER.GM81

The source code for the launcher. It was made in Game Maker 8.1, which is, like, ancient history now.
Also it won't run if you import it into Game Maker Studio 1 or 2 because of a bunch of reasons but
if you have a copy of Game Maker 8.1 lying around you can have a look at it I guess.

GMMODEL.CLASS, RUNNER.CLASS, TYPE.CLASS

This is a program I use to compress Game Maker model files (*.d3d) so that they take up less space.
It basically strips out all of the unnecessary spaces and characters, turning (for example) "1.00000"
into "1."

If you want to use it, copy all three .class  out of this folder and into a folder with the models
you're working with. Make sure you have Java installed and type "java Runner" into a command prompt
window. It should spit out a list of all of the model files it has processed before givign you a
"Done!" message.