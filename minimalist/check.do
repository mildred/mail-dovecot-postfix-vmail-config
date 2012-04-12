redo-ifchange minimalist.conf pkg data/lists.lst
export LC_ALL=C
exec >&2
cut -f1 data/lists.lst | while read list; do
  ./pkg/minimalist.pl -c "$(pwd)/minimalist.conf" - "$list"
done

