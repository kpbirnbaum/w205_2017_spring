import sys

import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT


if len(sys.argv) == 1:
    conn = psycopg2.connect(database="tcount",user="postgres",password="pass",host="localhost",port="5432")
    cur = conn.cursor()
    cur.execute("SELECT * FROM tweetwordcount ORDER BY word")
    records = cur.fetchall()
    for rec in records:
        print (str(rec[0])+" , "+str(rec[1]))
    conn.close()
elif len(sys.argv) == 2:
    word = sys.argv[1].lower()
    conn = psycopg2.connect(database="tcount",user="postgres",password="pass",host="localhost",port="5432")
    cur = conn.cursor()
    cur.execute("SELECT word, count FROM tweetwordcount WHERE word=%s", (str(word),))
    if cur.rowcount==0:
        print("There are no records of the word: "+sys.argv[1])
    else:
        records = cur.fetchall()
        for rec in records:
            print ("Total number of occurrences of the word " + sys.argv[1] + ": " + str(rec[1]))
    conn.close()
else:
    print("We only accept one word at a time") 
