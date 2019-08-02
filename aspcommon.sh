#!/bin/bash

function banner() {
cat << "EOF"
                             ,-.|____________________
                          O==+-|(>-------- --  -     .>
Art is inspired             `- |"""""""d88b"""""""""
          &                   | O     d8P 88b
       dedicated              |  \    88= ,=88
          to                  |   )   9b _. 88b
       #RAZOR911              `._ `.   8`--'888
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

sources=(GET POST REQUEST HEADER "SERVER\['PHP" "SERVER\['PATH_" "SERVER\['REQUEST_U")
sinks=(OpenTextFile WriteLine GetFileName CreateTextFile WScript\.Shell \.Exec \.run response\.write request\.querystring request\.form Response\\.Cookies Request\.Cookies Session ADODB\.recordset ADODB\.Connection ADODB\.command WHERE FROM SELECT UPDATE UNION DELETE INSERT if\s?)

warrior(){
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
	warrior
else
	for i in $(find $2 -type f -name "*.*")
	do
		echo "File: $i"
		f=$i
		warrior
	done
fi