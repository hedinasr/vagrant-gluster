# ansible -i $HOME/.kubespray/inventory/inventory.cfg all -m script -a "./rules.sh"
# on crée une chaine et on y injecte des règles
iptables -N GLUSTER
iptables -A GLUSTER -p tcp -m state --state NEW -m tcp --dport 24007 -j ACCEPT
iptables -A GLUSTER -p tcp -m state --state NEW -m tcp --dport 24008 -j ACCEPT
iptables -A GLUSTER -p tcp -m state --state NEW -m tcp --dport 24009 -j ACCEPT
iptables -A GLUSTER -p tcp -m state --state NEW -m tcp --dport 38465 -j ACCEPT
iptables -A GLUSTER -p tcp -m state --state NEW -m tcp --dport 38466 -j ACCEPT
iptables -A GLUSTER -p tcp -m state --state NEW -m tcp --dport 38467 -j ACCEPT
iptables -A GLUSTER -p tcp -m state --state NEW -m tcp --dport 38468 -j ACCEPT
iptables -A GLUSTER -p tcp -m state --state NEW -m tcp --dport 38469 -j ACCEPT
iptables -A GLUSTER -p tcp -m state --state NEW -m tcp --dport 2222 -j ACCEPT
iptables -A GLUSTER -p tcp -m state --state NEW -m multiport --dports 49152:49664 -j ACCEPT

# on sauve les règles
# service iptables save # => marche pas...
