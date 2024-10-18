all: adguardhome-public adguardhome-campus

download:
	curl -L -o accelerated-domains.china.conf "https://raw.githubusercontent.com/felixonmars/dnsmasq-china-list/master/accelerated-domains.china.conf"
	curl -L -o google.china.conf "https://raw.githubusercontent.com/felixonmars/dnsmasq-china-list/master/google.china.conf"
	curl -L -o apple.china.conf "https://raw.githubusercontent.com/felixonmars/dnsmasq-china-list/master/apple.china.conf"

raw: download
	sed -e 's|^server=/\(.*\)/114.114.114.114$$|\1|' accelerated-domains.china.conf | grep -Ev -e '^#' -e '^$$' > accelerated-domains.china.raw.txt
	sed -e 's|^server=/\(.*\)/114.114.114.114$$|\1|' google.china.conf | grep -Ev -e '^#' -e '^$$' > google.china.raw.txt
	sed -e 's|^server=/\(.*\)/114.114.114.114$$|\1|' apple.china.conf | grep -Ev -e '^#' -e '^$$' > apple.china.raw.txt

adguardhome-public: raw
	echo "https://1.1.1.1/dns-query\nhttps://1.0.0.1/dns-query\nhttps://8.8.8.8/dns-query\nhttps://8.8.4.4/dns-query\n" > upstream-public.conf
	cat accelerated-domains.china.raw.txt google.china.raw.txt apple.china.raw.txt | sed 's/^/[\//; s/$$/\/\]114.114.114.114/' >> upstream-public.conf

adguardhome-campus: raw
	echo "https://1.1.1.1/dns-query\nhttps://1.0.0.1/dns-query\nhttps://8.8.8.8/dns-query\nhttps://8.8.4.4/dns-query\n" > upstream-campus.conf
	cat accelerated-domains.china.raw.txt google.china.raw.txt apple.china.raw.txt | sed 's/^/[\//; s/$$/\/\]210.28.129.251/' >> upstream-campus.conf

clean:
	rm -f {accelerated-domains,google,apple}.china.conf {accelerated-domains,google,apple}.china.raw.txt upstream-*.conf
