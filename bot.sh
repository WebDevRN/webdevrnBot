#!/bin/bash
touch /root/.status
key="you key of bot"
chatkey="you key of canal, chat or group"
# Functions 
urlencode()
{
	echo "$*" | sed 's:%:%25:g;s: :%20:g;s:<:%3C:g;s:>:%3E:g;s:#:%23:g;s:{:%7B:g;s:}:%7D:g;s:|:%7C:g;s:\\:%5C:g;s:\^:%5E:g;s:~:%7E:g;s:\[:%5B:g;s:\]:%5D:g;s:`:%60:g;s:;:%3B:g;s:/:%2F:g;s:?:%3F:g;s^:^%3A^g;s:@:%40:g;s:=:%3D:g;s:&:%26:g;s:\$:%24:g;s:\!:%21:g;s:\*:%2A:g'
}

sendMsg() 
{
	curl -s "https://api.telegram.org/bot$key/sendMessage"\
	       	-d "chat_id=$chatkey"\
		-d "text=$(urlencode "$1")"\
    -d "parse_mode=html"\
		-d "disable_web_page_preview=true"

}
live()
{
	curl -i -X GET $1 >> /dev/null
	if [ $? != 0 ];then
					if [ "$(cat /root/.status)" != "0" ];then
						# Change the status of response.
						# 0 is down and 1 is up
						echo "0" > /root/.status
						sendMsg "<strong>Link Caiu 😢</strong>"
						logs=$(cat /var/log/nginx/error.log | tail -n 20)
						sendMsg "<strong>/var/log/nginx/error.log</strong>: <code>$logs</code>   <i>Foram as ultimas 20 linhas</i>";
						sendMsg "Verifique a DNS: <code>dig $1</code>"
						sendMsg "$(free -h)"

					fi
	else
					if [ "$(cat /root/.status)" != "1" ];then
						echo "1" > /root/.status
						sendMsg "<strong>ONLINE</strong> 😍  $1"
					fi
	fi
}
# Call the function
live "$1"
