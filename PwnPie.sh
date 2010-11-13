#!/bin/sh
###############################################
##     PwnPie - IMG3 Parser and Decrypter    ##
#######     by 0wnDev - qwertyoruiop    #######
### Licensed under CC BY-NC-SA 3.0 Unported ###
###############################################

gad="go aes dec"
olddir="$PWD" #Some Cool Things commit added -o command and now we use $ipsw's dirname as output directory. Override this via -o flag.


mammooth(){
cat << FEOF

                                                                                      
                                                                                      
                                                                                      
                                                                                      
                                                   \`....\`                             
                                              \`,,,,,,,,,,,,,.                         
                                           \`::,,::::,,,,,,,,,,,\`                      
                                         .,:::;;::::,,,,,,,,:::,,                     
                                    \`,,,::;'';;;;::::,,,,,,,:::;;:,                   
                                \`,,,,,::;;;;''''';;::::::,::::::;;;:                  
                              ,,,,,,:::;;;;;''''''+;;::::::::::;;;'':                 
                             ,,,,,,,:::;;;;;'''''+''';;;;;;;;;;;;;''';                
                            ,,,,,,,:::;;;;;;'''''+#+#;;;;;;;;;;;''''++;               
                           ,,,,,,,::::;;;;;'''''++##+''';;;;;;;'''''+++;              
                           ,,:,,,::::;;;;;;'''''++##++'''';;;;''''''++++;             
                           ,,:::::::;;;;;;;;''''+###++''''';;;'''''++++++\`            
                           ,,::::::;;;;;;;;;'''+++##+++'''';;;;''''++++##'            
                           ,,::::::;;;;;;;;''''+++###++''''';;;''''++++###:           
                           \`:;;;;;;;;;;;;;;'''''+++##+++'''';;;''''+++++##+           
                           ,:;;;;;;;;;;;;;''''''+++##++''''';;';'''+++++###;          
                          .,::;'''';;;;;;;,  .+'''++##+##''':\`\`\`\`\`.,:+++####          
                          ,';::;;';;;;;;;      \`+''++##++':\`\`\`\`\`\`\`\`.,::++###.         
                          ,',,,:::;;;;;;;        +''++##+\`\`\`\`\`\`\`\`\`\`\`.,::+####         
                         \`'',:;;;;.:;;;'          +'+++;\`\`\`\`\`\`\`\`\`\`\`\`\`.,::####         
           \`\`\`\`\`\`         +,,;':     ';'  ,:      .+'++##,\`\`\`\`\`\`\`\`\`\`\`\`.,::###,        
        \`\`\`\`\`\`\`\`\`\`\`       +,:'       .;' +'++      +'+++#+++:\`\`\`\`\`\`\`\`\`\`.:::###        
      \`\`\`\`\`\`\`\`\`\`\`\`\`\`      ;:;\`     .  '; +@@+      #++++#'#++';\`\`\`\`\`\`\`...::###        
     .\`\`\`\`\`\`\`\`\`\`\`\`\`\`\`     ,:'     @;+ +;  ::       #+++##+#+'''+,\`\`\`\`\`...::,##        
    ,\`\`\`\`\`\`\`\`\`\`\`\`\`\`\`\`\`    ,:.     @@@\`+:'          #++###+#+''''+'\`\`\`\`\`...::+#.       
   ,..\`\`\`\`\`\`\`\`\`\`\`\`\`\`\`\`\`   ,:\`      @+ +:'.        ,+++#####+'''''+'\`\`\`\`...::,#;       
  .,..\`\`\`\`\`\`\`.......\`\`\`   ,:\`         +:'+\`      \`+++++####++'''''+.\`\`\`\`..::,##       
  :,...\`\`\`\`\`.,:::::,,.\`\`  ,:'\`       +':;'''\`\`\` '++++++##+#++'''''++\`\`\`\`..,::;#       
 \`:....\`\`\`\`.,.     .,,,,  ,,'.\`     ,+':;'''++++++#+++###+##+''''''+.\`\`\`..,;:,#       
 :;...\`\`\`\`\`.           ,   ,;';\`\`  '++'::'+#++++##++++######+''''''+,\`\`\`...;:,#       
 :;...\`\`\`\`\`                ,:''+##++##;:;''######+++++#+###+''''''++\`\`\`\`...::,#       
 :;...\`\`\`\`                  :;+++####';;;'''++++++,:##++##++''''''++\`\`\`\`...::,+:      
 :;...\`\` \`                   :'+###+'';;'''''++++\`\`\`\`####+++'''''++.\`\`\`\`...::,'#      
 :;...\`\` \`                   \`:''''';;;;'''''+++:\`\`\`\`.#+++''''''++'\`\`\`\`\`...;:,;#      
 :;,..\`\` \`                    ::'''';;:;;'''++++\`\`\`\`\`\`.+++'''''+++\`\`\`\`\`\`...;:,'#;     
 :;,..\`\` \`                    ,:''';;;;''++++++:.\`\`\`\`\`..,#+++++++\`\`\`\`\`\`\`..,;:,+##     
 ,::..\`\`  \`                   .:''''';;;''+++++...\`\`\`\`\`\`..;+++++\`\` \`\`\`\`...,;:,###     
 \`:;...\`  \`                  ,.;;''';;;;''++#++...\`\`\`\`\`\`\`\`.\`,'.\`\`  \`\`\`\`...:;,,###,    
  :;,..\`\`  \`               \`.,,;;''';;;;;'+++++....\`\`\`   \`\`\`\`\`\`  \`\`\`\`\`...,;:,,###+    
  :;:...\`\` \`\`            \`...,:';''';;::;'+++#+.....\`\`\`          \`\`\`\`....:;:,'####    
  .:;,..\`\`\` \`\`\`        \`.....,:';+'';;;;'+++###.......\`\`\`      \`\`\`\`\`...,,;:,,+####    
   :;:...\`\`\`\`\`\`\`    \`........,:;;+''';;;'+#+###.........\`\`\`\`\`\`\`\`\`.....,,;;:,++####    
   ,:;,....\`\`\`\`\`\`\`\`\`\`.\`\`\`\`...,:;;++';::;'++####:.....................,,:;:,,++####    
    ::;,....\`\`\`\`\`\`\`\`\`\`\`\`\`...,::;;+'';::;'+++###'...................,,,:;::,++#####    
    .::;,.....\`\`\`\`\`\`\`\`\`.....,::;;+'';::;'+++####:.................,,,:;::,++#####;    
     ,:;;,,.....\`\`\`\`\`.......,::;;+';;;;''+++####;:,,,,,,,.....,,,,,,;;::,++######\`    
      ::;;:,,.............,,,:;;;+';;:;+##+######;::,,,,,,,,,,,,,,:;;::,++#++####     
       ::;;;:,,,,,,.....,,,:''';''';::;'+#########+::::,,,,,,,,::;;:::;+###++####     
        ,::;;;::,,,,,,,,:;'''';;+';;:;'+++##########':::;;:::;;;;::::#+###+++###:     
         .::;;'''''''''''''''';;'':::;'+++############+;::::::::::'#++####++####      
           :::;;''''''''''''';:++';''++++###############+++'''+++++++####+++###,      
             ,::;;;;;;;;;';\`.:''';;;'+##+##############++++++++++++#####+++####       
                \`,:::,.    \`:;'';;;''++###############++++++++++++####+++++####       
              ,;,          ::''';;''++++##############++''++++++++###++++++####       
            .;;;;;;      .:;'';;'+++++++#############++'''''++++++#++++++++###+       
            ::'';;;'    ::'';;;;''+##+++#####+###+###+''''''+++++#####+++++###:       
           ::####;':  .:;''';;;''+++#++#########;  \`#+'''''''++++#####+++++###.       
           ;:####;''''+++'''''''+++++###########.  \`#+';;;'''++++#####+++++###\`       
           ;;;;;;;'''''+'''+''++++++#########+##   ;#+';;;'''++++#####+++++###.       
           ';;;;;;'#@@@+''+++++++++#########++##   ##+';;;'''++++#####+++++###:       
           :';;;;+#####@@+++#+++++#########+++##\`\`\`##+';;;''''+++#####+++++####       
            +'';;#######@'+##+++##########++++##,,,#++;;:;;;'''++####++++++#@@#\`      
            \`+''';#####@+++###+##########++++###:::#+';;::;;;''+++##++++####@@@,..\`\`  
          \`\`.,#+''''''''+++###+########++++++###;::#+'';:::;;''+++##+++#####@#'';:,.\` 
        \`\`.....###++++++++###########++++#######';;+++';::::;'''++###########+'';:,.\` 
      \`\`......\`\`.###@@##########+;:;+++++#######+''+++'';;:;;'''++##''++++++'';:,.\`\`  
     \`\`.....\`\`\`\`\`\` \`;#####+.......,:;''++#####++''+++++'';;;'''++###'';;'';;;:,.\`     
      \`\`\`\`\`\`\`\`\`\`\`\`    \`\`...........,,::;;;'''''';''+##+++''''++####+'';;:::,..\`       
                       \`\`\`\`\`.........,,:::::;;;;;;;;;'+###########++';:,..\`\`          
                           \`\`\`\`\`\`\`\`...,,,,,,:::::,,,,,,::::;;'''''';;:.\`              
                          \`\`\`\`\`\`\`\`......,,,,,,,..\`\`\`\`\`\`\`\`\`\`\`.,:::::::,\`               
                        \`\`.........,,,,,,,,...\`\`            \`.,,::,,.\`\`               
                       \`.,,,,,,,,,,,,,,,....\`\`\`           \`\`.,,,,..\`\`                 
                       \`.,,:,,,,,,,,,....\`\`\`             \`\`....\`\`\`                    
                        \`..,,,,,,....\`\`\`\`                 \`\`\`                         
                          \`\`\`\`\`\`\`\`\`\`                                                  
                                                                                      
                                                                                      
                            _            
                           | |           
  _ __   __ _ _ __ __ _  __| | ___ __  __
 | '_ \ / _\` | '__/ _\` |/ _\` |/ _ \\ \/ /
 | |_) | (_| | | | (_| | (_| | (_) |>  < 
 | .__/ \__,_|_|  \__,_|\__,_|\___//_/\_\\
 | |                                     
 |_|                                     
  
                                                                                      
                                                                                      
FEOF
#'"` " for xCode syntaxhilighter :)"
die "You requested something impossible."
}
## PLISTLib - Defaults for Linux.
function defaults(){
shift
if [[ "$2" == "KernelCachesByTarget" ]]; then ## KERNEL
python - "$PWD/Restore.plist" 2>/dev/null << OZOD

from plistlib import *
import sys
pl = readPlist(sys.argv[1])
## KernelCache
print(pl["KernelCachesByTarget"].values()[0]["Release"])
OZOD

elif [[ "$2" == "DeviceMap" ]]; then ## PLATFORM
python - "$PWD/Restore.plist" 2>/dev/null << OZOD

from plistlib import *
import sys
pl = readPlist(sys.argv[1])
## KernelCache
print(pl["DeviceMap"][0]["Platform"])
OZOD

elif [[ "$2" == "RestoreRamDisks" ]]; then ## RAMDISKS
python - "$PWD/Restore.plist" 2>/dev/null << OZOD


from plistlib import *
import sys
pl = readPlist(sys.argv[1])
## KernelCache
ramdisks=pl["RestoreRamDisks"]

for lst in ramdisks.values():
#lst=a ramdisk
	print(lst)
OZOD
elif [[ "$2" == "SystemRestoreImages" ]]; then ## RAMDISKS
python - "$PWD/Restore.plist" 2>/dev/null << OZOD

from plistlib import *
import sys
pl = readPlist(sys.argv[1])

#rootfs
for lst in pl["SystemRestoreImages"].values():
#lst=rootfs
	print(lst)

OZOD
fi
}


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
 
