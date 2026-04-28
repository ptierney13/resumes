# Agent Environment Notes

Use this note when an agent shell fails to find common Windows executables by name.

## Claude Code Environment (Current)

Claude Code has both a Bash tool (Git Bash / MINGW64) and a dedicated PowerShell tool. As of 2026-04-28:

- `git`, `python`, `pdflatex`, and `xelatex` are resolvable by name from bash — no full-path workarounds needed for these.
- `powershell` and `powershell.exe` are NOT on the Git Bash PATH. To run PowerShell scripts from bash, use the full path: `/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -ExecutionPolicy Bypass -NoProfile -File .\scripts\<name>.ps1`
- The Claude Code PowerShell tool may also be available depending on context; if so it runs scripts directly without any path workaround.

## Codex Environment (Historical)

The Codex workspace shell PATH did not include standard machine entries such as `C:\Windows\System32`, requiring full-path workarounds for most executables.
- `C:\Windows\py.exe` routed to a Windows Store Python alias that failed with `Access is denied`. The real interpreter was at `C:\Python311\python.exe`.
- These workarounds are preserved in `AGENTS.md` for reference if Codex is used again.

## Known Good Paths On This Machine

- `cmd`: `C:\Windows\System32\cmd.exe`
- `where`: `C:\Windows\System32\where.exe`
- `reg`: `C:\Windows\System32\reg.exe`
- `powershell`: `C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe`
- `git`: `C:\PROGRA~1\Git\cmd\git.exe`
- `python`: `C:\Python311\python.exe`
- `pdflatex`: `C:\Users\ptier\AppData\Local\Programs\MiKTeX\miktex\bin\x64\pdflatex.exe`
- `xelatex`: usually the same MiKTeX bin directory when installed; confirm with `scripts/show_tool_locations.ps1`

## Reusable Patterns

- Windows built-in tools live under `C:\Windows\System32`.
- Git installs normally end up under `C:\Program Files\Git\cmd\git.exe`; the short-path form `C:\PROGRA~1\Git\cmd\git.exe` is convenient for `cmd` invocations.
- The working Python on this machine lives at `C:\Python311\python.exe`, not under `WindowsApps`.
- MiKTeX tools live under `C:\Users\ptier\AppData\Local\Programs\MiKTeX\miktex\bin\x64\`.

## Fastest Recovery

- Inspect current known locations with:
  - `C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -NoProfile -File .\scripts\show_tool_locations.ps1`
- Run a one-off command with a repaired PATH using:
  - `C:\Windows\System32\cmd.exe /c call .\scripts\with-agent-path.cmd git --version`
  - `C:\Windows\System32\cmd.exe /c call .\scripts\with-agent-path.cmd python --version`
- Install cross-workspace Codex shims and repair the user PATH with:
  - `C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -NoProfile -File .\scripts\install_codex_tool_shims.ps1`
- Repository PowerShell scripts should resolve `python` and LaTeX tools through `scripts/tool-paths.ps1` instead of hardcoding a single install path.

## If You Want A Persistent User PATH Fix

Add these directories to the user PATH and restart Codex:

- `C:\Windows\System32`
- `C:\Windows`
- `C:\PROGRA~1\Git\cmd`
- `C:\Python311`

The installer script above writes global command shims to `C:\Users\ptier\.local\bin` and also appends the known-good tool directories to the user PATH.
The `scripts/show_tool_locations.ps1` output includes both the entries missing from the current shell and a one-line bootstrap PATH value for this machine.
