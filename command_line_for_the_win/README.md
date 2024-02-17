# Command line for the win

## File Transfer Using SFTP

In this project, I needed to transfer files to a sandbox environment using the SFTP command-line tool. Here are the steps I followed:

### 1. Take Screenshots:

Capture screenshots of the completed levels as per the general requirements.

### 2. Open Terminal/Command Prompt:

Open a terminal or command prompt on your local machine.

### 3. Use SFTP to Connect:

Use the SFTP command-line tool to establish a connection to the sandbox environment. You will need the hostname, username, and password provided for the sandbox environment.

```bash
sftp username@hostname
```

Replace `username` with your actual username and `hostname` with the provided hostname.

### 4. Navigate to Directory:

Once connected, navigate to the directory on the sandbox environment where you want to upload the screenshots.

```bash
cd /path/to/target/directory
```

Replace `/path/to/target/directory` with the actual path.

### 5. Upload Screenshots:

Use the SFTP `put` command to upload the screenshots from your local machine to the sandbox environment.

```bash
put /path/to/local/screenshots/*.png
```

Replace `/path/to/local/screenshots/*.png` with the actual path and filenames of your screenshots.

### 6. Confirm Transfer:

Confirm that the screenshots have been successfully transferred by checking the sandbox directory.

```bash
ls
```

This command will list the files in the current directory on the sandbox.
