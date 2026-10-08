# Dotfiles

To utilize this first install packages

`make & sudo make install`

Install tmux plugins
`<Ctrl-Space> + I`

# Windows
Be sure to set the following env var:
`export BROWSER=/usr/bin/wslview`

in the ~.env_file.


## Setup Instructions

1. Install a [Nerd Font](https://www.nerdfonts.com/)(Hack)
2. Install [Wezterm](https://wezterm.org/)
3. Install git
4. Clone the repo `git clone git@github.com:mlcamilli/dotfiles.git`
5. Run `make install`

## Language versions

Managed by [mise](https://mise.jdx.dev/). Global versions live in
`.config/mise/config.toml`, symlinked to `~/.config/mise/config.toml` by `make link`.

- `mise install` — install everything in the config
- `mise use -g node@24` — bump a global version (edits the symlinked config)
- `mise use node@24` — pin a version for the current project (writes `mise.toml`)

## herdr (experimental)

[herdr](https://herdr.dev/) is an agent-aware terminal multiplexer, running
alongside tmux rather than replacing it. Install is opt-in and deliberately
outside the `install` / `light` chains so a fresh bootstrap never depends on it:

```
make link   # symlinks config.toml and the herdr-plus config dirs
make herdr  # installs herdr + the herdr-plus plugin from upstream
```

- `.config/herdr/config.toml` — Dracula theme and tmux-parity keybindings
  (prefix `C-Space`, `prefix h/j/k/l` pane focus, `prefix |` / `prefix -`
  splits, `prefix x` close tab). Each binding is commented with its
  `.tmux.conf` original.
- `.config/herdr/herdr-plus/projects/*.toml` — workspace templates, the herdr
  equivalent of `.tmuxp/`. Open the fuzzy browser with `prefix+Up`, or
  `herdr-plus open <name>`. Defined so far: `dot`, `rhythm`.
- `.config/herdr/herdr-plus/worktrees/*.toml` — layouts applied automatically
  when `herdr worktree create`/`open` makes a workspace for a matching repo
  (matched on repo basename). Nothing to invoke; the file's existence is the
  switch.

Projects and worktree layouts share one shape: nvim left, `claude` top-right,
shell bottom-right. Quick Actions is on `prefix+Down`.

Both are also reachable from herdr's action menu without any keybinding.

### Gotchas

- Invalid keybindings are disabled individually rather than rejecting the file,
  so a typo fails silently. Run `herdr config check` after editing, then
  `herdr server reload-config`.
- `close_tab` / `close_pane` deliberately invert herdr's defaults to match
  `.tmux.conf`; `herdr config reset-keys` would undo that.
- A malformed file in `projects/` or `worktrees/` fails the whole directory's
  load, not just that entry.
- herdr-plus panes have no `focus` key, so the focused pane after opening a
  project is whatever herdr picks.
