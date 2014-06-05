install:
	install main server /usr/local/bin
	#which dialog >/dev/null 2>&1 || yum -y install dialog /usr/local/bin
	#which xinetd >/dev/null 2>&1 || yum -y install xinetd
	which nc >/dev/null 2>&1 || yum -y install nc
	grep -q "`cat main.service`" /etc/services || cat main.service >> /etc/services
	install main.xinetd /etc/xinetd.d/main
	/etc/init.d/xinetd restart
