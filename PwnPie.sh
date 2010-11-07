#!/bin/sh
###############################################
##     PwnPie - IMG3 Parser and Decrypter    ##
#######     by 0wnDev - qwertyoruiop    #######
### Licensed under CC BY-NC-SA 3.0 Unported ###
###############################################

gad="go aes dec"
#olddir="$PWD" Some Cool Things commit added -o command and now we use $ipsw's dirname as output directory. Override this via -o flag.

odpw="$PWD"
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
usage: `basename $0` [-x <xpwntool>] [-w <img3-file>] [-i <irecovery>] [-o <path>] [-s] [-p] [-n] [-h] [-t] <greenpois0n.app> <iDevice1,1_1337_Restore.ipsw>
 
-s : Skip greenpois0n. This is useful for debug. You can use this one time for every reboot to avoid crashes. Optional.
 
-x <xpwntool> : allows you to specify xpwntool 's path. Optional.
 
-i <irecovery> : same as -x but for iRecovery. Optional.
 
-w <img3file> : Do the work for a IMG3. Skip IPSW.

-g : Launch GreenBSS only. Skip IPSW.

-o <path> : You can choose output directory of files (eg. keys and decrypted files)
 
-p : Just create a iRecovery's batch script. Useful for learning. Optional.
 
-n : Do not decrypt files in your iPSW. More faster. Useful if you want to get only keys. Optional.
 
-h : Print this message. Optional.
 
-t : Create a theiphonewiki template.

-k : Skip generation of vfdecrypt key.
 
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
if [ $# -eq "1" ]; then
usage
exit 2
fi
count=0
SINGLE=1
OUTDIR=1
if [[ `print $* | grep -o -- "-s"`  == "-s" ]]; then
cont=1
elif [[ `print $* | grep -o -- "-w"`  == "-w" ]]; then
cont=1
elif [[ `print $* | grep -o -- "-g"`  == "-g" ]]; then
cont=1
else
cont=2
fi
VFD=1
while [ $# -gt $cont ]; do
:
case $1 in
-i) irecovery="$2"; shift 2; ;; 
-x) xpwntool="$2"; shift 2; ;;  
-o) ODD="$2"; OUTDIR=; shift 2; ;;  
-w) SINGLE=;VFD=; swile="$2"; shift 2; ;; 
-g) SINGLE=;KIGB=; shift ;; 
-s) GP=1; shift ;; 
-p) GET=1; shift ;; 
-n) DECRYPT=1; shift 1 ;; 
-t) IPHW=1; shift 1 ;; 
-k) VFD=; shift 1 ;; 
-h) usage; exit ;; 
*) die "Invalid option $1"; exit 1;;
 esac
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
if [ $SINGLE ]; then
if [ $KIGB ]; then
if [ ! -f "$ipsw" ]; then
die "IPSW is not valid"
fi
fi
fi



if [ ! $GP ]; then
echo "Pois0ning..."
trap "killall greenpois0n" EXIT
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
trap ":" EXIT
break
fi
active=`ps | grep "$watchPid" | head -1 | grep "greenpois0n"`
if [[ "$active" == "" ]]; then
trap ":" EXIT
die "greenpois0n crashed/quitted"
fi
done
rm -rf pid
fi
if [ ! $KIGB ]; then
info "Done."
exit
fi

if [ $SINGLE ]; then
## Let's extract the plist :P
echo "Parsing IPSW"
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
ls > ../lost
mv ../lost ./
else
if [ -f "$swile" ]; then 
print "$swile" > lost
else
die "$swile is not a file"
fi
fi

info "Retriving KBAGs"
for i in $( cat lost ); do
		
		is3gim=`hexdump "$i" | head -1 | tr -d '0000000' | awk '{print $1 $2 $3 $4}' | grep -oi 33676d49`
		if [ "$is3gim" ]; then
		print "$i" >> list
        kabg "$i" &>/dev/null
		if [[ "$kbag" == "" ]]; then
		read -p "[-] Can't get $i's kbag. Write it here: " kbag
		fi
		if [[ "$kbag" == "" ]]; then
		die "Fail."
		fi
		#print $i $kbag
		print "$gad "$kbag >> bscr
		print "// $i:" >>names

		fi
		
