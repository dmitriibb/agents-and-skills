# task-continue

## Purpose
Rehydrate a fresh agent with compact task context from local task memory files.

Use this skill when the user says `task-continue` in a task directory.

---

## Files to read
Read these files if they exist, in this order:
1. `task.notes.md`
2. `task.checkpoint.md`
3. optionally current task files directly related to the request

Do not assume all files exist.

---

## Goal
Build a **small working context** from durable task memory without loading unnecessary history.

This skill should help a fresh agent answer:
- What task state already exists?
- What constraints must be respected?
- What was completed already?
- What is the most likely next step?

---

## Behavior
After reading the files, create a short internal working summary using this shape:

```md
Current task state:
- Completed: ...
- Constraints: ...
- Important notes: ...
- Latest checkpoint: ...
- Likely next step: ...
```

This summary should stay compact and should **not** copy the full contents of the files unless necessary.

---

## Context budget rules
Target the loaded working summary to roughly **100-250 words**.

Do not dump entire files into the live context unless the files are already very small.

Prefer:
- most recent checkpoint
- active constraints
- unsatisfied dependencies
- latest important decisions

Ignore stale or low-value detail.

---

## Procedure
1. Check whether `task.notes.md` exists.
2. Check whether `task.checkpoint.md` exists.
3. Read both if available.
4. Extract only high-signal items.
5. Build a compact working summary for the current agent.
6. Continue the task using that summary plus the user's current request.

---

## Priority rules
When files disagree, prefer in this order:
1. explicit current user instruction
2. latest note in `task.notes.md`
3. latest checkpoint in `task.checkpoint.md`
4. older checkpoints

If there is a clear conflict, mention it briefly before proceeding.

---

## Recommended interpretation
- `task.notes.md` = stable key facts, constraints, warnings
- `task.checkpoint.md` = timeline of completed durable progress

Together they should be enough for a fresh agent to resume effectively in most cases.

---

## Success criteria
A fresh agent should be able to start useful work quickly without:
- rereading a giant old thread
- repeating already completed work
- missing critical constraints
- wasting most of its context window on history
