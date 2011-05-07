#Adds all files in .bash at lanuch
for i in ~/.bash/*.sh; do
	source $i
done

for i in ~/.pbash/*.sh; do
	source $i
done
