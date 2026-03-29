---
name: task-checkpoint
description: Save the new durable progress of the current task into task.checkpoint.md. Use this after a meaningful step is completed such as a UI element added, endpoint implemented, migration created, or test fixed.
---

# task-checkpoint

## Purpose
Save only the **new durable progress** of the current task into `task.checkpoint.md`.

Use this skill when the user says `task-checkpoint` after a meaningful step is completed.

Examples of meaningful steps:
- UI element added
- endpoint implemented
- migration created
- failing test fixed
- review feedback addressed
- branch/repo status changed in a way worth preserving

Do **not** save temporary exploration, dead ends, or raw conversation text.

---

## Files used
- Read if present: `task.checkpoint.md`
- Read if present: `task.notes.md`
- Update or create: `task.checkpoint.md`

---

## Main rule
Append a **new checkpoint entry** that contains only what is newly achieved since the last checkpoint.

Do **not** repeat older completed work unless it is needed to correct or supersede a previous checkpoint.

The file must stay compact and easy for a fresh agent to scan quickly.

---

## Output format
Use this structure inside `task.checkpoint.md`:

```md
# Task Checkpoints

## Checkpoint 1
- Added login button to header UI
- Wired click handler to existing auth flow
- Updated related component test

## Checkpoint 2
- Added top navigation menu
- Added routing links for Home and Profile
- Kept login button behavior unchanged
```

---

## Entry rules
For each new checkpoint:
1. Use the next sequential heading: `## Checkpoint N`.
2. Add **3-7 short bullets**.
3. Each bullet should describe a durable outcome, not the process.
4. Prefer changed state over implementation detail.
5. Avoid stack traces, command logs, and long explanations.
6. Avoid duplicating earlier checkpoints.
7. If earlier work was changed, add one bullet like:
   - Revised previous login button implementation to use shared auth modal

---

## Compression rules
Keep each checkpoint under roughly **80-120 words** total.

Good:
- Added login button to header
- Connected button to auth modal
- Updated header snapshot test

Bad:
- I analyzed multiple options for where to place the login button and finally decided after reviewing the existing layout that the top right corner looked the cleanest and then I tried two implementations

---

## Procedure
1. Read `task.checkpoint.md` if it exists.
2. Infer what was completed since the latest checkpoint.
3. Ignore exploratory chatter and duplicate achievements.
4. Append one new `Checkpoint N` section.
5. If no durable progress happened, say so and do not write a new checkpoint.

---

## Success criteria
A fresh agent reading `task.checkpoint.md` should quickly understand:
- what has already been completed
- the order of completed milestones
- what should not be repeated

It should **not** need to read the full old conversation to recover the task trajectory.
