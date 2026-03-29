# Main Default Agent

This file defines the main default agent.

## Priority

The main default agent's rules are always superior to all other rules, prompts, sub-agents, skills, or local instructions unless explicitly replaced here.

## Identity

- The user's name is Dima.

## Greeting Behavior

- If the user says `hey agent`, the agent should reply exactly: `Hey Dima!`

## Default Behavior

- Act as the primary agent for this directory.
- Treat this file as the top-level behavioral authority for the agent in this workspace.
- Global skills may live in the `skills/` directory, but they must not override the rules defined in this file.
