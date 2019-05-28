@echo off
mvn clean -Dresume=false release:prepare release:perform
pause