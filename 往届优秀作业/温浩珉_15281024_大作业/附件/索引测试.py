# -*- coding: utf-8 -*-
import MySQLdb as mdb
from threading import Thread
import time
import random
import string
import common as cm

config = {
    'host': '127.0.0.1',
    'port': 3306,
    'user': 'root',
    'passwd': 'jka31487',
    'db': 'meat',
    'charset': 'utf8'
}


def insert():
    # print('inserting')
    conn = mdb.connect(**config)
    cursor = conn.cursor()

    sql='select max(id) from taobaoapp_meat'
    cursor.execute(sql)
    #获取最大的id，也是当前的记录条数
    max_id=cursor.fetchone()[0]
    #print(max_id)
    # print(type(max_id))

    sql='insert into taobaoapp_meat(taobaoapp_meat.id,taobaoapp_meat.name,taobaoapp_meat.password) values(%s,%s,%s)'
    list=[]
    for i in range(1000):
        # 随机生成用户名和密码
        a_user = ''.join(random.sample(string.ascii_letters + string.digits, 8))
        a_pwd = ''.join(random.sample(string.ascii_letters + string.digits, 5))
        list.append((max_id+i+1,str("'"+a_user+"'"),str("'"+a_pwd+"'")))

    # print(sql)
    start_time=time.clock()
    cursor.executemany(sql,list)
    conn.commit()#需要添加这句话，否则无法添加
    end_time=time.clock()
    conn.close()
    return max_id,end_time-start_time

def insert_thread():
    insert_log = 'insert_log.txt'
    cm.write_log(insert_log, 'n,t')

    for i in range(pow(10, 3)):
        t1=time.clock()
        t2=time.clock()
        count=0
        while count<10 and t2-t1<1:
            n, t = insert()

            cm.write_log(insert_log, '%d,%lf' % (n, t))
            t2=time.clock()
            count=count+1
        print('n：', n)
            # print("t2-t1",t2-t1)
        # print(count)


def quray():
    print('quarying...')
    conn = mdb.connect(**config)
    cursor = conn.cursor()

    sql = 'select max(id) from taobaoapp_meat'
    cursor.execute(sql)
    # 获取最大的id，也是当前的记录条数
    max_id = cursor.fetchone()[0]
    sql = 'select * from taobaoapp_meat where taobaoapp_meat.name=%s' % ("'ssssssss'")
    # print(sql)
    start_time = time.clock()
    cursor.execute(sql)
    conn.commit()  # 需要添加这句话，否则无法添加
    res=cursor.fetchall()
    end_time = time.clock()
    conn.close()
    return max_id, end_time - start_time

def quray_thread():
    quray_log='quray_log.txt'
    cm.write_log(quray_log,'n,t')
    while True:
        time.sleep(0.5)
        n, t = quray()
        print('quray time:',t)
        cm.write_log(quray_log, '%d,%lf' % (n, t))
    # for i in range(pow(10, 4)):
    #     # time.sleep(0.5)
    #     if i%100==0:
    #         n, t = quray()
    #         if n==old_max:
    #             break
    #         cm.write_log(quray_log, '%d,%lf'%(n,t))
    #         old_max =n

def insert_quary():
    # print('inserting')
    conn = mdb.connect(**config)
    cursor = conn.cursor()

    sql = 'select * from taobaoapp_meat where taobaoapp_meat.name=%s' % ("'ssssssss'")
    # print(sql)
    start_time_ = time.clock()
    cursor.execute(sql)
    conn.commit()  # 需要添加这句话，否则无法添加
    res = cursor.fetchall()
    end_time_ = time.clock()

    sql='select max(id) from taobaoapp_meat'
    cursor.execute(sql)
    #获取最大的id，也是当前的记录条数
    max_id=cursor.fetchone()[0]
    #print(max_id)
    # print(type(max_id))

    sql='insert into taobaoapp_meat(taobaoapp_meat.id,taobaoapp_meat.name,taobaoapp_meat.password) values(%s,%s,%s)'
    list=[]
    for i in range(1000):
        # 随机生成用户名和密码
        a_user = ''.join(random.sample(string.ascii_letters + string.digits, 8))
        a_pwd = ''.join(random.sample(string.ascii_letters + string.digits, 5))
        list.append((max_id+i+1,str("'"+a_user+"'"),str("'"+a_pwd+"'")))

    # print(sql)
    start_time=time.clock()
    cursor.executemany(sql,list)
    conn.commit()#需要添加这句话，否则无法添加
    end_time=time.clock()


    conn.close()
    return max_id,end_time-start_time,end_time_-start_time_

if __name__ == "__main__":
    plog='./log_with.txt'
    cm.write_log(plog,'n,it,qt')
    for i in range(100):
        n,it,qt=insert_quary()
        cm.write_log(plog,'%d,%lf,%lf'%(n,it,qt))
        print('n:',n)





    # s=time.clock()
    # t1=Thread(target=insert_thread)
    # t1.start()
    # t2 = Thread(target=quray_thread)
    # t2.start()
    #
    # t1.join()
    # t2.join()
    # e=time.clock()
    # print('total time:',e-s)


