SHELL := /bin/bash
SITE_DIR := site
THEME_DIR := ./mytheme

.PHONY: clean compile

help:
	@echo To edit, run make server in one tab and make watch in another
	@echo
	@echo Available commands:
	@echo
	@echo publish - publish site in GitHub
	@echo server - start a server on output dir
	@echo watch - watch for changes and update static files
	@echo compile - generate site in output dir

compile:
	pelican ${SITE_DIR} -t ${THEME_DIR} -o output -s settings.py

clean:
	rm -rf output/ cache

server: clean compile
	(cd output && python -m webbrowser http://localhost:8000 && python -m SimpleHTTPServer)

watch: compile
	@echo Watching for changes...
	watchmedo shell-command --command 'make compile' --recursive --drop ${SITE_DIR} ${THEME_DIR}
