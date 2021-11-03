# stop all running containers
docker stop '$(docker ps -q)'

# search for file and open the output
cd '$(ls | grep elk)'

# pipe into clipboard
echo hello | pbcopy

# get line count of file
wc -l 

# read large files in without opening whole file 
less <filename>

# scp to copy files 
scp user@<host-name>:/path/to/file /path/to/local/file

# gcloud alternative 
gcloud compute scp vm1:~/path/ ~/local/path


