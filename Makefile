SHELL := /bin/bash

compile: crowsfoot
	pelican blog -o output

clean:
	rm -rf output cache

server:
	make clean compile
	(cd output && xdg-open http://localhost:8000 && python -m SimpleHTTPServer)

watch:
	@echo Watching for changes...
	watchmedo shell-command -c 'make compile' blog/
