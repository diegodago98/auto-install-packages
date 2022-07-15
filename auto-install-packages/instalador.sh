#!/bin/bash
# Define la lista del menú aqui

PS3="Selecciona una operación: "

select opt in "Instalar apache y OpenSSL" "Instalar Mod-Jk" "Salir";

do
        case $opt in
                "Instalar apache y OpenSSL")
                        ./auto-install-apache.sh
                        ;;
                "Instalar Mod-Jk")
                        ./auto-install-mod-jk.sh
                        ;;
                "Salir")
                        break
                        ;;
                *)
                        echo "$REPLY no es una operación válida"
                        ;;
        esac
done
