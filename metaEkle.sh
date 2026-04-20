#!/bin/bash


TAG_CODE=$(cat << 'EOF'
<script>
!function(f,b,e,v,n,t,s)
{if(f.fbq)return;n=f.fbq=function(){n.callMethod?
n.callMethod.apply(n,arguments):n.queue.push(arguments)};
if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
n.queue=[];t=b.createElement(e);t.async=!0;
t.src=v;s=b.getElementsByTagName(e)[0];
s.parentNode.insertBefore(t,s)}(window, document,'script',
'https://connect.facebook.net/en_US/fbevents.js');
fbq('init', '792966520565131');
fbq('track', 'PageView');
</script>
<noscript><img height="1" width="1" style="display:none"
src="https://www.facebook.com/tr?id=792966520565131&ev=PageView&noscript=1"
/></noscript>
EOF
)


echo "$TAG_CODE" > pixel_tmp.txt


for file in *.html; do
    if [ -f "$file" ]; then
        # <head> satırının altına içeriği oku
        sed -i "/<head>/r pixel_tmp.txt" "$file"
        echo "Başarıyla eklendi: $file"
    fi
done

# 4. Temizlik
rm pixel_tmp.txt
echo "İşlem tamam!"
