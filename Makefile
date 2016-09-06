#
# Makefile for openchain
#
NAME = openchain-core
TOPDIR = ../../../
OUTDIR = $(TOPDIR)/openchain-core

default:

install:
	git clone https://github.com/openchain/openchain openchain-src
	# cd openchain-src && git checkout $(OPENCHAIN_RELEASE) -b $(OPENCHAIN_RELEASE)

	cd openchain-src && cat src/**/Program.cs | sed -e 's/UseContentRoot(Directory.GetCurrentDirectory())/UseContentRoot(Environment.GetEnvironmentVariable("HOME"))/g' > /tmp/Program.cs.tmp
	mv /tmp/Program.cs.tmp openchain-src/src/**/Program.cs
	cd openchain-src && dotnet restore src/**/project.json && dotnet build src/Openchain && dotnet publish src/Openchain -o $(OUTDIR)
	cd openchain-src && mkdir -p $(OUTDIR)/data
	cd openchain-src && cp src/Openchain/data/config.json $(OUTDIR)/data
