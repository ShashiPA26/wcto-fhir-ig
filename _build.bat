@ECHO OFF
SETLOCAL
SET "publisher_jar=publisher.jar"
SET "input_cache_path=%CD%\input-cache"
IF DEFINED FHIR_PUBLISHER_HOME (SET "publisher_home=%FHIR_PUBLISHER_HOME%") ELSE (SET "publisher_home=%USERPROFILE%\.fhir\tools\publisher")

IF /I "%~1"=="update" GOTO update
IF /I "%~1"=="clean" GOTO clean
IF /I "%~1"=="nosushi" (SHIFT & GOTO nosushi)
IF /I "%~1"=="notx" (SHIFT & GOTO notx)
IF /I "%~1"=="watch" (SHIFT & GOTO watch)
IF /I "%~1"=="continuous" (SHIFT & GOTO watch)
IF /I "%~1"=="build" SHIFT
GOTO publish

:publisher
IF EXIST "%input_cache_path%\%publisher_jar%" SET "jar=%input_cache_path%\%publisher_jar%"
IF NOT DEFINED jar IF EXIST "..\%publisher_jar%" SET "jar=..\%publisher_jar%"
IF NOT DEFINED jar IF EXIST "%publisher_home%\%publisher_jar%" SET "jar=%publisher_home%\%publisher_jar%"
IF NOT DEFINED jar (
  ECHO IG Publisher not found. Run _build.bat update first.
  EXIT /B 1
)
GOTO :EOF

:publish
CALL :publisher
SET "JAVA_TOOL_OPTIONS=%JAVA_TOOL_OPTIONS% -Dfile.encoding=UTF-8"
java %JAVA_OPTS% -jar "%jar%" -ig . %*
EXIT /B %ERRORLEVEL%

:nosushi
CALL :publisher
SET "JAVA_TOOL_OPTIONS=%JAVA_TOOL_OPTIONS% -Dfile.encoding=UTF-8"
java %JAVA_OPTS% -jar "%jar%" -ig . -no-sushi %*
EXIT /B %ERRORLEVEL%

:notx
CALL :publisher
SET "JAVA_TOOL_OPTIONS=%JAVA_TOOL_OPTIONS% -Dfile.encoding=UTF-8"
java %JAVA_OPTS% -jar "%jar%" -ig . -tx n/a %*
EXIT /B %ERRORLEVEL%

:watch
CALL :publisher
SET "JAVA_TOOL_OPTIONS=%JAVA_TOOL_OPTIONS% -Dfile.encoding=UTF-8"
java %JAVA_OPTS% -jar "%jar%" -ig . -watch %*
EXIT /B %ERRORLEVEL%

:update
IF NOT EXIST "%input_cache_path%" MKDIR "%input_cache_path%"
ECHO Downloading the latest IG Publisher...
POWERSHELL -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri 'https://github.com/HL7/fhir-ig-publisher/releases/latest/download/publisher.jar' -OutFile '%input_cache_path%\%publisher_jar%'"
EXIT /B %ERRORLEVEL%

:clean
IF EXIST input-cache RMDIR /S /Q input-cache
IF EXIST temp RMDIR /S /Q temp
IF EXIST output RMDIR /S /Q output
IF EXIST template RMDIR /S /Q template
IF EXIST out RMDIR /S /Q out
ECHO Removed generated publisher directories.
