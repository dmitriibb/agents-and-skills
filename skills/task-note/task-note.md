# task-note

## Purpose
Save a short, important, durable note into `task.notes.md`.

Use this skill when the user says:
- `task-note ...`
- `remember this for the task ...`
- `important note ...`

This file is for **constraints, decisions, warnings, assumptions, and key reminders** that a future agent should know immediately.

---

## Files used
- Read if present: `task.notes.md`
- Update or create: `task.notes.md`

---

## What belongs here
Good note types:
- API of service X must not be changed
- Use shared auth modal, not a new page
- Repo B is read-only for this task
- Do not rename public DTOs
- Need backward compatibility with legacy mobile client
- Waiting for backend team answer on token refresh behavior
- Branch `feature/ABC-123-ui-login` is already created

Do not store:
- long status updates
- detailed implementation logs
- raw copied chat text
- temporary thoughts that are likely to become irrelevant soon

---

## Output format
Use this structure inside `task.notes.md`:

```md
# Task Notes

- Constraint: Do not change backend API contracts.
- Decision: Use existing auth modal instead of building a new login page.
- Warning: Mobile header layout is fragile around widths below 360px.
- Open dependency: Waiting for design confirmation on navigation labels.
```

---

## Writing rules
1. Add one bullet per durable note.
2. Start each bullet with a short label such as:
   - `Constraint:`
   - `Decision:`
   - `Warning:`
   - `Assumption:`
   - `Dependency:`
   - `Branch:`
3. Keep each note to **one line** whenever possible.
4. If a new note supersedes an old one, update or replace the older note instead of keeping both.
5. Deduplicate aggressively.

---

## Compression rules
Target file size:
- usually **5-20 bullets max**
- each bullet ideally under **20 words**

This file must stay highly signal-dense.

---

## Procedure
1. Read the user's note text.
2. Convert it into a short durable bullet.
3. Read existing `task.notes.md` if present.
4. Merge, deduplicate, and update superseded notes.
5. Save the result.

---

## Success criteria
A fresh agent reading `task.notes.md` should instantly know:
- hard constraints
- important decisions
- dangerous areas
- external dependencies
- critical reminders

The file should feel like a compact task memory, not a diary.
