#!/bin/bash
#


WORKDIR=$PWD #/project/projectdirs/lcls/fpoitevi/Software/autosfx-dependencies
echo $WORKDIR

ccp4=true
xds=true
crystfel=false
phenix=true


# CCP4+ShelX
if $ccp4 ; then
 if [ ! -d $WORKDIR/ccp4-7.1 ]; then
  if [ ! -f ccp4-7.1.002-shelx-linux64.tar.gz ]; then
    wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1XvZ1FJFFaunq151e4WrjFkpc-My3m8XQ' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1XvZ1FJFFaunq151e4WrjFkpc-My3m8XQ" -O ccp4-7.1.002-shelx-linux64.tar.gz
    rm -rf /tmp/cookies.txt
  fi
  tar -xzvf ccp4-7.1.002-shelx-linux64.tar.gz
  cd ccp4-7.1
  ./BINARY.setup --run-from-script
  cd ..
  rm -rf ccp4-7.1.002-shelx-linux64.tar.gz
 fi
fi

# XDS
if $xds ; then
 if [ ! -d $WORKDIR/XDS-INTEL64_Linux_x86_64 ]; then
  if [ ! -f XDS-INTEL64_Linux_x86_64.tar.gz ]; then
    wget ftp://ftp.mpimf-heidelberg.mpg.de/pub/kabsch/XDS-INTEL64_Linux_x86_64.tar.gz
  fi
  tar -xvf XDS-INTEL64_Linux_x86_64.tar.gz
  rm -rf XDS-INTEL64_Linux_x86_64.tar.gz
 fi
fi

# Crystfel
if $crystfel ; then
 if [ ! -d $WORKDIR/crystfel-0.8.0 ]; then
  if [ ! -f crystfel-0.8.0.tar.gz ]; then
    wget https://www.desy.de/~twhite/crystfel/crystfel-0.8.0.tar.gz
  fi
  tar -xzvf crystfel-0.8.0.tar.gz
  cd crystfel-0.8.0
  mkdir build && cd build && cmake .. && make install
  cd ..
  rm -rf crystfel-0.8.0.tar.gz
 fi
fi

# Phenix
if $phenix ; then
 if [ ! -d $WORKDIR/phenix-installer-1.18.2-3874-intel-linux-2.6-x86_64-centos6 ]; then
  wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1CfC9exFJVuPugQ2n7eDAJSi9ebDfju0K' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1CfC9exFJVuPugQ2n7eDAJSi9ebDfju0K" -O phenix-installer-1.18.2-3874-intel-linux-2.6-x86_64-centos6.tar.gz
  rm -rf /tmp/cookies.txt
  tar -xzvf phenix-installer-1.18.2-3874-intel-linux-2.6-x86_64-centos6.tar.gz
  cd phenix-installer-1.18.2-3874-intel-linux-2.6-x86_64-centos6
  ./install --prefix=$PWD
 fi
fi

