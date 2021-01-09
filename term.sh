#!/usr/bin/env -S bash --

sOpt=hnw
while getopts "$sOpt" sArg ; do
	case "$sArg" in
		n) bName= ;;
		w) bWeechat= ;;
		h) vim -R --cmd 'set buftype=nofile' "+$LINENO" "$0" ; echo "$sOpt" ; exit 0 ;;
		*) vim -R --cmd 'set buftype=nofile' "+$LINENO" "$0" ; echo "$sOpt" ; exit 1 ;;
	esac
done
shift $(( OPTIND - 1 ))

c=( sed -s )

if [[ ${bWeechat+xxx} ]] ; then
	c+=( -e 's//o/g'
	     -e 's//c/g'
	     -e 's//v/g'
	     -e 's//b/g'
	     -e 's/	/v/g' )
else
	csSgr0="$( tput sgr0 )"
	csSitm="$( tput sitm )"
	csBold="$( tput bold )"
	csSmul="$( tput smul )"
	csRev="$( tput rev )"
	for u in {0..7} ; do
		csSetaf+=( "$( tput setaf $u )" )
		csSetab+=( "$( tput setab $u )" )
	done
	csSetaf+=( "$csSgr0" )
	csSetab+=( "${csSetab[7]}" )
	#         0 1 2 3 4 5 6 7 8 9 A B C D E F
	uColors=( 8 0 4 2 1 1 5 3 3 2 6 6 4 5 0 7 )
	c+=( -e "s/$/$csSgr0/g" )
	c+=( -e "s/1[6-9],[0-9][0-9]\?//g" ) # Prune the fancy colors we probably won't see anyway.
	c+=( -e "s/[2-9][0-9],[0-9][0-9]\?//g" )
	c+=( -e "s/1[6-9]//g" )
	c+=( -e "s/[2-9][0-9]//g" )
	for uFg in {09..00} {15..0} ; do
		for uBg in {09..00} {15..0} ; do
			c+=( -e "s/$uFg,$uBg/$csSgr0$csBold${csSetaf[${uColors[10#$uFg]}]}${csSetab[${uColors[10#$uBg]}]}/g" )
		done
	done
	for uFg in {09..00} {15..0} ; do
		c+=( -e "s/$uFg/$csSgr0$csBold${csSetaf[${uColors[10#$uFg]}]}/g" )
	done
	c+=( -e "s/	/$csSitm/g" )
	c+=( -e "s//$csBold/g" )
	c+=( -e "s//$csSmul/g" )
	c+=( -e "s//$csRev/g" )
	c+=( -e "s//$csSgr0/g" )
	c+=( -e "\$s/.*/&$csSgr0\n/g;\$P${bName+;\$F};\$d" ) # Patch invalid text files that lack trailing newlines.
fi

"${c[@]}" "$@"
