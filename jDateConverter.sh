julianDate()
{
	gYear=$1;
	gMonth=$2;
	gDay=$3;
	jDate=0;

	A=$(( ${gYear} / 100 ));
	B=$(( ${A} / 4 ));
	C=$(( 2 - ${A} + ${B} ));
	d=`echo "scale=1; 365.25*(${gYear}+4716)" | bc`;
	D=`echo $d | awk -F. '{print $1}'`;
	e=`echo "scale=1; 30.6001*(${gMonth}+1)" | bc`;
	E=`echo $e | awk -F. '{print $1}'`;
	jDate=`echo "scale=1; ${C}+${gDay}+${D}+${E}-1524.5" | bc`;

#	echo "A=$A B=$B C=$C D=$D E=$E Date=$jDate";
	echo "$jDate";

}

help()
{
	echo "Usage: dateConverter.sh [Year] [Month] [Day]";
}
 

######################################################################
#
# Script start
#
######################################################################

#
# Check for args
#

if [ $# -lt 3 ]
then
	help
else
	julianDate $1 $2 $3
fi
