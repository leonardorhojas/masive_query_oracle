ECHO OFF
ECHO ...::::::::::::::::  MULTY QUERYNG DATABASES  :::::::::::::::::::::::...
dir

FOR /F "delims=" %%D in (../inventary/INV_PROD.txt) DO (
@echo        
@echo        ..:::::::::::::::::::::::::::::::::::::::::::::::..
@echo        ..:::: QUERYNG DATABASE SIZE OF DATABASE: %%D ::::..
@echo        ..:::::::::::::::::::::::::::::::::::::::::::::::..
@echo        
sqlplus /@%%D @../sql/size.sql
)    

PAUSE