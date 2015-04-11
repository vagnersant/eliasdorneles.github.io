SHELL := /bin/bash
SITE_DIR := site

help:
	@echo publish - publish site in GitHub
	@echo server - start a server on output dir
	@echo watch - watch for changes and update static files
	@echo compile - generate site in output dir

compile:
	pelican ${SITE_DIR} -o output -s settings.py

publish: clean compile
	ghp-import -m "Update site" output
	git push origin gh-pages:master
	git push origin source:source

clean:
	rm -rf output cache

server: clean compile
	(cd output && xdg-open http://localhost:8000 && python -m SimpleHTTPServer)

watch:
	@echo Watching for changes...
	watchmedo shell-command --command 'make compile' --recursive $(SITE_DIR)
