---
name: grill-me
description: Interrogate an idea, plan, requirement, or decision to expose assumptions, resolve uncertainty, and produce a shared brief before action. Use only when the user explicitly invokes `$grill-me`, `/grill-me`, or says "grill me" as an instruction. Never activate implicitly, even when a request is vague. Supports easy, medium (default), and hard intensity.
---

# Grill Me

Turn the user's rough idea into a clear, pressure-tested brief through an adaptive interview.

## Set the intensity

Read the level from the invocation. Use `medium` when no level is stated; do not spend a question confirming it.

- `easy`: Ask only the 1–3 highest-impact questions. Resolve essentials needed to avoid building the wrong thing.
- `medium`: Ask roughly 4–8 focused questions. Cover the important goals, scope, constraints, trade-offs, and failure modes.
- `hard`: Continue until every material branch is resolved. Probe contradictions, dependencies, edge cases, operational concerns, and accepted risks; use no arbitrary question limit.

Treat counts as guidance. Do not ask low-value questions merely to reach a quota. If an answer reveals a critical new uncertainty, follow it even in easy or medium mode.

## Prepare

1. Extract what is already known: desired outcome, audience, scope, constraints, decisions, assumptions, dependencies, and unknowns.
2. When relevant, inspect available files, configuration, documentation, or tools for discoverable facts. Ask the user for judgments and preferences, not facts the agent can obtain safely.
3. Build a private decision tree. Prioritize questions by impact, uncertainty, dependency, and cost of being wrong.
4. Resolve upstream decisions before dependent details.

Do not implement, edit files, or take consequential action while the interview is active.

## Interview

Ask exactly one focused question per turn, then wait for the answer. Never dump a questionnaire.

For each question:

- Name the decision being settled.
- Ask a concrete question; avoid vague prompts such as "tell me more."
- Offer a recommended answer with a brief reason when enough context exists.
- Use concise options when they make the trade-off easier to evaluate.
- Explain why the question matters only when that is not obvious.

Adapt after every answer:

- Record the decision and update the remaining branches.
- Do not re-ask answered questions or challenge settled choices without new evidence.
- Surface contradictions directly and ask which priority wins.
- Distinguish facts, assumptions, preferences, and unresolved decisions.
- Challenge the premise when the proposed solution may not address the underlying need.
- Skip irrelevant checklist areas; pursue only branches that could materially change the outcome.

For hard mode, consider these lenses only when relevant: underlying problem, users, success measures, scope and non-goals, workflows, data, integrations, security and privacy, accessibility, performance, failure handling, migration, compatibility, operations, testing, rollout, cost, timeline, ownership, reversibility, and legal or compliance constraints.

The user may say `stop`, `skip`, `use your recommendation`, or change intensity at any time. Respect that immediately.

## Finish

Stop according to the selected intensity:

- `easy`: The core intent and the most consequential constraint or choice are clear.
- `medium`: All high-impact decisions are resolved or explicitly recorded as assumptions.
- `hard`: The plan is coherent, no material uncertainty remains hidden, and residual risks are explicitly accepted or deferred.

Return a concise **Grill complete** summary containing:

- Goal and success criteria
- Decisions and accepted trade-offs
- Constraints and assumptions
- Scope and explicit non-goals
- Remaining risks or deferred questions
- Recommended next step

Ask the user to confirm or correct the summary. On confirmation, end the interview and follow the user's next instruction; confirmation alone does not authorize implementation.
