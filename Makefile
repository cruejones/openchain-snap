#
# Makefile for openchain
#
NAME = openchain-core
TOPDIR = ../../../..
OUTDIR = $(TOPDIR)/openchain-core
HN = `hostname`

OPENCHAIN_RELEASE=v0.6.2

# default target does nothing so the snapcraft make plugin can do "make && make install" and not fail
default:


install:
	# Use modified source to adjust contentRootPath of .net app to a writeable location for the snapped executable
	git clone https://github.com/mikemccracken/openchain openchain-src
	# git clone https://github.com/openchain/openchain openchain-src
	# cd openchain-src && git checkout $(OPENCHAIN_RELEASE) -b $(OPENCHAIN_RELEASE)

	cd openchain-src && dotnet restore src/**/project.json && dotnet build src/Openchain && dotnet publish src/Openchain -o $(OUTDIR)
	cd openchain-src && mkdir -p $(OUTDIR)/data
	cd openchain-src && cp src/Openchain/data/config.json $(OUTDIR)/data
