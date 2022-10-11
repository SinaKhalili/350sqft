PROJECTS=p
WRITING=w

all:
	rm -rf build
	rm -f index
	rm -f project_index
	rm -f writing_index
	rm -f testind

	cat fragments/project_index.txt >> project_index
	for file in $(PROJECTS)/*; do \
		mkdir -p build/$$file; \
		echo $$file >> project_index; \
		echo ""     >> project_index; \
		cat fragments/head1.html >> build/$$file/index.html; \
		echo $$file              >> build/$$file/index.html; \
		cat fragments/head2.html >> build/$$file/index.html; \
		cat $$file | python 350sqft.py >> build/$$file/index.html; \
		cat fragments/foot.html  >> build/$$file/index.html; \
	done
	cat fragments/head1.html >> build/$(PROJECTS)/index.html
	echo "projects" >> build/$(PROJECTS)/index.html
	cat fragments/head2.html >> build/$(PROJECTS)/index.html
	cat project_index | python 350sqft.py >> build/$(PROJECTS)/index.html
	cat fragments/foot.html >> build/$(PROJECTS)/index.html

	cat fragments/writing_index.txt >> writing_index
	for file in $(WRITING)/*; do \
		mkdir -p build/$$file; \
		echo $$file >> writing_index; \
		echo ""     >> writing_index; \
		cat fragments/head1.html >> build/$$file/index.html; \
		echo $$file              >> build/$$file/index.html; \
		cat fragments/head2.html >> build/$$file/index.html; \
		cat $$file | python 350sqft.py >> build/$$file/index.html; \
		cat fragments/foot.html  >> build/$$file/index.html; \
	done

	cat fragments/head1.html >> build/index.html; 
	echo "Main"              >> build/index.html; 
	cat fragments/head2.html >> build/index.html; 
	cat fragments/index.txt project_index writing_index | python 350sqft.py >> build/index.html;
	cat fragments/foot.html  >> build/index.html; 
	cp -r images build/

	# comment out these lines for debugging
	rm -f project_index
	rm -f writing_index

watch:
	ls -w fragments/*  w/* p/* 350sqft.py fragments/* Makefile | entr make