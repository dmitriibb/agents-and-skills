#!/usr/bin/env bash
set -euo pipefail

SOURCE_FILE="${HOME}/.agents/AGENTS.md"

OPENCODE_DIR="${HOME}/.config/opencode"
OPENCODE_FILE="${OPENCODE_DIR}/AGENTS.md"

CODEX_DIR="${HOME}/.codex"
CODEX_FILE="${CODEX_DIR}/AGENTS.md"

CLAUDE_DIR="${HOME}/.claude"
CLAUDE_FILE="${CLAUDE_DIR}/CLAUDE.md"

COPILOT_DIR="${HOME}/.copilot/instructions"
COPILOT_FILE="${COPILOT_DIR}/global-agent.instructions.md"

if [[ ! -f "${SOURCE_FILE}" ]]; then
  printf 'Source file not found: %s\n' "${SOURCE_FILE}" >&2
  exit 1
fi

mkdir -p "${OPENCODE_DIR}" "${CODEX_DIR}" "${CLAUDE_DIR}" "${COPILOT_DIR}"

cp "${SOURCE_FILE}" "${OPENCODE_FILE}"
cp "${SOURCE_FILE}" "${CODEX_FILE}"
cp "${SOURCE_FILE}" "${CLAUDE_FILE}"

{
  printf -- '---\n'
  printf -- 'applyTo: "**"\n'
  printf -- '---\n\n'
  cat "${SOURCE_FILE}"
} > "${COPILOT_FILE}"

printf 'Synced agent instructions to:\n'
printf '  OpenCode: %s\n' "${OPENCODE_FILE}"
printf '  Codex:    %s\n' "${CODEX_FILE}"
printf '  Claude:   %s\n' "${CLAUDE_FILE}"
printf '  Copilot:  %s\n' "${COPILOT_FILE}"
