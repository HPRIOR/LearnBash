#----environment-variables----#
echo "$PATH" # paths on machine which the shell will use to search for programs
which echo # which command corresponds to echo

#----useful-stuff----#
pwd # parent working directory
cd . # change directory
# . current dir
# .. parent dir
# - previous dir
# ~ home dir
ls # show files in dir

# most commands take 'flags' and 'options'
# flags do not take args
ls -l # long listing format flag

# ownership rules seen in long format
# -rw-r--r-- owner group
# groups of three (owner perms)(group perms)(everyone else)
# r = read; w = write; x = execute;

mv . . # rename/move path1 path2
cp . . # copy path1 path2
# rm remove file/dir -r (recursive for directories)
mkdir "dirname" # make a directory
man mkdir # gives manual page for a give command
cat hello.txt # displays the content of a file
tail -n1 # print last n lines of output
grep # search an input stream for given keyword
sudo # do something as superuser (as if you are root user)
tee # send to terminal and send to file
open . # open a file with default program (mac)

# logical or
false || echo "hello" # hello
true || echo "hello" # ...short circuit
# logical and
false && echo "hello" # ...short circuit

#----streams----#
# two primary streams input + output
# input by default is terminal input
# output is by default terminal output

# < rewire inputs of this program to be the contents of this file
# > rewire the output of the preceding program into this file

echo hello > hello.txt # redirect standard output to hello.txt

cat < hello.txt # take contents of hello.txt and pass it to input of cat

# make hello.txt input to cat and redirect output to new file
cat < hello.txt > hello2.txt # alternative to copy

# >> append instead of overwrite

#----pipes----#
# | take the output of the left hand side and pass it to input of right
# out---> | in--->

ls -l | tail -n1 # take the output of ls and give me the last item

# programs can interact just by knowing about STDIO
ls -l |tail -n1 > last-dir.txt # output the last dir to txt

#----defining variables----#
foo=bar   # no whitespace
echo $foo

foo2=$(pwd) # storing the result of a command in a variable

#----strings----#
echo "hello $foo" # interpolation with double quotes
echo 'hello $foo' # doesn't work with single quote
echo "hello $(pwd)" # interpolated command

#----functions----#
function mcd (){           # define a function
  mkdir -p "$1"   # $1 is the first argument
  cd "$1"
}

mcd "newdir"  # calling function - spaces separate args

cd ..

# you can source function from shell scripts with the source
source echoargs.sh
echoargs "hello"

# $0 name of current script
# $1 - 9 arguments from 1 - 9
# $# number of arguments given
# $$ process id of command
# $@ all the arguments to command
# $? error code from previous command
# $_ last argument of previous command
# !! repeat last command

#----conditional----#
if [[ "$?" -ne 0 ]]; then # must have spaces between brackets
  echo "the previous command failed"
fi

# flags can be used for comparisons
# man test for details

#----globbing----#
ls *.sh # find files with sh extensions
ls somefile?? # find some file that may possibly have extra two chars

convert image.png image.jpg
convert image.{png, jpg} # same as the file above
convert image.{png, jpg}.{png, jpg} # cartesian product
touch somefile{a..z}.txt # expands from a - z

#----find----#
find . -name src -type d # recursively find all directories called src
find . -path '**/test/*.py' -type f # find all python files within test folder
find . -mtime -1 # find files modified in the last day
find . -name "*.tmp" -exec rm {} \; # remove all temporary files

#----used-in-DL----#
export name=value # makes name variable accessible to any child processes
echo $name

sed 's/replace/with/' file.txt # edits stream (insertion, deletion, search, replace)

# xargs constructs an argument list from STDOUT and passes it to the input of a command
find . -name src -type d | xargs ls -l

source # synonymous with . (?)




