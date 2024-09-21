all: cn rsc

dedup: dedup.c

cn: dedup
	curl -L -o ipip.txt "https://raw.githubusercontent.com/17mon/china_ip_list/master/china_ip_list.txt"
	curl -L -o chunzhen.txt "https://raw.githubusercontent.com/metowolf/iplist/master/data/country/CN.txt"
	cat ipip.txt chunzhen.txt | ./dedup > CN.txt
	rm -f ipip.txt chunzhen.txt

rsc: CN
	/bin/sh gen-rsc.sh

clean:
	rm -f dedup *.txt *.rsc