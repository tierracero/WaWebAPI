# Commit Rules

Git and repository safety rules for WaWebAPI.

## Before Work

Capture the baseline:

```bash
git status --short --untracked-files=all
```

## Preservation Rules

- Preserve unrelated staged, unstaged, and untracked files.
- Never run destructive operations such as `reset`, `clean`, `restore`, forced checkout, or stash operations on user work unless explicitly requested.
- Do not modify `.git/**`, `.swiftpm/**`, `.build/**`, `xcuserdata/**`, or `.DS_Store` files.
- `Package.resolved` is currently ignored by `.gitignore`; do not intentionally alter dependency resolution unless dependency work explicitly requires it.

## Commit Rules

- Never commit unless the user explicitly requests a commit.
- Include only approved task-scope files.
- Use a concise imperative subject that identifies the real change.
- Do not add agent attribution to commits or source headers.
- Do not amend, squash, rebase, force-push, or rewrite history unless explicitly requested.

## Conflict Rule

If an approved file contains unexpected user changes, stop modifying that file and report the conflict rather than overwriting it.

## After Work

Run:

```bash
git status --short --untracked-files=all
git diff --check
```

Review the full diff and confirm only expected paths changed.
