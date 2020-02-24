# Simple Windows User Backup Script

## Features

- Robustness: Uses robocopy
- Simplicity: Answer three questions to start the backup
- Versatility: Supports separate backups for multiple users on one or multiple machines

## Example 1

	Welcome to swubs, the simple windows user backup script.
	Let me help you back up your user directory
	from this source: C:\Users\bob\
	  to this target: C:\Users\bob\simple-windows-user-backup-script\Backup\bobscomputer_bob\
	1/3 Is this the target directory where your backup should be saved? y/n n
	Place the script "backup_start" where you want your backup to reside and start it from there.

## Example 2

	Welcome to swubs, the simple windows user backup script.
	Let me help you back up your user directory
	from this source: C:\Users\bob\
	  to this target: D:\Backup\bobscomputer_bob\
	1/3 Is this the target directory where your backup should be saved? y/n y
	2/3 Do you want to replace the last backup? y/n n
	New backup target: D:\Backup\bobscomputer_bob_2020-02-21\
	3/3 Start backup? y/n

## Example 3

	Welcome to swubs, the simple windows user backup script.
	Let me help you back up your user directory
	from this source: C:\Users\bob\
	  to this target: D:\Backup\bobscomputer_bob\
	1/3 Is this the target directory where your backup should be saved? y/n y
	2/3 Do you want to replace the last backup? y/n y
	3/3 Start backup? y/n y
	Creating backup...
	[...]
	Sorry, your backup failed.
	Call someone for help.
	Help your helper by sending this file: D:\Backup\Log\bobscomputer_bob_2020-02-20.txt
