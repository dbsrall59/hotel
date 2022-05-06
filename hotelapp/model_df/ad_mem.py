<<<<<<< HEAD
import pandas as pd
=======
>>>>>>> bcb163ffdf3e5ab0e48f38d426227d1108b397b7
import cx_Oracle

def select_basic():
    dsn = cx_Oracle.makedsn('localhost', 1521, 'xe')
    conn = cx_Oracle.connect('hotel', 'dbdb', dsn)
    cursor = conn.cursor()
    
    sql = """"""
    
    cursor.execute(sql)
    row = cursor.fetchall()
    
    cursor.close()
    conn.close()
    
    return row

def iu_basic():
    dsn = cx_Oracle.makedsn('localhost', 1521, 'xe')
    conn = cx_Oracle.connect('hotel', 'dbdb', dsn)
    cursor = conn.cursor()
    
    sql = """"""
    
    cursor.execute(sql)
    conn.commit()
    
    cursor.close()
    conn.close()
    
    
def adminMemberShow():
    dsn = cx_Oracle.makedsn('localhost', 1521, 'xe')
    conn = cx_Oracle.connect('hotel', 'dbdb', dsn)
    cursor = conn.cursor()
    
    sql = """select mem_inid as A, mem_id, mem_inid, mem_name, mem_email, 
<<<<<<< HEAD
            '0' || to_char(mem_tel),
            decode(trunc(mem_regno / 100000), 1, to_date(19000000 + mem_regno, 'yyyymmdd'), to_date(20000000 + mem_regno, 'yyyymmdd')) as mem_bir, 
            decode(mem_gender, 1, '남성', '여성') as mem_gender, 
            mem_add, mem_date
            from member
            order by mem_inid asc"""
=======
'0' || to_char(mem_tel),
decode(trunc(mem_regno / 100000), 1, to_date(19000000 + mem_regno, 'yyyymmdd'), to_date(20000000 + mem_regno, 'yyyymmdd')) as mem_bir, 
decode(mem_gender, 1, '남성', '여성') as mem_gender, 
mem_add, mem_date
from member
order by mem_inid asc"""
>>>>>>> bcb163ffdf3e5ab0e48f38d426227d1108b397b7
    
    cursor.execute(sql)
    row = cursor.fetchall()
    
    cursor.close()
    conn.close()
    
    return row

def join():
    dsn = cx_Oracle.makedsn('localhost', 1521, 'xe')
    conn = cx_Oracle.connect('hotel', 'dbdb', dsn)
    cursor = conn.cursor()
    
    sql = """insert into member
<<<<<<< HEAD
            (MEM_ID,MEM_PW,MEM_REGNO,MEM_STAFF,MEM_CARDNO,MEM_CDPW,MEM_GENDER,MEM_TEL,MEM_EMAIL,MEM_NAME,MEM_ADD,MEM_DATE)
            values('wow', 'asdqwdqwd', 881010, 0, 1234, 42, 1, 01012345678, 'asd@gmail.com', '일이상', '서울특별시', sysdate)"""
=======
(MEM_ID,MEM_PW,MEM_REGNO,MEM_STAFF,MEM_CARDNO,MEM_CDPW,MEM_GENDER,MEM_TEL,MEM_EMAIL,MEM_NAME,MEM_ADD,MEM_DATE)
values('wow', 'asdqwdqwd', 881010, 0, 1234, 42, 1, 01012345678, 'asd@gmail.com', '일이상', '서울특별시', sysdate)"""
>>>>>>> bcb163ffdf3e5ab0e48f38d426227d1108b397b7
    
    cursor.execute(sql)
    conn.commit()
    
<<<<<<< HEAD
    sql = """select mem_name, mem_id from member where mem_id = 'wow'"""
=======
    sql = """select mem_name, mem_id, mem_date from member where mem_id = 'wow'"""
>>>>>>> bcb163ffdf3e5ab0e48f38d426227d1108b397b7
    cursor.execute(sql)
    row = cursor.fetchone()
    
    cursor.close()
    conn.close()
    
    
    return row

def update():
    dsn = cx_Oracle.makedsn('localhost', 1521, 'xe')
    conn = cx_Oracle.connect('hotel', 'dbdb', dsn)
    cursor = conn.cursor()
    
    sql = """update member
<<<<<<< HEAD
        set mem_pw = 'testtest', mem_regno = 900101, mem_tel = 01009876654, mem_email = 'change@gmail.com'
        where mem_id = 'wow'"""
=======
set mem_pw = 'testtest', mem_regno = 900101, mem_tel = 01009876654, mem_email = 'change@gmail.com'
where mem_id = 'wow'"""
>>>>>>> bcb163ffdf3e5ab0e48f38d426227d1108b397b7
    
    cursor.execute(sql)
    conn.commit()
    
    sql = """select mem_name, mem_id from member where mem_id = 'wow'"""
    cursor.execute(sql)
    row = cursor.fetchone()
    
    cursor.close()
    conn.close()
    
    
    return row