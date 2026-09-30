# Loop through all 254 possible IP addresses in a standard subnet.
# Replace "192.168.1" with your actual network prefix.
for ip in {1..254}; do
  # -z: scan for listening daemons without sending data
  # -w 1: timeout after 1 second to speed up the process
  echo $ip
  nc -z -w 1 192.168.10.$ip 3000 2>/dev/null && echo "Found Grafana at: 192.168.1.$ip"
  nc -z -w 1 192.168.10.$ip 9090 2>/dev/null && echo "Found Prometheus at: 192.168.1.$ip"
done