
redo-ifchange minimalist.tar.gz
dir="$(tar tzf minimalist.tar.gz | head -n 1 | cut -d/ -f1)"
tar xf minimalist.tar.gz
mv "$dir" "$3"