done
if [ ! -f "bscr" ]; then
die "Invalid IMG3s"
fi 
if [ ! -f "names" ]; then
die "Invalid IMG3s"
fi 
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
if [[ ! -f log ]]; then die "iDevice not in iBSS mode. Use greenpois0n. kthx."; fi 
cat log | grep --binary-files=text -i "iv " > keys
kline=`wc -l < keys | awk '{print $1}'`
pline=`wc -l < list | awk '{print $1}'`
if [[ ! "$kline" == "$pline" ]]; then
die "Error retriving keys/ivs. Maybe you used -s flag too much?"
fi
if [ $SINGLE ]; then
print >> out
print >> out
print "Keys for $(basename $ipsw):" >> out
print >> out
paste -d"\n" names keys >> out
else
print "Keys for $(basename $swile):" >> out
cat keys >> out
olddir=`dirname "$swile"`
ipsw="$swile"
fi
perl -pi -e 's/-iv/IV:/g' out
perl -pi -e 's/-k/
Key:/g'  out
if [ ! $OUTDIR ]; then
powdd="$PWD"
cd "$odpw"
cd "$ODD"
olddir="$PWD"
cd "$powdd"
fi
### GENPASS
if [ $VFD ]; then
unzip "$ipsw"  "Restore.plist" &>/dev/null
info "Downloading GenPass"
curl http://gluepie.tk/genpass -o genpass 2>/dev/null
echo "Downloaded"
chmod +x genpass
PFRM=`defaults read "$PWD/Restore" DeviceMap | grep -i "Platform" | tr -d ' ' | tr -d '"' | tr -d ";"`
PLATFORM="${PFRM##*=}"
#echo $PLATFORM
MDSK=`defaults read "$PWD/Restore" SystemRestoreImages | grep -i "dmg" | tr -d ' ' | tr -d '"' | tr -d ";"`
ROOTFS="${MDSK##*=}"
#echo $ROOTFS
RDSK=`defaults read "$PWD/Restore" RestoreRamDisks | grep dmg | tail -1 | tr -d ' ' | tr -d '"' | tr -d ";"`
RAMDISK="${RDSK##*=}"
#echo $RAMDISK
KIRL=`cat names | grep -n "$RAMDISK"`
KLINE=`print ${KIRL:0:2} | tr -d ':'`
KWIV=`sed -n "${KLINE}p" keys`
"$xpwntool" "$RAMDISK" rdisk.dmg $KWIV &>/dev/null
info "Extracting RootFS in order to get his vfdecrypt key. This will take some time."
unzip "$ipsw"  "$ROOTFS" &>/dev/null
KIRL=`./genpass $PLATFORM ./rdisk.dmg $ROOTFS`
echo "Found VFDecrypt key:" ${KIRL##"vfdecrypt key: "}
VFKEY=${KIRL##"vfdecrypt key: "}
#cat tmp out > out
print "//$ROOTFS:" >> out
print "VFDecrypt Key: $VFKEY" >> out
fi
print >> out
print "Got them via PwnPie, (c)qwertyoruiop, 2010. follow @0wnTeam on twitter." >>out
mv out "$olddir/$(basename $ipsw)_keys.txt" 
if [ ! $DECRYPT ]; then
pline=`wc -l < keys | awk '{print $1}'`
counter=1
if [[ -x "$olddir/$(basename $ipsw)_decrypted" ]]; then rm -rf "$olddir/$(basename $ipsw)_decrypted"; fi
mkdir "$olddir/$(basename $ipsw)_decrypted"
echo PlOx
while [[ ! "$pline" == "$counter" ]]
do
line2=`sed -n "${counter}p" keys`
line1=`sed -n "${counter}p" list`
	namewoext=`print $line1 | sed 's/(.*)..*/1/'`
	#echo $namewoext
	ext=`print $line1 |awk -F . '{print $NF}'`
	newname="$namewoext.dec.$ext"
	"$xpwntool" "$line1" "$newname" $line2 &>/dev/null
	mv "$newname" "$olddir/$(basename $ipsw)_decrypted/$newname" &>/dev/null || ( print "[-] Cannot decrypt $line1"; let counter=counter+1; break )
	
	echo "Decrypted $line1"
	let counter=counter+1
done
if [ $VFD ]; then
info "Downloading vfdecrypt and ecrypting rootfs. This will take some time."
curl http://gluepie.tk/vfdecrypt -o vfdecrypt 2>/dev/null
echo "Downloaded"
chmod +x genpass
echo Decrypting...
chmod +x vfdecrypt
./vfdecrypt -i "$ROOTFS" -k "$VFKEY" -o "$olddir/$(basename $ipsw)_decrypted/$ROOTFS.decrypted.dmg" &>/dev/null 
echo Decrypted $ROOTFS.
fi
fi
open "$olddir/$(basename $ipsw)_keys.txt"
fi
#echo $PWD

##TheiPhoneWiki Module
if [ $IPHW ]; then
cat > thiw << EoF
== Decryption Keys ==
=== Root Filesystem ===
*'''[[VFDecrypt Keys|VFDecrypt]] Key''': $VFKEY

EoF
pline=`wc -l < list | awk '{print $1}'`
counter=1
while [[ ! "$pline" == "$counter" ]]
do
line2=`sed -n "${counter}p" keys`
line1=`sed -n "${counter}p" list`
print >> thiw
print "=== $line1 ===" >> thiw
print "$line2">crap
read crap iv crapp key < crap
cat >> thiw << oEfP
* '''IV''': $iv
* '''Key''': $key
oEfP
 
	let counter=counter+1
done
rm -rf crap

mv thiw "$olddir/$(basename $ipsw)_keys_theiphonewiki.txt"
open "$olddir/$(basename $ipsw)_keys_theiphonewiki.txt"
fi

#fi
rm -rf "$tmp"
trap ":" EXIT
echo "Done :)"
