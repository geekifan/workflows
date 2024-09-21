all:
	(cd adguardhome && make all)
	(cd geoip-cn && make all)

clean:
	(cd adguardhome && make clean)
	(cd geoip-cn && make clean)
