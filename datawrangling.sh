cat example-log.txt | less # pipe example text through less which allows you to scroll through text

# s expression s/search string/replace withe me/
cat example-log.txt | sed 's/.*:.//' | less # remove everything before  :.


# .* is an example of a regular express

# . - any single character
# * - one or more of a character
# .* one or more of any character


# square brackets let you match one of many diff chars

# e.g replace any character which is either a or b with nothing
# this command will only replace the first instance of any found in default mode
# match once and replace once
echo 'aba' | sed 's/[ab]//'

# global modifier does this for all instances matching
echo 'aba' | sed 's/[ab]//g'

# 0 or more of string ab, replace with nothing
# -E for using modern syntax where special meaning of parens is accepted
echo 'abcaba' | sed -E 's/(ab)*//g'

# or can be used to group patterns together
echo 'abcaba' | sed -E 's/(ab|bc)*//g'

# In case of a user with name 'Disconnected from', thee user will be removed
# regex is greedy and will match until all removed
echo 'Disconnected from invalid user Disconnected from 84.211' | sed 's/.*Disconnected from//'


echo 'Disconnected from invalid user Disconnected from 84.211' | sed 's/.*Disconnected from//'


