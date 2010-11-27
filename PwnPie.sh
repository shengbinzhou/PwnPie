#!/bin/sh
###############################################
##     PwnPie - IMG3 Parser and Decrypter    ##
#######     by 0wnDev - qwertyoruiop	#######
#######      modified by liamchat       #######
### Licensed under CC BY-NC-SA 3.0 Unported ###
###############################################
gad="go aes dec"
olddir="$PWD" #Some Cool Things commit added -o command and now we use $ipsw's dirname as output directory. Override this via -o flag.
mammooth(){ ## ComingWinter proposed that. use -s -g to trigger.
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
"$echo" "[+] $*" # seting + if you use echo
}
print(){
"$echo" "$*" # seting to just print data
}
info(){
"$echo" "[i] $*" # seting to print ifo to help people
}
die(){
"$echo" "[-] $*" # used to tell people error's and can be used to kill the app
rm -rf "$tmp"
exit 1
}
usage() # if a command is wrong desplay this to help people
{
cat << USAGE
usage: `basename $0` [-x <xpwntool>] [-w <img3-file>] [-i <irecovery>] [-o <path>] [-s] [-w] [-f] [-p] [-n] [-h] [-t] <greenpois0n.app> <iDevice1,1_1337_Restore.ipsw>
-s : Skip greenpois0n. This is useful for debug. You can use this one time for every reboot to avoid crashes. Optional.
-w : uploads the AES payload so it will work on any iBSS based jailbreask. Optional.
-f : patch iboot to jump to aes_decrypt. Optional.
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
file="$1";
## qwertyoruiop's kbag extractor rev2
kbag=`python - "$file" << END
import sys, binascii
from struct import *
try:
	f = open(sys.argv[1], "rb") 
except:
	sys.exit(-1)
data = f.read()
f.close()
if data[0:4] != "3gmI":
	sys.exit(1)
pointer=data.find("GABK")
tag=data[pointer:]
magic=tag[0:4]
tagFullSize=tag[4:8]
tagDataSize=tag[8:12]
cryptState=tag[12:16]
aesType=tag[16:20]
iv=tag[20:36]
ktypehex=binascii.b2a_hex(pack('<I', int(binascii.b2a_hex(aesType), 16)))
ktype=int(ktypehex, 16)
if ktype == 256:
	kSize=32
elif ktype == 192:
	kSize=24
elif ktype == 128:
	kSize=16
else:
	sys.exit(1)
key=tag[36:36+kSize]
keyHex=binascii.b2a_hex(key).upper()
ivHex=binascii.b2a_hex(iv).upper()
sys.stdout.write(ivHex+keyHex)
END`
}
header(){
cat << HEAD
###############################################
##     PwnPie - IMG3 Parser and Decrypter    ##
#######     by 0wnDev - qwertyoruiop	#######
#######      modified by liamchat       #######
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
-w) AD=1; shift 1 ;;
-f) ED=1; shift 1 ;; 
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
info "Creating workspace" # seperating greenpois0n from the ipsw
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
echo "GreenBSS initialized" # created by greenpois0n to alow you to use irecovery with ease
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
## inject the AES payload
if [ $GP ]; then
if [ $AD ]; then
echo "injecting AES payload"
"$irecovery" -u `basename $0/payload.bin` # you need to get your own payload
"$irecovery" -c exec
fi
fi
## patching iboot to jump to AES_decrypt in the AES engines mmemory space
if [ $GP ]; then
if [ $ED ]; then
echo "patching iboot to aes_decrypt"
"$irecovery" -c mw 0x9000000 0xE1A0700E # the AES memory is at 0x9000000 on the iphone 2g and 3g and ipod 1g
"$irecovery" -c mw 0x9000004 0xE59F0018
"$irecovery" -c mw 0x9000008 0xE3A01020 ##size of the AES engines mmemory space
"$irecovery" -c mw 0x900000C 0xE3A02001 ##0X01 to use the gid-key or 0X02 for the uid-key 
"$irecovery" -c mw 0x9000010 0xE3A03000
"$irecovery" -c mw 0x9000014 0xE58D3000
"$irecovery" -c mw 0x9000018 0xE59F4008
"$irecovery" -c mw 0x900001C 0xE12FFF34
"$irecovery" -c mw 0x9000020 0xE12FFF17
"$irecovery" -c mw 0x9000024 0x09000100 ##data you want to decrypt
"$irecovery" -c mw 0x9000028 0x18001791 ##ptr to function
echo "enableing iboot to use aes_decrypt"
"$irecovery" -c mw 0x180015C0 0x43A343A3
fi
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
        kabg "$i"
		if [[ "$kbag" == "" ]]; then
		read -p "[-] Can't get $i's kbag. Write it here: " kbag  # img2 dont have kbag's insted they use this 
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
print "/exit" >> bscr # this is used by irecovery to stop it from going in to a loop and breaking your device
if [ $GET ]; then
cp bscr "$olddir/getkeys.txt" 
exit 1
fi
if [ ! $GET ]; then
if [[ ! -f "$xpwntool" ]]; then die "xpwntool not found"; fi
if [[ ! -f "$irecovery" ]]; then die "irecovery not found"; fi
echo "Retriving keys/ivs"
"$irecovery" -s log < bscr >/dev/null
if [[ ! -f log ]]; then die "iDevice not in iBSS mode. Use greenpois0n. kthx."; fi 
echo "Got keys. Parsing now."
cat log | grep --binary-files=text -i "iv " | tr -d "'\000'" > keys ## Thanks to http on theiphonewiki for finding this bug.
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
PLATFORM=`defaults read "$PWD/Restore" DeviceMap | head -1` # gives it the platform
#PLATFORM="${PFRM##*=}"
#echo $PLATFORM
ROOTFS=`defaults read "$PWD/Restore" SystemRestoreImages | head -1` # tell's it the root filesystem
#ROOTFS="${MDSK##*=}"
#echo $ROOTFS
RAMDISK=`defaults read "$PWD/Restore" RestoreRamDisks | tail -1` # tell's it the restore ramdisk
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
print "Got them via PwnPie, (c)qwertyoruiop and (c)liamchat, 2010. follow @0wnTeam on twitter." >>out # print's the copywrite law (dont steal it)
rm -rf  "$olddir/$(basename $ipsw)_keys.txt" &>/dev/null
mv out "$olddir/$(basename $ipsw)_keys.txt" &>/dev/null # move the file out of the temp derectory
echo "the keys are now in a text file"
info "remember to add the list in alficaetical order" # just to worn you if you add the key's to the wiki you will be kicked if they are not in alficaetical order
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
	"$xpwntool" "$line1" "$newname" $line2 &>/dev/null # xpwn will test your key's
	mv "$newname" "$olddir/$(basename $ipsw)_decrypted/$newname" &>/dev/null && { echo "Decrypted $line1"; } || ( print "[-] Cannot decrypt $line1"; ) # recovery mode is not shown but is still decrypted
	let counter=counter+1
