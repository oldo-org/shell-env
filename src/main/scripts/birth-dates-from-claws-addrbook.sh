#! /bin/bash 

bdate_p="attribute-list/attribute[@name='date of birth']"
name_p="@cn"
email_p="address-list/address/@email"
address_p="attribute-list/attribute[@name='address']"

OIFS=$IFS
IFS="|"

year=$(date +%Y)
today=$(date +%m-%d)
tomorrow=$(date +%m-%d -d "today + 1 day")
in1week_=$(date +%m-%d -d "today + 1 week")
in2weeks=$(date +%m-%d -d "today + 2 week")
in3weeks=$(date +%m-%d -d "today + 3 week")

function notify() {
  echo "Sending email with subject = '$1' and body = '$2' ..."
  echo -e "Subject: $1\nTo: calendar@oldo.org\n\n$2" | msmtp -t -a cron@oldo.org 
}

xmlstarlet sel -T -t \
	-m "/address-book/person[attribute-list/attribute/@name='date of birth']" \
	-v "concat(${bdate_p},'|',${name_p},'|',${email_p},'|',${address_p})" \
	-n ~/office/claws-mail/addrbook/addrbook*.xml \
| while read bdate name email address; do

  byear=$(echo $bdate | cut -c1-4)
  bday=$(echo $bdate | cut -c6-10)

  age=$(($year-$byear))
  msg="$year-$bday : Birthday of $name : $age years old"
  details="$email\n$address"

  if [[ $bday = $today ]]; then
    notify "$msg (Today!!)" "$details"
  elif [[ $bday = $tomorrow ]]; then
    notify "$msg (Tomorrow!)" "$details"
  elif [[ $bday = $in1week_ ]]; then
    notify "$msg (in 1 week)" "$details"
  elif [[ $bday = $in2weeks ]]; then
    notify "$msg (in 2 weeks)" "$details"
  elif [[ $bday = $in3weeks ]]; then
    notify "$msg (in 3 weeks)" "$details"
  fi

done

IFS=$OIFS
