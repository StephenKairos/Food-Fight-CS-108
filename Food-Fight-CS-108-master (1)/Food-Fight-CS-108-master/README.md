# Food-Fight-CS-108
Repo for the game "Food Fight"

# Design Document
Stephen Reyes, Designer and Programmer/Artist
Michael Woldai - Designer and Programmer/Artist
Moiz Ahmad - Designer and Programmer/Artist
Salvador Ponce - Producer and Artist 

Inspired by Spybotics: Nightfall Incident, this game will feature food based characters and units. The player’s goal is the reach the (target item, files?). Theme might be Fruit Vs. Junk Food Wars, or something similar. This will be a tactics game, with no resource management. The grid will be 2d, but not isometric.

Example Game Art, for Unit Portraits (originally created):

![Unit Portraits](/Art/example-food.png)

Game Inspirations

![Nightfall Incident](https://static1.squarespace.com/static/579b8aa26b8f5b8f49605c96/5962ca3db11be1777323652c/5962ca3ebf629a39ce07681d/1499646527610/SpyboticsTheNightfallIncident.jpg?format=750w)

![Into the Breach](https://subsetgames.com/img/itb/ITB_ss_1.png)
# Game Objects
## Units
Units can move on the given grid. Each has a max movement, and size. The size of a unit is also its health. If a given unit’s health reaches 0, the unit dies, and is removed from the board. All unit stats listed here are subject to change based on playtesting.

### Player Units
Players will have 3 units to use. One tanky unit (coconut?), 4 max health, with 2 damage. One ranged unit (banana?), 2 max health, 1 damage. One assassin unit, 1 max health, 3 damage (possibly more movement). Players can place units on the specified spots on the board, with a max limit of 2 units deployed.

### Enemy Units
Enemy units will have very basic AI. Two mobile units, a melee (range 1), and a ranged (range 3), and two stationary units (range 4) guard a special item. Each mobile unit will have fairly slow speed, but decent damage. The priority for each enemy unit is to attack the weakest (lowest health) Player unit in range (within range of movement + speed, manhattan distance).

## Grid
Grid will have no other type or purpose so far except for dictate where units can or cannot go.

## UI
UI will show movement for each friendly unit, and stats for that unit. When selecting an action for a unit, it will show the range of the action (no real actions except for attacks). There will be a simple splash page which loads the first level when clicked on. 

## Splash Screen
# Sounds
An "adventure" style theme at the beginning, and a more fast paced battle theme during the level. Might add sound when selecting units.
# Controls
Only Mouse. Clicking on buttons and units. Might add directional keys or shortcuts if there’s enough time.
# Game Flow
Each side moves their units on their turn. Each unit can move initially, and then perform an action. First turn is determined randomly. The level ends if the player meets the objective (reaches the goal grid square and eliminates all the enemies) or the enemy eliminates all the player units.

# Levels
One basic level, with a large playing field and a choke point. The two mobile enemy units are on the wider space of play, while the two stationary units guard the objective, which is located past the chokepoint. Player wins when one unit touches the objective grid-square, and all enemies are eliminated
