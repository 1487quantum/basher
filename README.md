# basher
<a href="LICENSE" ><img src="https://img.shields.io/github/license/1487quantum/basher?style=for-the-badge"/></a>

Bash Tool Scripts

> **Note:** Remmember to update the script permission [`chmod +x`] before running!
> 
> ` $ sudo chmod <script>.sh `

## bashcolors
Displays the available colors on Bash.
```
$ ./bashcolors.sh
```

## chessboard_gen
Prints a 8 X 8 chessboard in the terminal.
```
$ ./chessboard_gen.sh
```

## checker_grid
Prints a 8 X 8 checker board in the terminal by default.
```
$ ./checker_grid.sh
```
To print a checker grid of (width) 10 X (height) 6 with box size of 2:
```
$ ./checker_grid.sh -w 10 -h 6 -b 2
```

## checklib
A simple tool to check the versions of libraries installed if it exists. A prompt would be shown, and enter the respective libraries to be searched. (Note: Leave a space for every different library entered!)
```
$ ./checklib.sh
```
For example, to check if Eigen, yaml-cpp, opencv & cuda libraries exists, and the version of them if they do:
```
$ ./checklib

Bash Library Check
Version 1.0.0

> A simple tool to check the versions of libraries installed


Enter lib: eigen yaml-cpp opencv cuda               # Enter the libraries when the prompt is displayed!

```
