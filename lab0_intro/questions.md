# Warmup Questions

1.  What is the clone url of this repository?
    > https://github.com/lopezfelipe93/lab_vision.git
      https://github.com/lopezfelipe93/lab_vision/edit/master/lab0_intro/questions.md

2.  What is the output of the ``cal`` command?
    The ``cal`` command displays a calendar only showing the current month. For example:
     FelipeLopez$ cal
     
             February 2015
        Su Mo Tu We Th Fr Sa
        1  2  3  4  5  6  7
        8  9 10 11 12 13 14
        15 16 17 18 19 20 21
        22 23 24 25 26 27 28

# Homework Questions

1.  What is the ``grep``command?
    >  The command ``grep`` means "Globally search a Regular Expression and Print" and it can be used to look for lines in plain        text files containing the string following the ``grep``command. It looks for text inside the files so it is useful when you         don't know or don't remember the name of the file. 
    
2.  What is a *makefile*?
    >  It is a special file containing shell commands. When the command make is executed, inside the directory that contains the         makefile, the makefile will be executed and with it the shell commands it contains.

3.  What is *git*?
    >  A *git* is a system that allows its users to control different versions of a file or code. It allows for multiple users to       make changes and do multiple contributions to the file.

4.  What does the ``-prune`` option of ``find`` do? Give an example
    >  The `-prune`` option inside the ``find`` command allows the user to exclude a given directory from the search done by the        ``find`` command. This exclusion will limit the search and make it more precise, for example if you want to search for some         files related to clients but you want to exclude the clients from 2014 you exclude that directory form the search by the            -prune option. The code would look like:
    FelipeLopez$ find . -name '2014*' -prune -o -name '*.client'

<<<<<<< HEAD
5.  Where is the file ``xxxxxx``
    > The file could not be found. Permission was denied and the file was not found.   
    [vision@guitaca ~]$ find / -name 'xxxxxx'
        ...
        ...
        ...
        find: '/proc/31927/ns': Permission denied
        find: '/root': Permission denied


6.  How many files with ``gnu`` in its name are in ``/usr/src``
    >  There were 656 files with gnu in its name in the given directory.
       [vision@guitaca ~]$ cd /usr/src
       [vision@guitaca src]$ find / -name '*gnu*'| wc -l
       ...
       ...
      656
      [vision@guitaca src]$ 


7.  How many files contain ``gpl`` inside in ``/usr/src``
    >  [vision@guitaca ~]$ cd /usr/src
       [vision@guitaca src]$ grep -r 'gpl' | wc -l
       367
=======
5.  Where is the file ``grub.cfg``
    >   answer

6.  How many files with ``gnu`` in its name are in ``/usr/src``
    >   answer

7.  How many files contain ``gpl`` inside in ``/usr/src``
    >   answer
>>>>>>> FETCH_HEAD

8.  What does the ``cut`` command do?
    >  The ``cut`` command allows you to extract a part of a file determined by the parameters following the command. 

9.  What does the ``wget`` command do?
    >  It allows the user to download files, websites, programs...  from the internet by providing the domain.

10.  What does the ``diff`` command do?
    >  The ``diff`` command allows the user to compare two files and find their differences. It could be used to compare two        different versions of the same file.

11.  How many users exist in *Guitaca*?
    >   There are 48 users in *Guitaca*.

        [vision@guitaca ~]$ cat listausuarios.txt | wc -l
        48

12. What command will produce a table of Users and Shells sorted by shell (tip: using ``cut`` and ``sort``)
    >   answer

13. What command will produce the number of users with shell ``/sbin/nologin`` (tip: using ``grep`` and ``wc``)
    > [vision@guitaca ~]$  grep '/sbin/nologin' listausuarios.txt | wc -l
        41

14.  What is the name of the linux distribution running on *Guitaca*?
    >   [vision@guitaca ~]$ cd /proc
        [vision@guitaca proc]$ cat version

Linux version 3.17.8-200.fc20.x86_64 (mockbuild@bkernel02.phx2.fedoraproject.org) (gcc version 4.8.3 20140911 (Red Hat 4.8.3-7) (GCC) ) #1 SMP Thu Jan 8 23:26:57 UTC 2015

        [vision@guitaca ~]$ cd /etc
        [vision@guitaca etc]$ cat issue
        Fedora release 20 (Heisenbug)
        Kernel \r on an \m (\l)

15. Create a script for finding duplicate images based on their content (tip: hash or checksum)
    You may look in the internet for ideas, but please indicate the source of any code you use
    Save this script as ``find_duplicates.sh`` in this directory and commit your changes to github

16. What is the meaning of ``#! /bin/bash`` at the start of scripts?
    >   The function of the ``#! /bin/bash`` is to indicate the shell which program to interpret the script with during execution.      In this case the script will be interpreted with the bash shell.

17. How many unique images are in the ``sipi_images`` folder?
    >   answer
    
