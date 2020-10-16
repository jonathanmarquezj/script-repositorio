#!/bin/bash
echo "-------------------------------";
echo "     BUSCANDO PAQUETES"
echo "-------------------------------";
echo "Repositorio: $1";
echo "NOTA: Este procedimiento tardara. Cargando...";
echo "-------------------------------";

#LOS PAQUETES QUE TENEMOS INSTALADOS
# dpkg -l | grep '^ii' | cut -d ' ' -f 3
#LA VERSION Y LOS REPOSITORIOS DEL PAQUETE
# apt-cache showpkg vlc | head -3 | grep -v '^Versions' | sed -e 's/Package: //;' | paste - -
#PARA BUSCAR EL REPOSITORIO EN EL PAQUETE
# | grep $1 | awk -F '\t' '{print $1}'


for paquete in $(dpkg -l | grep '^ii' | cut -d ' ' -f 3); do  # Bucle for para recorrer los paquetes instalados
  apt-cache showpkg $paquete | head -3 | grep -v '^Versions' | sed -e 's/Package: //;' | paste - - ; # El paquete con la version y el repositorio
done | grep $1 | awk -F '\t' '{print $1}' #buscamos si esta el repositorio en el paquete



echo "-------------------------------";
echo "FIN";
