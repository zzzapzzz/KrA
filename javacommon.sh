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
EOF
}



if [ -z $1 ]
then
banner
	exit
else
	f=$1
fi

sources=("src" "var" "href" "data" "location" ".location" "code" "value" "action" "replace" "assig" "assign" "navigate" "getResponseHeader" "open" "showModalDialog" "eval" "evaluate" "execCommand" "execScript" "setTimeout" "setInterval" "document.location" "location" "location.href" "document.write" ".innerHTML" "document.baseURI" "document.writeIn" innerHTML outerHTML "\.src" execScript "\.outerHTML" eval setTimeout setInterval newOutputStream "createFile" "createTempFile" "\.write" InputStreamReader "\.system" "\.exec" "getParameter" "getParameterNames" "getParameterValues" "getParameterMap" "getQueryString" "getHeader" "getHeaders" "getHeaderNames" "getRequestURI" "getRequestURL" "getCookies" "getRequestedSessionId" "getInputStream" "getReader" "getMethod" "getProtocol" "getServerName" getRemoteUser "getUserPrincipal" "WHERE "INSERT" "SELECT" "DELETE" UPDATE" "ORDER" "createStatement" "executeQuery" "document.referrer" "window.name" "Function "WebSocket" "websocket" "Messaging" "messaging" "Cookie" "LocalStorage" "SessionStorage request.getParameter escapeHtml searchParams "#"  "URLSearchParams" "location.hash" decodeURI eval Function setTimeout "setInterval" "setImmediate" "execScript" "crypto.generateCRMFRequest" "ScriptElement.src" "ScriptElement.text" "ScriptElement.textContent" "ScriptElement.innerText" "anyTag.onEventName" "document.write" "document.writeln" "anyElement.innerHTML" "Range.createContextualFragment" "window.location" "document.location" "if\s?" "eval\s?" "<%-" query YQL WHERE FROM SELECT UPDATE DELETE INSERT UNION getResults "navigator.geolocation.getCurrentPosition" "document.getElementById" "document.getElementsByName" "document.getElementsByTagName" "document.write" "document.writeln" "document.body.innerHTML" "window.history" "history.back" "history.forward" "history.go" "document.location" "location.href" "location.replace" "location.reload" "window.location" "window.top.location" "window.location.reload" "Window" "location" "arguments" "var" "Var" "dialogArguments" "innerHTML" "search" "searchparams" "searchParams" ".searchParams" ".innerHTML" "writeopen" "showModalDialog" "cookie" "URL" "documentURI" "baseURI" "referrer" "name" "opener" "parent" "top" "content" "self" "frames" "localStorage" "sessionStorage" "Database" "location.href" "document.URL" "document.documentURI" "location" "location.href" "location.search" "location.hash" "document.referrer" "window.name" search "document.location.href" "location.pathname" "location.pathname" "location.search" "location.hash" "document.URL" "document.documentURI" "document.baseURI" "document.write" "window.name" "document.referer" "location.hash.split" "split" "history.pushState"
"history.replaceState" "localStorage" "sessionStorage")


sinks=("src" "var" "href" "data" "location" "code" "value" "action" "replace" "assig" "assign" "navigate" "getResponseHeader" "open" "showModalDialog" "eval" "evaluate" "execCommand" "execScript" "setTimeout" "setInterval" "document.location" "location" "location.href" "document.write" ".innerHTML" "document.baseURI" "document.writeIn" "innerHTML" ".innerHTML" "outerHTML" "\.src" execScript "\.outerHTML" eval setTimeout setInterval newOutputStream "createFile" "createTempFile" "\.write" InputStreamReader "\.system" "\.exec" "getParameter" "getParameterNames" "getParameterValues" "getParameterMap" "getQueryString" "getHeader" "getHeaders" "getHeaderNames" "getRequestURI" "getRequestURL" "getCookies" "getRequestedSessionId" "getInputStream" "getReader" "getMethod" "getProtocol" "getServerName" getRemoteUser "getUserPrincipal" "WHERE "INSERT" "SELECT" "DELETE" UPDATE" "ORDER" "createStatement" "executeQuery" "document.referrer" "window.name" "Function "WebSocket" "websocket" "Messaging" "messaging" "Cookie" "LocalStorage" "SessionStorage request.getParameter escapeHtml searchParams "#"  "URLSearchParams" "location.hash" decodeURI eval Function setTimeout "setInterval" "setImmediate" "execScript" "crypto.generateCRMFRequest" "ScriptElement.src" "ScriptElement.text" "ScriptElement.textContent" "ScriptElement.innerText" "anyTag.onEventName" "document.write" "document.writeln" "anyElement.innerHTML" "Range.createContextualFragment" "window.location" "document.location" "if\s?" "eval\s?" "<%-" query YQL WHERE FROM SELECT UPDATE DELETE INSERT UNION getResults "navigator.geolocation.getCurrentPosition")

warrior(){
	echo ""
	echo "[!] Identifying sources with input sinks"
	echo ""
	for i in ${sources[@]}
	do
	echo ""
	echo ""
	echo ""[+] Using Source:" "$i""
		a=$(grep -n "${i}" "$f" | sort -u)

		for j in ${sinks[@]}
		do
	echo ""[+] Matching Sink :" "$j""
			grep --color -n ""${j}"."${i}"" "$f"

			for k in $a
			do
				grep --color -n ""${j}"."$k"" "$f"
			done
		done
	done
}

if [ "$f" != "-r" ]
then
	warrior
else
	for i in $(find $2 -type f -name "*")
	do
		echo "File: $i"
		f=$i
		warrior
	done
fi
