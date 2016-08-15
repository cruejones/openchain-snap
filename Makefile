#
# Makefile for openchain
#
NAME = openchain-core
OUTDIR = ../../../openchain-core

install: 
	mkdir -p data
	wget -O project.json https://raw.githubusercontent.com/openchain/openchain/v0.6.2/src/Openchain/project.json 
	wget -O Program.cs https://raw.githubusercontent.com/openchain/openchain/v0.6.2/src/Openchain/Program.cs
	wget -O config.json https://raw.githubusercontent.com/openchain/openchain/v0.6.2/src/Openchain/data/config.json
	dotnet restore && dotnet publish -o $(OUTDIR)
