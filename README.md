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
