#
# Makefile for openchain
#
NAME = openchain-core
OUTDIR = ../../../openchain-core

default:


install: 
	mkdir -p data
	wget -O project.json https://raw.githubusercontent.com/openchain/openchain/v0.6.2/src/Openchain/project.json 
	wget -O Program.cs https://raw.githubusercontent.com/openchain/openchain/v0.6.2/src/Openchain/Program.cs
	mkdir -p $(OUTDIR)/data
	wget -O $(OUTDIR)/data/config.json https://raw.githubusercontent.com/openchain/openchain/v0.6.2/src/Openchain/data/config.json
	dotnet restore && dotnet publish -o $(OUTDIR)
