# Controlling Robots

A program for controlling robots that move on a table surface. To run the program, you will need to have the files **RobotMain.m**, **robot.m**, **InputData.txt** and **InputData2.txt** in the same directory.

## Requirements

### Robots

* Two remote-controlled robots are placed on a rectangular table.
* The robots can be independently controlled to navigate the table surface.
* A robot’s position and orientation are represented by the three values. The X-Axis and the Y-Axis coordinates, as well as the Orientation of the robot represented by one of the four cardinal compass points (N, S, E, W).

### Table

* The table is divided into a grid to simplify navigation.
* The lower-left (Southwest) coordinate of the table is (0, 0). Coordinate values increase by one to the North and to the East.

### Control

* A robot is controlled via a simple string of characters. The possible letters are ‘L’, ‘R’ and ‘M’. The characters ‘L’ and ‘R’ make the robot spin 90 degrees left or right from its current orientation without moving from its current location. ‘M’ means move forward one grid point maintaining the same orientation.
* Each robot will be moved sequentially. This means the second robot won’t start to move until the first robot has finished moving.

### Data Input

* Data input is ASCII textual data. Each data value is separated by a space.
* Line 1 – Describes the upper-right (Northeast) coordinates of the table (zero-based).
* Line 2 – The starting location and orientation of robot #1.
* Line 3 – The starting location and orientation of robot #2.
* Line 4 – The commands for robot #1.
* Line 5 – The commands for robot #2.

### Data Output

* The final position and orientation for each robot will be displayed after running the scenario.

### Test Scenario #1

#### Input data (see InputData.txt)

```python3
5 5
1 2 N
3 3 E
L M L M L M L M M
M M R M M R M R R M
```

#### Output data (see OutputData.txt)

```python3
1 3 N
5 1 E
```

### Test Scenario #2

#### Input data (see InputData2.txt)

```python3
3 6
0 2 S
3 3 E
M L M M L M R M
M M L M R M L M
```

#### Output data (see OutputData2.txt)

```python3
3 2 E
4 3 E
```
