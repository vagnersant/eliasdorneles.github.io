SHELL := /bin/bash

compile: crowsfoot
	pelican -o output -t crowsfoot

crowsfoot:
	git submodule init
	git submodule update

clean:
	rm -rf output cache
