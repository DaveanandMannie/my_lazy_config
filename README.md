# 💤 LazyVim Config

This is my personal **LazyVim** configuration, designed to run seamlessly on both **WSL (Windows)** and **bare-metal Linux** environments. It also integrates cleanly with external tools like `wezterm` and `lsd`.

---

## 🧭 Branch Usage

| Branch  | Target Platform     | Description                          |
|---------|---------------------|--------------------------------------|
| `main`  | Windows (via WSL)   | Tuned for WSL-specific enhancements  |
| `linux` | Native Linux system | Designed for full Linux installations |

> 🔁 Switch branches depending on your platform. Each has slight differences in environment assumptions and plugin behavior.

---

## 🔗 External Config Links

Some external tool configurations live in the **parent directory** of this repo. You’ll need to **symlink or hard link** them into the appropriate locations:

### 📁 `lsd` – Pretty Directory Listings

- **Target**: `~/.config/lsd/config.yaml`  
- **Source**: `<repo-root>/lsd-config.yaml`  
- **Link Type**: **Symlink**

```zsh
mkdir -p ~/.config/lsd
ln -s <path-to-repo>/lsd-config.yaml ~/.config/lsd/config.yaml



