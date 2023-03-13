#!/bin/bash

function makedirs() {
echo "1. make dirs in home dir"
cd ~
rm -rf zoo
mkdir -p zoo/{predatoy/{table,leopard},birds/{parrot,chair}}

echo "2.1 fix names"
mv zoo/predatory/table zoo/predatory/lion
ls zoo/predatory/

echo "2.2 write fact to lion"
echo "parrots and lions" > zoo/predatory/lion/facts

echo "2.3 copy fact to parrot dir"
cp zoo/predatory/lion/facts zoo/birds/parrot/

echo "2.4 rename chair to chicken"
mv zoo/birds/chair/ zoo/birds/chicken/
ls zoo/birds/

echo "3. create 9 chickens"
touch zoo/birds/chicken/chicken{1..9}
ls zoo/birds/chicken/

echo "4. displlay reverse chickens"
ls -lr zoo/birds/chicken/ | tee zoo/birds/chicken/iChick
ls zoo/birds/chicken/

echo "5.assigning read perms to others in x\chicken"

chmod -R o=r zoo/birds/chicken/
echo "6. display other perms"

ls -l zoo/birds/chicken/ | grep ^.......... | cut -c 8-10 | tee -a zoo/birds/chicken/iChick
cat zoo/birds/chicken/iChick

echo "7. delete zoo dir"
rm -rf zoo

echo "8. create Linux file"
echo -e “Linux is a great os.\nlinux is an opernsource. unix is free os.\nlearn operating system.\nlinux is
easy to learn. \nlinux is a multiuser os. \nlearn unix. unix is \npowerful.” > Linux

echo "9. search linux words"
cat Linux | grep linux

echo "10. search first word in line"
cat Linux | grep ^*

echo "11. delete linux file"
rm Linux

echo "12. view active processes"
ps -ax

echo "13. use pstree"
pstree

echo "14. vie all root processes:"
ps -u root

echo "15. real time processes "
top
}

function stars () {

read -p "Please enter number of rows: " num
i=1
while [[ $i -le 2 ]]
do
    if [[ $i -lt 2 ]]
		then
		    row=1
		elif [[ $i -eq 2 ]] 
			then
		    	row=2
    fi
    while [[ $row -le $num ]]
    do
        col=1
        while [[ $col -le $num ]]
        do
            if [[ ($row -eq 1 && $col -eq 1) || ($row -eq 1 && $col -eq $num) ]]
            then
                echo -n " "
            elif [[ ($row -eq $num && $col -eq 1)  ||  ($row -eq $num && $col -eq $num) ]]
            then
                echo -n " "
            elif [[ ($row -eq 1 && $col -ne 1) || ($row -eq $num && $col -ne $num) ]]
            then    
                echo -n "*"
            elif [[ ($col -eq 1 && $row -ne 1) || ($col -eq $num && $row -ne $num) ]]
            then
                echo -n "*"
            else
                echo -n " "
            fi
            let col=col+1
        done
        echo ""
        let row=row+1
    done
    let i=i+1
done

}

function nums10 () {
cat << EOF > nums
1
2
3
4
5
6
7
8
9
10
EOF

file="$PWD/nums"

sum=0

while IFS= read -r line
do
	let sum=sum+line
done <"$file"

echo $sum
}

function calc () {
while [ 1 = 1 ]
	do
		echo "*************************"
		echo "What you wanna to convert"
		echo "*************************"
		echo "1. Decimal to Binary"
		echo "2. Binary to Decimal"
		echo "3. Exit"
		read -p "Make you choice now: " c
		case $c in
			1) decbin ;;
			2) bindec ;;
			3) exit 5 ;;
			*) echo "1-3 ONLY!" ; sleep 3 ;;
		esac
	done
}

