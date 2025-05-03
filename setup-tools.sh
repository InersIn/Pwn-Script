#!/bin/sh

echo "[+] Setup pwndbg"
git clone https://github.com/pwndbg/pwndbg
cd pwndbg
./setup.sh
cd ..
mv pwndbg ~/pwndbg-src

echo "[+] Setup peda"
git clone https://github.com/longld/peda.git ~/peda

echo "[+] Setup gef"
wget -q -O ~/.gdbinit-gef.py https://github.com/hugsy/gef/raw/master/gef.py

echo "[+] Combine All"

cat << EOF > ~/.gdbinit
define init-peda
source ~/peda/peda.py
end
document init-peda
Initializes the PEDA (Python Exploit Development Assistant for GDB) framework
end

define init-pwndbg
source ~/.gdbinit_pwndbg
end
document init-pwndbg
Initializes PwnDBG
end

define init-gef
source ~/.gdbinit-gef.py
end
document init-gef
Initializes GEF (GDB Enhanced Features)
end
EOF

echo "[+] Setup finished!"
