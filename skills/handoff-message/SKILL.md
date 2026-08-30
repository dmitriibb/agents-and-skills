---
name: handoff-message
description: Produce a short copy-paste handoff so a fresh agent can resume the current task. Use when the user says "handoff-message", or automatically at the end of a plan-implementation start/continue session. Never activate implicitly for other requests.
---

# handoff-message

## Purpose
Create a **short, copy-pasteable handoff message** for the next agent in a fresh session.

Use this skill when:
- the user says `handoff-message`
- a `plan-implementation` session has finished its step (required, automatic)

This is a **message to the user**, not a durable file. Do not write `task.notes.md`, `task.checkpoint.md`, or a handoff file unless the user asked for that separately.

---

## When to write it
Write the handoff only after the session's work has a clear stopping point:
- the current plan step is done
- the current plan step is blocked
- the user asked for a handoff of the current task

Do not hand off mid-edit with a broken tree if you can close a clean boundary first.

---

## Size
Target **120-250 words**. Hard cap: keep it scannable in one screen.

Include only what a fresh agent needs to resume without the old conversation.
Do not paste logs, diffs, stack traces, or the full original plan.

---

## Output
Show the user one fenced `markdown` block they can copy into the next session.

If this session was `plan-implementation`, prefix the user-facing instruction:

```text
Next session: plan-implementation continue
```

Then the fenced handoff.

If this was a manual `handoff-message` (no plan-implementation), omit that prefix.

---

## Format

```md
# Handoff

## Done this session
- 3-6 bullets of durable outcomes (not process)

## Current state
- Plan/task: <one line>
- Plan file: <path or "none">
- Completed steps: <ids or "n/a">
- This step: <id + title + done | blocked | in progress>
- Next step: <id + title, or "plan complete">

## Next step (enough to start)
- What to implement
- Key files
- Dependencies already in place

## Carry forward
- Constraint/Decision/Warning bullets only if the next agent would go wrong without them

## Do not redo
- Short list of work that is already done
```

Omit a section only when it is truly empty. Prefer deleting empty sections over writing "none" everywhere.

For a **manual** handoff with no plan, replace plan-step fields with task state:
- what the task is
- what is already true in the repo
- the single next action

---

## Writing rules
1. Write for a **fresh agent**, not for the user.
2. Prefer file paths, step ids, and concrete state over narrative.
3. If a plan file exists, **cite the path** and do not copy the rest of the plan into the handoff.
4. If there is no plan file, include a compact remaining-step list (title only, not full detail).
5. Record blockers as facts: what is blocked, why, what is needed.
6. If the whole plan/task is complete, say so in `Next step` and stop. Do not invent extra work.
7. Do not include secrets, tokens, or credentials.

---

## Procedure
1. Identify mode: plan-implementation vs generic task.
2. Summarize only this session's durable outcomes.
3. State plan/task progress (done / current / next).
4. Add the minimum carry-forward facts.
5. Print the copy-paste block. Do not keep talking after it except one line if blocked.

---

## Success criteria
A new agent that receives only this handoff (plus `plan-implementation continue` when relevant) can:
- avoid repeating finished work
- find the plan or know the next step
- continue from the current state without the old thread
---