done
if [ $VFD ]; then
info "Downloading vfdecrypt and ecrypting rootfs. This will take some time."
curl http://gluepie.tk/vfdecrypt -o vfdecrypt 2>/dev/null # download vfdecrypt so if can see if genpass is brocken again
echo "Downloaded"
echo Decrypting...
chmod +x vfdecrypt # the file need to have premition to be run
./vfdecrypt -i "$ROOTFS" -k "$VFKEY" -o "$olddir/$(basename $ipsw)_decrypted/$ROOTFS.decrypted.dmg" &>/dev/null 
echo Decrypted $ROOTFS.
fi
fi
open "$olddir/$(basename $ipsw)_keys.txt" # open the key's file copy recovey mode from here to thiw
fi
#echo $PWD
##TheiPhoneWiki Module
if [ $IPHW ]; then
cat > thiw << EoF
== Decryption Keys ==
=== Root Filesystem ($ROOTFS)===
*'''[[VFDecrypt Keys|VFDecrypt]] Key''': $VFKEY
EoF
pline=`wc -l < list | awk '{print $1}'`
counter=1
while [[ ! "$pline" == "$counter" ]]
do
line2=`sed -n "${counter}p" bscr`
line3=`sed -n "${counter}p" keys`
line1=`sed -n "${counter}p" list`
print >> thiw
print "=== $line1 ===" >> thiw
print "$line2">key
print "$line3">crap
read bscr go aes dec < key
read crap iv crapp key < crap
cat >> thiw << oEfP
* '''IV''': $iv
* '''Key''': $key
oEfP

	let counter=counter+1
done
cat >> thiw << oEfP

=== RecoveryMode ===
* '''IV''': 
* '''Key''': 
oEfP
info "this template is not ready for the iphone wiki please see http://theiphonewiki.com/wiki/index.php?title=Template:Keys until i can get it to work here" # just to warn you
info "update ramdisk is the smaller number" # just to help me remember what is the update ramdisk
echo "the keys have being add to a generic template to help you add them to the wiki" # this will help you add them to the wiki
rm -rf crap # delete the temp directory
mv thiw "$olddir/$(basename $ipsw)_keys_theiphonewiki.txt" # move the template out of the temp directory
open "$olddir/$(basename $ipsw)_keys_theiphonewiki.txt" # open it so you can post it to the wiki
fi
#finished
rm -rf "$tmp" # remove the last bit's for rubish
trap ":" EXIT  # exit the app
echo "Done by qwertyoruiop and liamchat :)"