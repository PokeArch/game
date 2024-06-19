# Scenes

The `Scenes` folder contains all the `.tscn` files used in PokeArch, which are scene files created and used in the Godot Engine. These files define the structure and contents of each scene in the game, including the layout of the game world, placement of objects and characters, and any associated scripts and resources.

## Scene List

- `main.tscn`: The main menu scene where players can start a new game, load a saved game, or access game settings.
- `world.tscn`: The main gameplay scene where players explore the game world, encounter wild Pokémon, and navigate between different areas.
- `battle_scene.tscn`: The battle scene where Pokémon battles take place, with animations and effects.
- `pause_menu.tscn`: The pause menu scene that overlays the game screen when the game is paused, allowing players to access the game menu and settings.
- Other scene files for different areas, environments, and game events.

## Scene Organization

The scenes are organized in a hierarchical structure, with main scenes like `main.tscn` and `world.tscn` serving as the entry points to different parts of the game. Sub-scenes and instances of scenes are used to manage specific elements within each scene, such as UI elements, NPCs, and interactive objects.

## Usage

To use these scenes in your Godot project, simply place them in the `Scenes` folder of your project and load them as needed in your scripts. You can instance scenes, switch between scenes, and manage scene transitions using Godot's scene management features.

By organizing scenes in this manner, PokeArch maintains a modular and scalable design, making it easier to add new content and features to the game.
