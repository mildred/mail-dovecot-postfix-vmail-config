redo-ifchange pkg minimalist.conf data/lists.lst
exec >&2

ALIASFILE=/etc/aliases

# Remove all references to minimalist.pl in alias file
sed -i '/minimalist.pl/d' "$ALIASFILE"

makealias(){
  local aliasname="$1"
  local args="$2"
  
  if [ -n "$args" ]; then
    args=" $args"
  fi
  
  echo "$aliasname: \"|$(pwd)/pkg/minimalist.pl -c $(pwd)/minimalist.conf$args\"" >> "$ALIASFILE"
  echo "$aliasname: \"|minimalist.pl$args\"" >&2
}

makealias minimalist

cut -f1 data/lists.lst | while read list; do
  makealias "$list" "$list"
  touch "data/$list/config"
  touch "data/$list/info"
  touch "data/$list/footer"
  chown nobody:nogroup "data/$list"
done

postalias "$ALIASFILE"

