#!/bin/sh
###############################################
##     PwnPie - IMG3 Parser and Decrypter    ##
#######     by 0wnDev - qwertyoruiop    #######
### Licensed under CC BY-NC-SA 3.0 Unported ###
###############################################
olddir="$PWD"
tmp=`mktemp -d -t kbag`
cd "$tmp"
echo=`which echo`
irecovery=`which irecovery`
xpwntool=`which xpwntool`
if [[ $irecovery == "" ]]; then irecovery=""; fi
echo(){
"$echo" "[+] $*"
}
print(){
"$echo" "$*"
}
info(){
"$echo" "[i] $*"
}
die(){
"$echo" "[-] $*"
rm -rf "$tmp"
exit 1
}
usage()
{
cat << USAGE
usage: `basename $0` [-x <xpwntool>] [-i <irecovery>] [-s] [-p] [-n] [-h] <greenpois0n.app> <iDevice1,1_1337_Restore.ipsw>
 
-s : Skip greenpois0n. This is useful for debug. You can use this one time for every reboot to avoid crashes. Optional.
 
-x <xpwntool> : allows you to specify xpwntool 's path. Optional.
 
-i <irecovery> : same as -x. Optional.
 
-p : Just create a iRecovery's batch script. Useful for learning. Optional.
 
-n : Do not decrypt files in your iPSW. More faster. Useful if you want to get only keys. Optional.
 
-h : Print this message. Optional.
 
<greenpois0n.app> :  Just drag and drop greenpois0n.app.
 
<iDevice1,1_1337_Restore.ipsw> : Path to ipsw to decrypt.
USAGE
}
kabg() {
file=$1;
## qwertyoruiop's kbag extractor
startParsing=`hexdump "$file" | grep -i "47 41 42 4B" | cut -d \  -f 1 | head -1`
kbag=`dd if="$file" bs=1 skip=0x"$startParsing" count=0x70 | hexdump -v -e '""1/1 "%02X""\n"' | grep -A 70 -i "47" | tr -d '\n'`
kbagstart="${kbag: +40}"
aestype="${kbag: +32}"
aestype=`print "$aestype" | dd bs=1 count=8`

if [[ $aestype == "00010000" ]]; then
print "KBAG is for a device newer than S5L8920"
skip=$[0x60]
else
print "KBAG is for a device older than S5L8920"
skip=$[0x40]
fi
kbag=`print "$kbagstart" | dd bs=1 count=$skip`
}
header(){
cat << HEAD
###############################################
##     PwnPie - IMG3 Parser and Decrypter    ##
#######     by 0wnDev - qwertyoruiop    #######
### Licensed under CC BY-NC-SA 3.0 Unported ###
###############################################
HEAD
}


