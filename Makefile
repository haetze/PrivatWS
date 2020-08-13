### Makefile --- 

## Author: richard.stewing@udo.edu

HTML-DIR:= html
REPOSITORY:=https://github.com/haetze/PrivatWS


help:
	@echo "Available Targets:"
	@echo "  clean:      Removes target files."
	@echo "  website:    Creates HTML Files in html/"
	@echo "  publish:    Commit with current date and time and push to $(REPOSITORY)"


clean:
	rm -f $(HTML-DIR)/*.html
	rm -f *~
	rm -f org/*~

html/%.html : org/%.org util/settings.org util/common.org
	mkdir -p $(HTML-DIR)
	emacs $< --batch -f org-html-export-to-html --kill
	mv org/$(@F) $@

website: html/index.html

publish:
	git commit -m "$(shell date)" -a || true
	git push
