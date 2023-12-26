## -*- mode: makefile-gmake -*-

EMACS	  = emacs

PUBLISH_EL	= ./publish.el
# EARLYINIT_EL	= ~/.emacs.d/early-init.el

publish: $(PUBLISH_EL)
	$(EMACS) -Q --batch -l $<

all: publish

### Makefile ends here
