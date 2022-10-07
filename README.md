## Little pet projects written in pure Ruby just for fun and education.
Install necessary gems:

	$ bundle install

How to launch project:

	$ rake [project_name]

### Projects:

**hangman** - the hangman game with drawing gallows components to the terminal.
Word can be typed in through ARGV and if it's not, you can choose from getting random word
from the programm's data txt file or type it in by yourself. Also there's scoreboard feature: 
the txt file contains player's name that had been asked before the start of the game and player's time needed to guess the word.
Also scoreboard table is sorted by time so player with best time is at the top of it.
___
**diary** - simple diary that writes everything you type in to the txt file.
If there isn't the info about owner of diary in your diary file then the programm will ask for it and put it to the file.
You can type your page as long as you want before entering 'end' line.