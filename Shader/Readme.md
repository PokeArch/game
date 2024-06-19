# Shader Section

This section contains two shader files used in PokeArch to enhance the visual effects during gameplay. These shaders are implemented using Godot's shading language.

## Table of Contents
- [Introduction](#introduction)
- [Shaders](#shaders)
  - [battle_bulbasaur.gdshader](#battle_bulbasaurgdshader)
  - [pause_menu.gdshader](#pause_menugdshader)

## Introduction

Shaders in PokeArch are used to create visually appealing effects that enhance the gaming experience. This section includes:

- `battle_bulbasaur.gdshader`: A shader to create a damage effect when a Pokémon is attacked.
- `pause_menu.gdshader`: A shader to create a blur effect when the pause menu is active.

## Shaders

### battle_bulbasaur.gdshader

This shader is used to create a damage effect, visible as a white flash on the Pokémon when it is attacked. The effect is managed by changing the level of detail (LOD) and animating this value as a shader parameter.

### pause_menu.gdshader

This shader is used to create a blur effect on the background whenever the pause menu is called. It is added onto a `ColorRect` as a Shader Material.

---


By using these shaders, PokeArch provides enhanced visual feedback and a more immersive experience during battles and pause menu interactions.
