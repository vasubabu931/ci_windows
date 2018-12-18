@echo
set sleep=ping 127.0.0.1 -n

sc stop W3SVC
%sleep% 10 > null

sc start  W3SVC

%sleep% 10 > null

echo restart w3 server successfully

