import sys

import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

class RangeException(Exception):
    pass


if len(sys.argv) == 2:
    rangehist = sys.argv[1].split(",")
                
    if len(rangehist) != 2:
        raise RangeException("You have " + str(len(rangehist))+" digits instead of 2. Or you did not seperate digits by a comma")
    begin = rangehist[0]
    end = rangehist[1]
    conn = psycopg2.connect(database="tcount",user="postgres",password="pass",host="localhost",port="5432")
    cur = conn.cursor()
    cur.execute("SELECT * FROM tweetwordcount WHERE count between %s and %s",(str(begin),str(end)))
    if cur.rowcount==0:
        print("There are no words within that range of values")
    records = cur.fetchall()
    for rec in records:
        print (str(rec[0])+": "+str(rec[1]))

else:
    print("You entered an invalid format. The proper format is rangestart,rangestop with one comma and no spaces")

