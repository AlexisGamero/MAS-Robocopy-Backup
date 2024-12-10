# MAS-Robocopy-Backup

This script series gives you the option to copy and save to another place your MAS executable and memory.

## Details

This script makes a backup of Monika's files to a specified destination and supports bidirectional synchronization.

---

## Supported Features
- Copy MAS executables and memory from Local → Remote
- Copy MAS executables and memory from Remote → Local
- Synchronize files bidirectionally to prevent data loss

### Note:

The LocalMonika.bat is in spanish, and the LocalMonika.bat is in english.

---

## Directories and details

The script has some pre-defined directories, configured by default as it follows:

- `EXEC_LOCAL=D:\DDLC-1.1.1-pc`
- `EXEC_TABL=%userprofile%\Desktop\DDLC-1.1.1-pc`
- `EXEC_REMOTE=Z:\DDLC-1.1.1-pc`
- `MEM_LOCAL=%appdata%\RenPy`
- `MEM_REMOTE=Z:\RenPy`
  
### Explanation
 - `EXEC_LOCAL`: Points to your `DDLC.exe` directory on your primary machine.
 - `EXEC_TABL`: Points to your `DDLC.exe` folder on your secondary machine (if you need that)
 - `EXEC_REMOTE`: The target directory, where you want to save your backup.
 - `MEM_LOCAL`: Points to the `RenPy` folder on your machine. (Usually you _don't need to modify this_, unless you already modified your `0config.rpyc` to change the persistent directory).
 - `MEM_REMOTE`: The backup directoty for `RenPy` folder

**You can change this directories to match your setup.**

---

## Usage

When running the script, you will be given these options:

- Sync MAS executables (Local → Remote)
- Sync MAS executables (Remote → Local)
- Sync memory files (Local → Remote)
- Sync memory files (Remote → Local)
- Sync all MAS files (Local → Remote)
- Sync all MAS files (Remote → Local)
- Exit

Simply choose the corresponding option to execute the operation you need.

---

## Common Errors

### 1. Directory not found

The script will notify you which directory doesn't exist. Double-check the paths configured under EXEC_* and MEM_* settings.

### 2. Permission Errors

Ensure you're not attempting to save or access restricted directories like `C:\Windows` or `C:\System Volume Information`. Run the script with administrative permissions if needed.

---

## Important Notes

### ⚠️ Backup Before First Use

Although this script should not delete any data, always make a backup before running it for the first time.

### 🧐 Review Operations Twice

Check the paths and operation modes thoroughly to ensure nothing unintended happens.

---

## Found a Bug, Typo or have any Suggestion?

If you encounter any errors, please feel free to open an issue in this repository. I'll do my best to troubleshoot and fix the problem as quickly as possible!

Your feedback is much appreciated! 💚

#### Just Monika 💚
![Monika](https://media1.tenor.com/m/0iOx72NNOFIAAAAd/monika-hug.gif)
