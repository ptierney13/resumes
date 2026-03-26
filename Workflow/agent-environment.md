# Agent Environment Notes

Use this note when the Codex shell can see the repository but fails to find common Windows executables by name.

## Current Findings

- As of 2026-03-26, the Codex workspace shell PATH does not include standard machine entries such as `C:\Windows\System32`.
- The machine still has the expected tools installed; the main issue is discovery, not missing software.
- `C:\Windows\py.exe` exists, but it currently routes to a Windows Store Python alias that fails with `Access is denied` in this environment. Prefer the real interpreter path instead.

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