### Main script
header
##### CommandParser
if [ $# -eq "0" ]; then
usage
exit 2
fi
count=0
if [[ `print $* | grep -o -- "-s"`  == "-s" ]]; then
cont=2
else
cont=3
fi
while [ $# -eq "$cont" ] ; do

if [[ "$1" == "-i" ]]; then
irecovery="$2"
shift
shift
elif [[ "$1" == "-x" ]]; then
xpwntool="$2"
shift
shift
elif [[ "$1" == "-s" ]]; then
GP=1
cont=2
shift
elif [[ "$1" == "-p" ]]; then
GET=1
shift
elif [[ "$1" == "-n" ]]; then
DECRYPT=1
shift
elif [[ "$1" == "-h" ]]; then
usage
exit
else
usage
exit
fi
done

info "Creating workspace"

if [ ! $GP ]; then
greenpois0n="$1"
ipsw="$2"
if [ ! -d "$greenpois0n" ]; then
die "greenpois0n is not a valid app"
fi
else
ipsw="$1"
fi
tehdir="$PWD"
if [ ! -f "$ipsw" ]; then
die "IPSW is not valid"
fi

if [ ! $GP ]; then
echo "Pois0ning..."
tamp=`mktemp -t gload`
loadgp(){
powd="$PWD"
cd "$greenpois0n"
cd Contents
cd MacOS
./greenpois0n &>$tamp &
"$echo" "$!" > pid
cd "$powd"
mv "$OLDPWD/pid" ./
}
( loadgp &>/dev/null )
watchPid=`cat pid`
while :; do
cat $tamp | grep "Checking if device is already jailbroken" &>/dev/null
if [[ $? == "0" ]]; then
kill -9 "$watchPid"
rm -rf $tamp
echo GreenBSS initialized
break
fi
active=`ps | grep "$watchPid" | head -1 | grep "greenpois0n"`
if [[ "$active" == "" ]]; then
die "greenpois0n crashed/quitted"
fi
done
rm -rf pid
fi


## Let's extract the plist :P
info "Parsing IPSW"
unzip "$ipsw"  "Restore.plist" &>/dev/null || die "IPSW is not recognized"
defaults read "$PWD/Restore" RestoreRamDisks | grep dmg | tr -d ' ' | tr -d '"' | tr -d ";" > tmp
while read disk; do
unzip "$ipsw" "${disk##*=}" &>/dev/null
done < tmp
unzip "$ipsw" "Firmware/*" &>/dev/null
defaults read "$PWD/Restore" KernelCachesByTarget | grep kernelcache | head -1 | tr -d ' ' | tr -d '"' | tr -d ";" > tmp
while read disk; do
unzip "$ipsw" "${disk##*=}" &>/dev/null
done < tmp
rm -rf tmp
rm -rf Restore.plist
find . -maxdepth 5 -name "*.img3" -exec mv {} ./ \;
find . -maxdepth 5 -name "*.dfu" -exec mv {} ./ \;
rm -rf Firmware
ls > ../list
mv ../list ./
info "Retriving KBAGs"
for i in $( cat list ); do
        kabg "$i" &>/dev/null
		#print $i $kbag
		print "go aes dec "$kbag >> bscr
		print "// $i:" >>names
done
kline=`wc -l < bscr | awk '{print $1}'`
pline=`wc -l < list | awk '{print $1}'`
if [[ ! "$kline" == "$pline" ]]; then
die "Unknown error retriving KBAGs."
fi
print "/exit" >> bscr
if [ $GET ]; then
cp bscr "$olddir/getkeys.txt" 
fi
if [ ! $GET ]; then
if [[ ! -f "$xpwntool" ]]; then die "xpwntool not found"; fi
if [[ ! -f "$irecovery" ]]; then die "irecovery not found"; fi
echo "Retriving keys/ivs"
"$irecovery" -s log < bscr >/dev/null
cat log | grep --binary-files=text -i "iv " > keys
kline=`wc -l < keys | awk '{print $1}'`
pline=`wc -l < list | awk '{print $1}'`
if [[ ! "$kline" == "$pline" ]]; then
die "Error retriving keys/ivs. Maybe you used -s flag too much?"
fi

print >> out
print >> out
print "Keys for $(basename $ipsw):" >> out
print >> out
paste -d"\n" names keys >> out
perl -pi -e 's/-iv/IV:/g' out
perl -pi -e 's/-k/
Key:/g'  out

#cat tmp out > out
print >> out
print "Got them via PwnPie, (c)qwertyoruiop, 2010. follow @0wnTeam on twitter." >>out
mv out "$olddir/$(basename $ipsw)_keys.txt" 
if [ ! $DECRYPT ]; then
pline=`wc -l < list | awk '{print $1}'`
counter=1
if [[ -x "$olddir/$(basename $ipsw)_decrypted" ]]; then rm -rf "$olddir/$(basename $ipsw)_decrypted"; fi
mkdir "$olddir/$(basename $ipsw)_decrypted"
while [[ ! "$pline" == "$counter" ]]
do
line2=`sed -n "${counter}p" keys`
line1=`sed -n "${counter}p" list`
	if [[ "$line1" == "" ]]; then echo "Fail. Some keys are missing."; break; fi
if [[ "$line2" == "" ]]; then echo "Fail. Some keys are missing."; break; fi
	namewoext=`print $line1 | sed 's/(.*)..*/1/'`
	ext=`print $line1 |awk -F . '{print $NF}'`
	newname="$namewoext.dec.$ext"
	echo "$xpwntool" "$line1" "$newname" $line2
	"$xpwntool" "$line1" "$newname" $line2
	mv "$newname" "$olddir/$(basename $ipsw)_decrypted/$newname"
	
	echo "Decrypted $line1"
	let counter=counter+1
done
echo "$PWD"
fi
open "$olddir/$(basename $ipsw)_keys.txt"
fi
rm -rf "$tmp"
echo "Done :)"