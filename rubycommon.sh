#!/bin/bash

function banner() {
cat << "EOF"
                                O
                             ,-.|____________________
                          O==+-|(>-------- --  -     .>
Art is inspired             `- |"""""""d88b"""""""""
          &                   | O     d8P 88b
       dedicated              |  \    88= ,=88
          to                  |   )   9b _. 88b
       #RAZOR1911             `._ `.   8`--'888
                               |    \--'\   `-8___
                                \`-.              \
                                 `. \ -       _ / <
	                           \ `---   ___/|_-\
                                    |._      _. |_-|
      		                    \  _     _  /.-\
                                     | -! . !- ||   |
		                     \ /| ! |\ /\   |
		                      =oO)X(Oo=  \  /
                                      888888888   < \
                                     d888888888b  \_/ Ojo 98
EOF
}



if [ -z $1 ]
then
banner
	exit
else
	f=$1
fi

sources=(GET POST REQUEST HEADER HEAD "SERVER" "SERVER\['PATH_" "SERVER\['REQUEST_U")
sinks=(open close File readline write mkdir Dir _send_ __send__ system send public_send eval exec syscall __send__\s?\(? send\s?\( public_send\s?\ raw html_safe ^== ^!= params \.where \.having \.select \.group \.order \.limit \.offset \.joins \.includes \.lock \.readonly \.from params(.*)\.constantize)

xssam(){
	for i in ${sources[@]}
	do
		a=$(grep -in "\$_${i}" $f | grep -o "\$.*=" | sed "s/[ ]\?=//g" | sort -u)

		for j in ${sinks[@]}
		do
			grep --color -in "${j}.*\$_${i}" $f

			for k in $a
			do
				grep --color -in "${j}.*$k" $f
			done
		done
	done
}

if [ $f != "-r" ]
then
	xssam
else
	for i in $(find $2 -type f -name "*.*")
	do
		echo "File: $i"
		f=$i
		xssam
	done
fi