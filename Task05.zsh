#!/bin/zsh

cat << EOF > /Library/Scripts/Lesson04.zsh
#!/bin/zsh
# Lesson 12 Task 04

if [[ -f /Library/Scripts/Lesson04.zsh ]];then
	echo "File exists"
else
	echo "File does not exist"
fi
EOF