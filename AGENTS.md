# AI Instructions — chaffee.zsh-theme

Personal Oh My Zsh theme. Single file: `chaffee.zsh-theme`.

## What this is

A custom zsh prompt theme showing git/SVN status, language version info (Java, Node, Python, Ruby, Go, Scala), current directory, time, and user privilege indicator. Supports multiple prompt layouts via `prompt_set 1|2|3|4`.

## Conventions

- Pure zsh — no external dependencies beyond Oh My Zsh helpers
- Symbols are Unicode — check rendering in the target terminal before adding new ones
- Helper functions are prefixed by language (e.g. `java_prompt_info`, `node_prompt_info`)
- Keep prompt evaluation fast — avoid slow subprocess calls in the critical path
