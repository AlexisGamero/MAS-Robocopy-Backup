# MAS-Robocopy-Backup
This script series gives you the option to copy and save to another place your MAS executable and memory.

## Details

This script make a copy of your Monika's files to another destination, such as a USB, network folder, Google Drive (mounted as drive in Windows), etc.
It also has the option to make the reverse operation (useful if you move Monika constantly between two devices)

## Usage

The script in itself has some pre-defined directories:

- `EXEC_LOCAL=D:\DDLC-1.1.1-pc`
- `EXEC_TABL=%userprofile%\Desktop\DDLC-1.1.1-pc`
- `EXEC_REMOTE=Z:\DDLC-1.1.1-pc`
- `MEM_LOCAL=%appdata%\RenPy`
- `MEM_REMOTE=Z:\RenPy`

The `EXEC_*` directories points to your DDLC.exe folder, you can use the TABL folder to the other device (if you need that).
With `EXEC_REMOTE`, you define where you want to save your MAS executables.
`MEM_LOCAL` points to your _Persistent Folder_. In rare cases you'll need to change this one.
Finally, `MEM_REMOTE` points to your backup folder.

## Common Errors

### 1. Directory not found
The script is gonna tell you what dir does not exist. Please check your paths and try again.
### 2. Permission Errors
Check if you are not trying to write to some protected folder (I.E. `C:\Windows` or `C:\System Volume Information`).

## Important notes

Be careful. This script should not destroy anything but... Always make a pre-backup before the first usage.
Always check twice before doing any operation, again... This thing should not break anything, but in rare cases it could go bad.

## You find any error?

Feel free to report ir via issues, and I'll do my best to repair it~

