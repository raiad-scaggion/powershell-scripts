# gitflow.ps1

A simple PowerShell script to automate the common Git workflow of committing changes, pushing to a feature branch, merging into `develop`, and pushing `develop` — all in one command.

## 🚀 Features

- Automatically commits and pushes your current branch
- Switches to `develop`, pulls the latest changes
- Merges your branch into `develop` with `--no-edit`
- Pushes the updated `develop` branch
- Switches back to your original branch
- Provides clean, color-coded logs for each step

## 📦 Requirements

- PowerShell (Windows)
- Git installed and available in PATH

## 🛠️ Installation

1. Save `gitflow.ps1` in a local folder, e.g.:

   ```
   C:\Users\<your-user>\Scripts\
   ```

2. Add that folder to your system `PATH`:
   - Open *System Properties* > *Environment Variables* > *User Variables* > *Path* > *Edit* > *New*
   - Add the path: `C:\Users\<your-user>\Scripts`

3. (Optional) Allow PowerShell scripts to run:

   ```powershell
   Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
   ```

## ⚙️ Usage

```powershell
gitflow.ps1 <branch-name> "<commit message>"
```

### Example:

```powershell
gitflow.ps1 feat/add-login "feat: add login form with validation"
```

## 🧠 How It Works

This script performs the following steps:

1. Switches to the specified branch
2. Stages all changes and commits them
3. Pushes the branch to origin
4. Switches to `develop` and pulls the latest version
5. Merges your branch into `develop` using `--no-edit`
6. Pushes `develop` to origin
7. Switches back to your branch

## 💡 Tip

To run this script more like a native terminal command, you can also create a `gitflow.cmd` wrapper in the same folder:

```cmd
@powershell -ExecutionPolicy Bypass -File "%~dp0gitflow.ps1" %*
```

This allows you to run:

```powershell
gitflow feat/add-login "your message"
```

## 📄 License

MIT

