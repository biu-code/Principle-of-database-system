# -*- coding: utf-8 -*-
"""
Created on Tue Oct 10 16:57:39 2017

@author: wenhaomin
"""
import random as rd
#构造淘宝数据库的各种数据

#将一行内容写入日志文档
def write_log(fp="./log.log" ,content="",model="a"):
    log = open(fp,model)
    log.write(content+"\n")
    log.close()
        
def data(fn,header,contents):
    write_log(fn,header,"w")
    for line in contents:
        write_log(fn,line,"a")
        
cart=[str(i) for i in range(100)]
data("cart.csv","ID",cart)
    
shop=["%d,shop%d,%d"%(i,i,rd.randint(1,5)) for i in range(100)]
data("shop.csv","ID,Name,Level",shop)

item=["%d,%d,item%d,%d"%(i,rd.randint(10,10000),i,i%50) for i in range(1000)] #i%shopnu_num保证参照完整性
data("item.csv","ID,Price,Name,ShopID",item)
        
user=["%d,account%d,password%d,user%d,%d,%d,idcode%d,%d,email%d@qq.com,%d,tel%d,addr%d,%d,%d"
      %(i,i,i,i,rd.randint(0,1),rd.randint(10,50),i,rd.randint(1,3),i,rd.randint(20,30),i,i,i,i)
      for i in range(100)]
data("user1.csv",
     "ID,Account,Password,Name,Gender,Age,IDCode,RolesID,Email,Credit,Tel,Address,CartID,ShopID",
     user)
        
order=["%d,2017-10-11 22:30:34,%d,%d"%(i,rd.randint(0,100),rd.randint(0,100))  for i in range(100)]
data("order.csv","ID,Date,Buyer,Seller",order)

cart_item_relation=["%d,%d"%(rd.randint(0,100),rd.randint(0,1000)) for i in range(100)]
data("cart_item_relation.csv","CartID,ItemID",cart_item_relation)

order_item_relation=["%d,%d"%(rd.randint(0,50),rd.randint(0,1000)) for i in range(100)]
data("order_item_relation.csv","OrderID,ItemID",order_item_relation)

shop_item_relation=["%d,%d"%(rd.randint(0,100),rd.randint(0,1000)) for i in range(100)]
data("shop_item_relation.csv","ShopID,ItemID",shop_item_relation)

