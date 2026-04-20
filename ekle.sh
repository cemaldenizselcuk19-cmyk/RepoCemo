#!/bin/bash


TAG_CODE='<script async src="https://www.googletagmanager.com/gtag/js?id=G-BKE66V4J4L"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag("js", new Date());
  gtag("config", "G-BKE66V4J4L");
</script>'


echo "$TAG_CODE" > google_tag.tmp


for file in *.html; do
    if [ -f "$file" ]; then
        # <head> etiketini bul ve hemen altına google_tag.tmp dosyasının içeriğini ekle
        # Ubuntu GNU sed syntax:
        sed -i "/<head>/r google_tag.tmp" "$file"
        echo "Bitti: $file"
    fi
done


rm google_tag.tmp

echo "İşlem tamam, bütün sayfalara Google Tag eklendi."
