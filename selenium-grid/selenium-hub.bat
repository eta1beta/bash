@echo off
set PROJECT_ROOT=c:\\work\\workspace\\eclipse\\tecla-common-test\\tecla-common-test-core-fvt
java -jar %PROJECT_ROOT%\\lib\selenium\\server-standalone\\selenium-server-standalone-3.12.0.jar -role hub -port 4444
