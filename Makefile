SHELL := /bin/bash
SITE_DIR := site

help:
	@echo server - start a server on output dir
	@echo watch - watch for changes and update static files

compile:
	pelican ${SITE_DIR} -o output -s settings.py

clean:
	rm -rf output cache

server:
	make clean compile
	(cd output && xdg-open http://localhost:8000 && python -m SimpleHTTPServer)

watch:
	@echo Watching for changes...
	watchmedo shell-command --command 'make compile' --recursive $(SITE_DIR)
