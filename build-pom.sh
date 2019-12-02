#!/bin/sh

mvn -f pom.xml.in help:effective-pom -Doutput=effective-pom.xml

xmlstarlet ed -N pom=http://maven.apache.org/POM/4.0.0 \
	-d '//comment()' \
	-d '/pom:project/pom:parent' \
	-d "/pom:project/pom:properties/*[substring(name(),string-length(name())-7) = '.version']" \
	-d '/pom:project/pom:build/pom:plugins/pom:plugin/pom:configuration' \
	-d '/pom:project/pom:build/pom:pluginManagement' \
	-d '/pom:project/pom:distributionManagement' \
	-d '/pom:project/pom:dependencyManagement' \
	-d '/pom:project/pom:repositories' effective-pom.xml | \
    perl -p -e 's{'"$PWD/"'}{}g' > pom.xml

rm -f effective-pom.xml
