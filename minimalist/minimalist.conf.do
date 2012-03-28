redo-ifchange pkg
mkdir -p data
cp minimalist.conf-sample $3
sed -i "s|%PWD%|$(pwd)|" "$3"
if [ -e minimalist.conf.append ]; then
  cat minimalist.conf.append >> "$3"
  redo-ifchange minimalist.conf.append
else
  redo-ifcreate minimalist.conf.append
fi
