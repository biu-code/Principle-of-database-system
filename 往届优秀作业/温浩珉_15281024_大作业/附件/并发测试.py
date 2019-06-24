import MySQLdb as mdb
config = {
    'host': '127.0.0.1',
    'port': 3306,
    'user': 'root',
    'passwd': 'jka31487',
    'db': 'meat',
    'charset': 'utf8'
}

conn = mdb.connect(**config)
cursor = conn.cursor()
sql_1='select * FROM meat.taobaoapp_meat where id=%d'% 2

from threading import Thread
import time


def loop(name, seconds):
    conn = mdb.connect(**config)
    cursor = conn.cursor()
    print('start loop', name, ' at:', time.ctime())
    cursor.execute(sql_1)
    time.sleep(seconds)
    if name==0:
        new_name='线程一'
        sql_2 = 'UPDATE taobaoapp_meat SET taobaoapp_meat.name=%s  , taobaoapp_meat.password=%s WHERE id = %d;' % (str(2 * new_name), str(3 * name), 2)
        cursor.execute(sql_2)
    if name==1:
        sql_2 = 'UPDATE taobaoapp_meat SET taobaoapp_meat.name=%s  , taobaoapp_meat.password=%s WHERE id = %d;' % (str(2*name),str(3*name),2)
        cursor.execute(sql_2)
    cursor.close()

    print('end loop', name, ' at:', time.ctime())
    conn.close()

if __name__ == '__main__':
    loops = [2, 4]
    nloops = range(len(loops))
    threads = []
    print('starting at :', time.ctime())

    for i in nloops:
        t = Thread(target=loop, args=(i, loops[i],))
        threads.append(t)
    for i in nloops:
        threads[i].start()
    for i in nloops:
        threads[i].join()

    print('all DONE at :', time.ctime())
    conn.close()






