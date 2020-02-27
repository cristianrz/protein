DEST = ${HOME}/bin

all: protein

protein: protein.sh
	cat protein.sh > protein
	chmod +x protein

install:
	mv protein $(DEST)
	
