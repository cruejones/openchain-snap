#
# Makefile for openchain
#
NAME = openchain-core
OUTDIR = ../../../openchain-core

default:


install: 
	mkdir -p $(OUTDIR)/data
	wget -O project.json https://raw.githubusercontent.com/openchain/openchain/v0.6.2/src/Openchain/project.json 
	wget -O Program.cs https://raw.githubusercontent.com/openchain/openchain/v0.6.2/src/Openchain/Program.cs
	wget -O $(OUTDIR)/data/config.json https://raw.githubusercontent.com/openchain/openchain/v0.6.2/src/Openchain/data/config.json
	sed -e "s|ledger.db|$HOME/snap/openchain/$HOSTNAME/ledger.db|g" $OUTDIR/data/config.json $OUTDIR/data/config.json.tmp
	mv $OUTDIR/data/config.json.tmp $OUTDIR/data/config.json
	dotnet restore && dotnet publish -o $(OUTDIR)
