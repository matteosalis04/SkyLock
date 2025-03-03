---

# SkyLock - Backup System 🔐

SkyLock is a secure and advanced backup system designed to simplify the protection of your most important files. With randomly generated passwords and data encryption, SkyLock ensures that your backups remain safe and protected from unauthorized access.

### Key Features:

- **Secure Backup**: Automatically copies and stores files based on your specific needs (e.g., by file type).
- **Advanced Encryption**: Automatically generates passwords to encrypt your backups in zip format, ensuring maximum security.
- **Detailed Logging**: Complete log of backup operations, including size, number of files, and process duration.
- **Easy Configuration**: Simple to use, with support for customizing files and users to include in the backup.
- **Full Automation**: A single command to execute backups, encrypt files, and keep them secure.

---

### How It Works

1. **Secure Password Generation**: When you run SkyLock, it generates a random password to encrypt your backups securely.
2. **File Selection**: You can choose which files (e.g., PDF, JPG, TXT) to include in the backup, specifying a user or leaving it empty to include all.
3. **Backup and Storage**: SkyLock copies selected files into the `/backup` folder, creates a zip archive, and encrypts it with the generated password.
4. **Detailed Log**: Every operation is recorded in a log file for easy monitoring.
5. **Final Cleanup**: After encryption, temporary files are deleted to ensure maximum security.

---

### Installation

To use SkyLock, simply clone the repository and run the script:

```bash
git clone https://github.com/matteosalis04/SkyLock.git
cd SkyLock
chmod +x skylock.sh
./skylock.sh
```

---

### Parameters:

- **File Type**: Specify the type of files you want to include in the backup (e.g., pdf, txt, jpg).
- **User**: Choose to back up files from a specific user or all users (leave empty for all).

---

### Example Usage:

```bash
$ ./skylock.sh
Which files do you want to save (e.g., pdf, txt, jpg): pdf
Enter the user (leave empty for all): username
```

---

### What Does SkyLock Do?

- Generates a secure password for each backup session.
- Creates a temporary `/backup` folder and copies all specified files.
- Creates a password-protected zip archive.
- Saves a complete log of the operation for easy tracking.
- Removes temporary files to prevent any unsecured data from remaining on the system.

---

### License

This project is released under the [MIT License](https://opensource.org/licenses/MIT).

---

### Useful Links

- GitHub: [https://github.com/matteosalis04](https://github.com/matteosalis04)

---
