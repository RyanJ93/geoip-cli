all: geoip-cli

geoip-cli:
	mkdir -p ./bin
	crystal build --release --no-debug -o ./bin/geoip-cli ./src/geoip-cli.cr

install:
	cp ./bin/geoip-cli /usr/local/bin/geoip-cli

clean:
	rm -rf ./bin/*
