#Game of Life

Given a cell we define its eight *neighbours* as the cells that are horizontally, vertically, or diagonally adjacent.

When calculating the next generation you should follow these rules:
1. Any live cell with fewer than two live neighbours dies.
2. Any live cell with two or three live neighbours lives on to the next generation.
3. Any live cell with more than three live neighbours dies.
4. Any dead cell with exactly three live neighbours becomes a live cell.

## Solution implementation
The initial state (the current generation) will be provided via a text file that specifies:
* the current generation number
* the grid size
* the population state (`*` represents a live cell, `.` represents a dead cell)

In the following input file example we can see an input file specifying the third generation on a 4 by 8 grid:
```
Generation 3:
4 8
........
....*...
...**...
........
```
