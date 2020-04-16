#!/bin/bash -x
isPartTime=1;
isFullTime=2;
totalSalary=0;
empRatePerHr=20;
totalWorkHrs=0;
totalWorkingDays=0;
maxHrsInMonth=10;
numWorkingDays=20;

function getEmpWage() {
	local empHr=$1
	echo $(($empHr*$empRatePerHr))
}

function getWorkHrs() {
	local $empCheck=$1
	case $empCheck in
                        $isFullTime )
                                empHrs=8
                                ;;
                        $isPartTime )
                                empHrs=4
                                ;;
                        *)
                                empHrs=0;
											;;
                esac
	echo $empHrs
}

while [[ $totalWorkHrs -lt $maxHrsInMonth && $totalWorkingDays -lt $numWorkingDays ]];
do
	((totalWorkingDays++))
	empCheck=$(( RANDOM % 3 ));
	empHrs="$( getWorkHrs $empCheck )"
	totalWorkHrs=$(( $totalWorkHrs+$empHrs ));
	dailyWage[$totalWorkingDays]="$( getEmpWage $empHrs )"
done

totalSalary=$(( $totalWorkHrs*$empRatePerHr ))
echo ${dailyWage[@]}
