BINDIR := ~/bin
BIN    := $(BINDIR)/awsmfa

# your AWS ACCOUNT ID
AWS_ACCOUNT_ID   :=
AWS_IAM_USER     := $(shell whoami)
AWS_PROFILE_NAME := default

.PHONY: help clean install
help:
	@cat Makefile

clean:
	-rm $(BIN)

install: $(BIN)
	@echo "$(notdir $<) installed to $(dir $<)"

$(BIN): awsmfa.tmpl __validate
	sed -e 's!__AWS_ACCOUNT_ID__!$(AWS_ACCOUNT_ID)!; \
		s!__AWS_IAM_USER__!$(AWS_IAM_USER)!; \
		s!__AWS_PROFILE_NAME__!$(AWS_PROFILE_NAME)!' $< > $@
	chmod +x $@

__validate:
ifeq ($(AWS_ACCOUNT_ID),)
	$(error "AWS_ACCOUNT_ID must be specified")
endif
