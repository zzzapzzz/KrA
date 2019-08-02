#!/bin/bash

function banner() {
cat << "EOF"
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

sources=(GET POST REQUEST HEADER "SERVER\['PHP" "SERVER\['PATH_" "SERVER\['REQUEST_U" "<?= $_GET['" "<?= $_Post['" )
sinks=(? echo die print printf print_r var_dump fopen fclose readline fwrite mkdir unlink file_get_contents shell eval system execve exec popen proc_open proc_get_status proc_nice passthru assert create_function echo print print_r exit die printf vprintf JREQUEST_ALLOWHTML JREQUEST_ALLOWRAW  db_query insert update delete mysql_query pg_query pg_send_query pg_execute WHERE FROM SELECT UPDATE DELETE INSERT mysql_query mysqli_query pg_execute pg_insert pg_query pg_select pg_update sqlite_query msql_query mssql_query odbc_exec fbsql_query sybase_query ibase_query dbx_query ingres_query ifx_query oci_parse sqlsrv_query maxdb_query db2_exec the_title get_the_title the_content wp_titlewp_list_comments comments_template previous_post_link get_the_title the_title comment_text get_the_excerpt next_post_link spl_autoload_call class_exists interface_exists method_exists property_exists unserialize trigger_error user_error odbc_result_all ovrimos_result_all ifx_htmltbl_result setcookie header setrawcookie session_id assert create_function mb_ereg_replace mb_eregi_replace preg_filter preg_replace preg_replace_callback event_buffer_new event_set event_Set iterator_apply forward_ array_ assert ob_ register_ runkit_ set_ stream_ yaml_ eio_ dotnet include_ php_ require_ virtual eio_ fdf_ file finfo_ fget exec expect_ pcntl_ popen proc_ shell_ system mail mb_ w32api_ ldap_ftp_ cyrus_ ini_)

warrior(){
	echo ""
	echo "[!] Identifying sources with input sinks"
	echo ""
	for i in ${sources[@]}
	do
	echo ""
	echo ""
	echo "[+] Using Source: $i"
		a=$(grep -n "\$_${i}" $f | grep -o "\$.*=" | sed "s/[ ]\?=//g" | sort -u)

		for j in ${sinks[@]}
		do
	echo "[+] Matching Sink : $j"
			grep --color -n "${j}.*\$_${i}" $f

			for k in $a
			do
				grep --color -n "${j}.*$k" $f
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