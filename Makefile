DEST = ${HOME}

all: protein

protein: protein.sh
	cat protein.sh > protein
	chmod +x protein

install:
	mkdir $(DEST)/bin
	mv protein $(DEST)/bin
	
