include Colours.mk

#------------------------------------------------------------------------------#
#                                   GENERICS                                   #
#------------------------------------------------------------------------------#

# Special variables
DEFAULT_GOAL: msg

# Phony targets
.PHONY: msg all \
		brew cmake \
		glfw valgrind \

# Comment the line bellow to have verbose cmds:
HIDE	=	@

#------------------------------------------------------------------------------#
#                                 BASE TARGETS                                 #
#------------------------------------------------------------------------------#

msg:
	@echo "$(BLUE)\n Use one of the following target to start the installation process : $(DEFCOL)"
	@echo "$(YELLOW)	- brew     : to install/update homebrew $(DEFCOL)"
	@echo "$(YELLOW)	- cmake    : to install/update cmake $(DEFCOL)"
	@echo "$(YELLOW)	- glfw     : to install/update glfw $(DEFCOL)"
	@echo "$(YELLOW)	- valgrind : to install/update valgrind $(DEFCOL)"
	@echo "$(YELLOW)	- all      : to install/update all the above\n $(DEFCOL)"

all: brew cmake glfw valgrind

#------------------------------------------------------------------------------#
#                                 BREW TARGETS                                 #
#------------------------------------------------------------------------------#

# Installs/Updates homebrew (WARNING : can be very slow !)
brew:
	@echo "$(YELLOW)\nInstalling Brew\n $(DEFCOL)"
	$(HIDE) bash .brew_install.sh; \
	if [ $$? -eq 0 ]; then \
		echo "$(BLUE)\nBrew installed !\n $(DEFCOL)"; \
	else \
		echo "$(RED)\n! FAILED TO INSTALL BREW !\n $(DEFCOL)"; \
	fi

# Installs/Updates cmake (WARNING : can be very slow !)
cmake:
	@echo "$(YELLOW)\nInstalling Cmake\n $(DEFCOL)"
	$(HIDE) brew install cmake; \
	if [ $$? -eq 0 ]; then \
		echo "$(BLUE)\nCmake installed !\n $(DEFCOL)"; \
	else \
		echo "$(RED)\n! FAILED TO INSTALL CMAKE !\n $(DEFCOL)"; \
	fi

# Installs/Updates glfw
glfw:
	@echo "$(YELLOW)\nInstalling GFLW\n $(DEFCOL)"
	$(HIDE) brew install glfw; \
	if [ $$? -eq 0 ]; then \
		echo "$(BLUE)\nGLFW installed !\n $(DEFCOL)"; \
	else \
		echo "$(RED)\n! FAILED TO INSTALL GLFW !\n $(DEFCOL)"; \
	fi

# Installs/Updates valgrind
valgrind:
	@echo "$(YELLOW)\nInstalling Valgrind\n $(DEFCOL)"
	$(HIDE) brew tap LouisBrunner/valgrind
	$(HIDE) brew install --HEAD LouisBrunner/valgrind/valgrind; \
	if [ $$? -eq 0 ]; then \
		echo "$(BLUE)\nVALGRIND installed !\n $(DEFCOL)"; \
	else \
		echo "$(RED)\n! FAILED TO INSTALL VALGRIND !\n $(DEFCOL)"; \
	fi