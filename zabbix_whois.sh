#!/bin/sh

# получаем имя домена
DOMAIN=$1

# получаем имя зоны
ZONE=`echo $DOMAIN | sed 's/\./ /' | awk '{ print $2 }'`

# получаем дату протухания домена
# Должна вернуться в формате ГГГГ-ММ-ДД (год-месяц-день)
case "$ZONE" in
        ru|net.ru|org.ru|pp.ru|рф)
                DATE=`whois $DOMAIN | grep paid-till | awk '{ print $2 }' | sed 's/\./-/g'`
                ;;
        com|net)
                DATE=`whois $DOMAIN | grep "Registration Expiration Date:" | sed 's/Registrar Registration Expiration Date: //g;s/T/ /g' | awk '{ print $1 }'`
                ;;
        org)
                DATE=`whois $DOMAIN | grep "Registry Expiry Date:" | sed 's/Registry Expiry Date: //g;s/T/ /g' | awk '{ print $1 }'`
                ;;
        *)
                echo "-1"
                exit 1
esac

# считаем дни и выводим
expr \( `date --date="$DATE" +%s` - `date +%s` \) / 60 / 60 / 24
