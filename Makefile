MODULE=net-snmp-5.7.1

all: rpm

rpm-dir:
	@rm -rf `pwd`/RPMBUILD; \
	mkdir -p `pwd`/RPMBUILD/{DIST,BUILD,SOURCES,RPMS,SRPMS,SPECS}

dist: rpm-dir 
	@echo Preparing ${MODULE}.tar.gz; tar -czf `pwd`/RPMBUILD/DIST/${MODULE}.tar.gz ${MODULE} 


rpm: dist
		rpmbuild -ta --define "%_topdir `pwd`/RPMBUILD" `pwd`/RPMBUILD/DIST/${MODULE}.tar.gz; \


build-deps:
	@grep '^BuildRequires' ${MODULE}/*.spec | awk '{print $$2}' | sed 's/,/ /g' | sed 's/ /\n/g' | sort -u