<greenpois0n.app> :  Just drag and drop greenpois0n.app (on linux just the binary).
 
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
pdox=0
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
KIGB=1
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
-g) SINGLE=;KIGB=;let pdox=pdox+1; shift ;; 
-s) GP=1; let pdox=pdox+1; shift ;; 
-p) GET=1; shift ;; 
-n) DECRYPT=1; shift 1 ;; 
-t) IPHW=1; shift 1 ;; 
-k) VFD=; shift 1 ;; 
-h) usage; exit ;; 
*) die "Invalid option $1"; exit 1;;
 esac
done
if [[ $pdox == 2 ]]; then
mammooth
fi
info "Creating workspace"

if [ ! $GP ]; then
greenpois0n="$1"
ipsw="$2"
if [[ "`uname`" == "Darwin" ]]; then
if [ ! -d "$greenpois0n" ]; then
die "greenpois0n is not a valid app"
fi
else
if [ ! -f "$greenpois0n" ]; then
die "greenpois0n is not a valid app"
fi
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
if [[ ! "`uname`" == "Darwin" ]]; then
if [ $VFD ]; then
print "[-] VFDecrypt on Linux is not supported. Disabling."
VFD=;
fi
fi

if [ ! $GP ]; then
echo "Pois0ning..."
trap "killall greenpois0n 2>/dev/null" EXIT
tamp=`mktemp -t gload`
loadgp(){
powd="$PWD"
if [[ "`uname`" == "Darwin" ]]; then
cd "$greenpois0n"
cd Contents
cd MacOS
./greenpois0n &>$tamp &
else
"$greenpois0n" &>$tamp &
fi
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
die "greenpois0n crashed/quitted"
fi
done
rm -rf pid
if [ ! $KIGB ]; then
info "Done."
exit
fi
fi


if [ $SINGLE ]; then
## Let's extract the plist :P
echo "Parsing IPSW"
unzip "$ipsw"  "Restore.plist" &>/dev/null || die "IPSW is not recognized"
defaults read "$PWD/Restore" RestoreRamDisks  > tmp
while read disk; do
unzip "$ipsw" "${disk}" &>/dev/null
done < tmp
unzip "$ipsw" "Firmware/*" &>/dev/null
kernell=`defaults read "$PWD/Restore" KernelCachesByTarget`
if [[ "$kernell" == "" ]]; then
print "[-] Restore.plist is too old. You can't decrypt the kernelcache. Try to do that manually via -w flag."
else
unzip "$ipsw" `defaults read "$PWD/Restore" KernelCachesByTarget` &>/dev/null
fi
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
cat log | grep --binary-files=text -i "iv " | tr -d "`printf '\x00'`" > keys ## Thanks to http on theiphonewiki for finding this bug.
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
else
olddir="$odpw"
fi
### GENPASS
if [ $VFD ]; then
unzip "$ipsw"  "Restore.plist" &>/dev/null
info "Downloading GenPass"
curl http://gluepie.tk/genpass -o genpass 2>/dev/null
echo "Downloaded"
chmod +x genpass
PLATFORM=`defaults read "$PWD/Restore" DeviceMap | head -1`
#PLATFORM="${PFRM##*=}"
#echo $PLATFORM
ROOTFS=`defaults read "$PWD/Restore" SystemRestoreImages | head -1`
#ROOTFS="${MDSK##*=}"
#echo $ROOTFS
RAMDISK=`defaults read "$PWD/Restore" RestoreRamDisks | tail -1`
#RAMDISK="${RDSK##*=}"
#echo $RAMDISK
KIRL=`cat names | grep -n "$RAMDISK"`
KLINE=`print ${KIRL:0:2} | tr -d ':'`
KWIV=`sed -n "${KLINE}p" keys`
"$xpwntool" "$RAMDISK" rdisk.dmg $KWIV &>/dev/null
info "Extracting RootFS in order to get his vfdecrypt key. This will take some time."
unzip "$ipsw"  "$ROOTFS" &>/dev/null
KIRL=`./genpass $PLATFORM ./rdisk.dmg $ROOTFS`
VFKEY=${KIRL##"vfdecrypt key: "}

if [[ "$VFKEY" == "" ]]; then
print "[-] Cannot get VFDecrypt key."
VFD=;
else
echo "Found VFDecrypt key: $VFKEY"
fi
fi
if [ $VFD ]; then
#cat tmp out > out
print "//$ROOTFS:" >> out
print "VFDecrypt Key: $VFKEY" >> out
fi
print >> out
print "Got them via PwnPie, (c)qwertyoruiop, 2010. follow @0wnTeam on twitter." >>out
rm -rf  "$olddir/$(basename $ipsw)_keys.txt" &>/dev/null
mv out "$olddir/$(basename $ipsw)_keys.txt" &>/dev/null
if [ ! $DECRYPT ]; then
info "Decrypting..."
pline=`wc -l < keys | awk '{print $1}'`
counter=1
if [[ -x "$olddir/$(basename $ipsw)_decrypted" ]]; then rm -rf "$olddir/$(basename $ipsw)_decrypted"; fi
mkdir "$olddir/$(basename $ipsw)_decrypted"
while [[ ! "$pline" == "$counter" ]]
do
line2=`sed -n "${counter}p" keys`
line1=`sed -n "${counter}p" list`
	namewoext=`print $line1 | sed 's/(.*)..*/1/'`
	#echo $namewoext
	ext=`print $line1 |awk -F . '{print $NF}'`
	newname="$namewoext.dec.$ext"
	"$xpwntool" "$line1" "$newname" $line2 &>/dev/null
	mv "$newname" "$olddir/$(basename $ipsw)_decrypted/$newname" &>/dev/null && { echo "Decrypted $line1"; } || ( print "[-] Cannot decrypt $line1"; )
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
