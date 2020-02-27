DEST = ${HOME}

all: protein

protein: protein.sh
	cat protein.sh > protein
	chmod +x protein

install:
	mkdir -p $(DEST)/bin
	mv protein $(DEST)/bin
	
