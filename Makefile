SHELL := /bin/bash

compile: crowsfoot
	pelican blog -o output

crowsfoot:
	git submodule init
	git submodule update

clean:
	rm -rf output cache

watch:
	watchmedo shell-command -c 'make compile' blog/
