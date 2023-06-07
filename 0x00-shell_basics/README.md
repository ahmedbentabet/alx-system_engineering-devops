#0x00-shell_basics
pwd : Print the absolute path name of the current working directory.
ls : Display the contents list of your current directory.
cd ~ : Change the working directory to the user’s home directory.
ls -l : Display current directory contents in a long format.
ls -al : Display current directory contents, including hidden files (starting with .). Use the long format.
ls -lna : Display current directory contents (Long format, with user and group IDs displayed numerically and hidden files).
mkdir /tmp/my_first_directory : Create a directory named my_first_directory in the /tmp/ directory.
mv /tmp/betty /tmp/my_first_directory : Move the file betty from /tmp/ to /tmp/my_first_directory.
rm /tmp/my_first_directory/betty : Delete the file betty (The file betty is in /tmp/my_first_directory).
rm -r /tmp/my_first_directory : Delete the directory my_first_directory that is in the /tmp directory.
cd - : Change the working directory to the previous one.
ls -la . .. /boot : List all files (even ones with names beginning with a period character, which are normally hidden) in the current directory and the parent of the working directory and the /boot directory (in this order), in long format.
file /tmp/iamafile : Print the type of the file named iamafile. The file iamafile is in the /tmp directory.
ln -s /bin/ls __ls__ : Create a symbolic link to /bin/ls, named __ls__. The symbolic link should be created in the current working directory.
cp -u *.html .. : Copy all the HTML files(.html) from the current working directory to the parent of the working directory, but only copy files that did not exist in the parent of the working directory or were newer than the versions in the parent of the working directory.
mv [[:upper:]]* /tmp/u : Move all files beginning with an uppercase letter to the directory /tmp/u.
rm *~ : Delete all files in the current working directory that end with the character ~.
mkdir -p welcome/to/school : Create the directories welcome/, welcome/to/ and welcome/to/school in the current directory. You are only allowed to use two spaces (and lines) in your script, not more.
ls -mpa : List all the files and directories of the current directory, separated by commas (,). (Directory names should end with a slash (/), Files and directories starting with a dot (.) should be listed, The listing should be alpha ordered, except for the directories . and .. which should be listed at the very beginning, Only digits and letters are used to sort; Digits should come first, You can assume that all the files we will test with will have at least one letter or one digit
The listing should end with a new line.
