#!/bin/bash
while true
do
	hora=$(date +'%-H')
	hora=$(($hora-7))
	minuto=$(date +'%-M')
	echo $hora
	echo $minuto
	echo $SHELL
	if [[ $minuto -ne 0 ]]; then
		echo "minuto no en 0"
		minuto=$(echo $minuto | sed 's/^0*//')
	else
		echo "minuto en 0"
	fi
	num_min=$(($hora*60))
	num_min=$(($num_min+$minuto))
	if [[ $hora -ge 0 ]] && [[ $hora -lt 12 ]]; then
		echo 'De día'
		num_imagen=$(($num_min*364))
		num_imagen=$(($num_imagen/720))
		echo 'Numero de minuto:' $num_min
		echo 'Numero de imagen:' $num_imagen
		. /usr/bin/discover_session_bus_address.sh gnome
		su alfredo -c "gsettings set org.gnome.desktop.background picture-uri file:///home/alfredo/Documents/Linux/images/${num_imagen}.jpg"
		#gsettings set org.gnome.desktop.background picture-uri file:///home/alfredo/Documents/Linux/images/${num_imagen}.jpg
		sleep 120
	else
		echo 'De noche'
		. /usr/bin/discover_session_bus_address.sh gnome
		su alfredo -c "gsettings set org.gnome.desktop.background picture-uri file:///home/alfredo/Documents/Linux/images/363.jpg"
		tiempo=$((43260-$num_min))
		echo 'Tiempo para volver a revisar:' $tiempo
		sleep $tiempo
	fi
done
