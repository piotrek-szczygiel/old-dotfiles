PING=$(ping -c 4 www.stackoverflow.com | tail -1| awk '{print $4}' |\
    cut -d '/' -f 2 | cut -f1 -d".")

echo -n "%{F#bd93f9}%{F-} ${PING}ms"
