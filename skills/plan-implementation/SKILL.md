---
name: plan-implementation
description: Implement one step of an existing multi-step plan per session, then emit a handoff for the next fresh session. Use ONLY when the user says "plan-implementation", "plan-implementation start", or "plan-implementation continue". Never activate implicitly, even if a plan is present.
---

# plan-implementation

## Purpose
Implement a large existing plan **one step per session** so context stays small.

Use this skill **only** when the user explicitly says:
- `plan-implementation`
- `plan-implementation start`
- `plan-implementation continue`

Never activate because a plan file exists, a task looks large, or the user asks to "implement the plan" in other words.

When the step is finished or blocked, **always** load and follow the `handoff-message` skill before ending. Do not skip this.

---

## Modes

### `plan-implementation start`
Begin the plan from the first unfinished step.

The user should provide the plan (pasted text and/or a file path).

### `plan-implementation continue`
Resume from a previous agent's handoff.

The user should paste that handoff in the same message.

### Bare `plan-implementation`
Infer:
- handoff present → continue
- plan present and no handoff → start
- neither → say "Unknown" and ask for `start` + plan, or `continue` + handoff

---

## Hard rules
1. Do **one plan step** this session, then stop.
2. Do not start the next step after finishing the current one.
3. Do not re-implement completed steps.
4. Do not rewrite the plan unless the current step cannot proceed without a correction. If you must correct it, say so in the handoff.
5. Prefer verifying the current step (tests, typecheck, or a focused check that this repo already uses) before handing off.
6. End every start/continue session by following `handoff-message`.

If the user explicitly says to do more than one step, follow that instruction. Otherwise stay at one.

---

## What "one step" means
Use the plan's own step numbering/headings.

If a single step is too large for one session:
- implement a **clean slice** of that step
- leave the tree buildable if possible
- mark the step **in progress** in the handoff, with what remains

If a step is already done in the repo, skip it and take the next unfinished step. Mention the skip in the handoff.

---

## Start procedure
1. Load this skill. Do not implement until the plan is identified.
2. Find the plan:
   - user-provided path
   - pasted plan in the message
   - only then a clearly named file the user pointed at
3. If no plan: say "Unknown" and list what is needed. Do not invent a plan.
4. Read the plan enough to list steps and find the first unfinished one. Do not load unrelated docs.
5. Confirm in one short line which step you are implementing, then implement only that step.
6. Verify the step if practical.
7. Load `handoff-message` and produce the handoff.

---

## Continue procedure
1. Load this skill.
2. Read the pasted handoff. If missing: say "Unknown" and ask for the previous handoff.
3. If the handoff cites a plan file, read the **next step section** from that file. Do not reread the whole plan unless required.
4. Spot-check the repo against "Done this session" / "Do not redo" so you do not trust a stale handoff blindly.
5. Implement only the stated next step (or the remaining slice if it was in progress).
6. Verify the step if practical.
7. Load `handoff-message` and produce the handoff.

---

## Context budget
Keep this session small on purpose.

Load:
- the current step
- files needed to implement it
- the handoff (continue mode)

Do not load:
- the full original conversation
- the entire plan when a plan file + handoff is enough
- unrelated history, notes, or checkpoints unless the user points at them

If information is missing, say "Unknown" and list what would be needed.

---

## Plan file vs handoff
- **Plan file** = full step details. Cite its path in the handoff.
- **Handoff** = this session's outcomes + progress pointer + next step. Keep it short.

Do not dump the remaining plan into the handoff when a plan file path is known.
If there is no plan file, the handoff must include a compact remaining-step list (titles only).

---

## Stop conditions
Stop and hand off when any of these is true:
- the current step is complete
- the current step is blocked
- the slice you could finish this session is at a clean boundary
- the plan is complete

If the plan is complete, the handoff must say `Next step: plan complete` and must not start extra work.

---

## Success criteria
- Only the intended step (or slice) changed
- Completed work is not repeated
- The user gets a copy-paste handoff for `plan-implementation continue`
- A fresh agent can resume from that handoff without this session's context
---
