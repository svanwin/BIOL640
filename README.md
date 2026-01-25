### **Purpose/Summary:**

Chapter 1 of the tutorial provided an introduction to UNIX. In particular using “man” and “ssh”. Chapter 2 provided a tutorial on using the file system within your computer/linux program (Ubuntu). In particular, “cd” “ls” and “pwd” were used to explore directories.

### **Protocol:**

#### Chapter 1:

* Activated feature to use UNIX terminal on latest version of Windows 10 using this link: [http://www.howtogeek.com/249966/how-to-install-and-use-the-linux-bash-shell-on-windows-10/](http://www.howtogeek.com/249966/how-to-install-and-use-the-linux-bash-shell-on-windows-10/)
* Installed Ubuntu and opened terminal
* _I had trouble downloading/installing apps for use of ssh command in bash terminal_- _Will need to seek help in connecting to remote computer when the time comes_

Using "man" command to view ssh command manual

#### Chapter 2:
* I found that my "ls" command was failing because I needed a space after “ls” and after the “..”
* Initially, I thought the chapter2 file would be in my srvanwin folder, but then I realized it was a zipfile so it would create another folder (blue “unix_course_data” in the terminal output). Thus, I used “ls” to look inside that folder and found the chapter2 file.
* Following the tutorial I received a “no such file or directory” message when I tried to access the unix_course_chapter2 folder. I tried using the unix_course_data folder instead. Then I moved back up using “cd ..”
* With some trial and error I was able to use the commands learned in the tutorial to look inside the unix_course_data folder.
* I finally found the “file_tree” folder & then backed up to my original directory (but not in one command?).
	* I learned that you can only go step by step up the directory pathway (you can’t skip through to file_tree for example).
* I then worked my way through the directory to find the file “print_this_with_cat.txt”
* The “~” is the shortcut to the home directory.
	* _Relative paths_: useful when you are inside a project, or if something needs to be moved all together.
	* _Absolute paths_: useful when you know filesystem and need to run commands from different directories.
	* _The root directory (/)_ is the very top level of the filesystem that contains all other systems and user files. The home directory (~) is user-specific where personal files and work can be stored (for me, that is srvanwin).

**_The “..” means “the directory above the current” so to go up a level you use “cd ..” to go up two levels I could use “cd../..” and so on. If I use “cd ~” I go straight to my home directory. This also applies to listing. I could list one level by using “ls ..” and two by listing “ls ../..”_**

### Chapter 1 and 2 Code filed [on github](https://github.com/svanwin/BIOL640/blob/main/UnixTutorial_Chapter1_and_2) 

#### Chapter 3:
* -i  flag provides some protection when moving/renaming/removing files
* I had trouble creating a file (yourfile.txt) but I could go into the directory manually and make the file and then edit it using nano. 
* cannot remove a directory using rmdir if there are files within it
* can remove a directory using the dangerous code line "rm -r" but if you use -i flag then you can always double check and enter "y" or "n" if you don't want to continue. 
* Section 3.6.2 I had issues copy-pasting the code to download the tarball
* I thought it was interesting that the combined_A.fa still had the information from the original "A" file that we delete in this section. I guess it is because the files in linux are separate even though they were combined into the one output file. 
	* plain text files- people are capable of reading and comprehending
	* binary files are mainly used for computer purposes/computer reading
	* compressed files can save space/store more without taking up room on the computer
	* Huge datasets in bioinformatics need compressed files b/c of storage space and processing
	* unix is powerful but it would be easy to make a mistake and remove/delete something that you need and be unable to recover it
### Chapter 3 code filed [on github](https://github.com/svanwin/BIOL640/commit/bb9f77a3b18d3ed1c8562f45359f1f9c96096314)

#### Chapter 4
* I think it is interesting that the diff cmd showed my edits to the header (but since I only added a space, I was a little confused at first). 
* I am having trouble downloading the gzipped FASTQ-file but could complete everything with the subset.
* 	I was able to find the files and go through the code in the chapter tutorial. The code file on github is marked as "full GFF and FASTQ files chapter 4"
* **Chapter 4** code filed on [github](https://github.com/svanwin/BIOL640/commit/81c3fd51dd43c4def287dd2f7fb6b3db454b94e8) through section 4.3.5
* It is important to keep track of single vs. multi line (wrapping) because it will impact how you process the data in unix- some cmds assume one or the other
* FASTQ format is designed for sequencing reads 

**General Notes**

On Ubuntu, you need to prefix a command with sudo to [run it with root permissions](https://www.howtogeek.com/111479/htg-explains-whats-the-difference-between-sudo-su/). The "root" user on UNIX platforms has full system access, like the "Administrator" user on Windows. Your Windows file system is located at /mnt/c in the Bash shell environment.

