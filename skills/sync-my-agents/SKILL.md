---
name: sync-my-agents
description: Sync the global instructions from ~/.agents/AGENTS.md into the user-level instruction locations for OpenCode, GitHub Copilot, and Codex, and copy custom skills from ~/.agents/skills into ~/.codex/skills. Use this when AGENTS.md or shared skills change or when setting up a new machine.
---

# Sync My Agents

This skill keeps your shared agent instructions in one canonical file: `~/.agents/AGENTS.md`.

## What this skill syncs

- OpenCode global rules: `~/.config/opencode/AGENTS.md`
- Codex global rules: `~/.codex/AGENTS.md`
- Claude-compatible global rules: `~/.claude/CLAUDE.md`
- GitHub Copilot user instructions: `~/.copilot/instructions/global-agent.instructions.md`

## Important detail about Copilot

GitHub Copilot does not use a single global `AGENTS.md` file as its primary user-level instruction source.
Instead, VS Code Copilot supports user instruction files under `~/.copilot/instructions/`.

This skill therefore wraps the content from `~/.agents/AGENTS.md` into a Copilot-compatible `*.instructions.md` file with frontmatter.

## How to run

Run the sync script:

```bash
bash ~/.agents/skills/sync-my-agents/scripts/sync.sh
```

## What the script does

1. Verifies `~/.agents/AGENTS.md` exists
2. Creates missing target directories
3. Copies the file directly to OpenCode, Codex, and Claude-compatible global locations
4. Generates a Copilot user instruction file that applies globally
5. Prints the updated target paths

## When to use

- After editing `~/.agents/AGENTS.md`
- After adding or updating a skill in `~/.agents/skills/`
- When bootstrapping a new machine
- When you want one source of truth for your personal agent rules

## Notes

- OpenCode docs indicate global rules live in `~/.config/opencode/AGENTS.md`
- Codex docs indicate global rules live in `~/.codex/AGENTS.md`
- Claude-compatible global rules are commonly read from `~/.claude/CLAUDE.md`
- Copilot docs indicate user instructions live in `~/.copilot/instructions/`
