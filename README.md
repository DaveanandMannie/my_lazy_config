# 💤 LazyVim Config

This is my personal **LazyVim** configuration, designed to run seamlessly on both
**WSL (Windows)** and **bare-metal Linux** environments. It also integrates
cleanly with external tools like `wezterm` and `lsd`.

---

## 🧭 Branch Usage

| Branch  | Target Platform     | Description                          |
|---------|---------------------|--------------------------------------|
| `main`  | Windows (via WSL)   | Tuned for WSL-specific enhancements  |
| `linux` | Native Linux system | Designed for full Linux installations |

> 🔁 Switch branches depending on your platform. Each has slight differences in
environment assumptions and plugin behavior.

---

## 🔗 External Config Links

Some external tool configurations live in the **parent directory** of this repo.
Usual `<path-to-repo>`:

- **linux**: `~/.config/nvim`
- **windows**: `$env:USERPROFILE\appdata\local\nvim`

You’ll need to **symlink or hard link** them into the appropriate locations:

### 📁 `lsd` – Pretty Directory Listings

#### 💲zsh,bash

```zsh
    mkdir -p ~/.config/lsd
    ln -s <path-to-repo>/config_files/lsd_config.yaml ~/.config/lsd/config.yaml
    ln -s <path-to-repo>/config_files/lsd_icons.yaml ~/.config/lsd/icons.yaml
```

####  powershell

```ps1
    Remove-Item "$env:USERPROFILE\.config\lsd\icons.yaml" -ErrorAction Ignore;
    Remove-Item "$env:USERPROFILE\.config\lsd\config.yaml" -ErrorAction Ignore;
    New-Item -ItemType SymbolicLink -Target "$env:USERPROFILE\<path-to-repo>config_files\lsd_icons.yaml"
        -Path "$env:USERPROFILE\.config\lsd\icons.yaml"
    New-Item -ItemType SymbolicLink -Target "<path-to-repo>\config_files\lsd_config.yaml"
        -Path "$env:USERPROFILE\.config\lsd\config.yaml"
```

###  `Wezterm` Terminal Emulator of Choice

####  powershell

```ps1
    [System.Environment]::SetEnvironmentVariable("WEZTERM_CONFIG_FILE", "<path-to-repo>/config_files/wezterm.lua", "User")
```

#### 💲zsh,bash

```zsh
    Included in .zshrc
```

###  ZSH

```zsh
    ln -s <path-to-repo>/zsh/.zshrc ~/.zshrc
