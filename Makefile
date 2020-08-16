### Makefile --- 

## Author: richard.stewing@udo.edu

HTML-DIR:= html
ORG-DIR:= org
REPOSITORY:=https://github.com/haetze/PrivatWS
ORG-SRC:=$(wildcard $(ORG-DIR)/*.org)
HTML-OBJ:=$(patsubst $(ORG-DIR)/%.org,$(HTML-DIR)/%.html,$(ORG-SRC))

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
	emacs --batch -l src/config.el $< -f org-html-export-to-html --kill
	mv org/$(@F) $@

website: $(HTML-OBJ)

publish:
	git commit -m "$(shell date)" -a || true
	git push
