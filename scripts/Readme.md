# Scripts

The `Scripts` folder contains all the scripts used in PokeArch, written in GDScript. These scripts are responsible for managing various aspects of the game, including scene logic, game data, music and sound effects, and dialogues.

## Global Scripts

### Game.gd

`Game.gd` is a global script that manages all the data and state of the game. It handles tasks such as saving and loading game progress, managing player inventory and Pokémon collection, and controlling game events.

### MusicPlayer.gd

`MusicPlayer.gd` is a global script responsible for managing all the music and sound effects throughout the game. It controls the playback of background music, sound effects for actions and events, and provides functions to adjust volume levels and change tracks.

### DialogueManager.gd

`DialogueManager.gd` is a global script used to handle all the dialogues in the game. It manages the display of dialogue boxes, the flow of conversations between characters, and the storage of dialogue data.

## Scene Scripts

Each scene in PokeArch has its own script to handle scene-specific logic and interactions. These scripts are named according to the scene they belong to, such as `main.gd`, `battle_scene.gd`, `world.gd`, etc. They contain functions and variables relevant to the behavior of that particular scene.

## Usage

To use these scripts in your Godot project, simply place them in the `Scripts` folder of your project and attach them to the corresponding nodes or scenes as needed. Ensure that global scripts are autoloaded in your project settings to ensure they are accessible from any scene.

By organizing scripts in this manner, PokeArch maintains a clear and structured codebase, making it easier to manage and maintain the game's functionality.
