import pandas as pd
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

            '0' || to_char(mem_tel),
            decode(trunc(mem_regno / 100000), 0, to_date(20000000 + mem_regno, 'yyyymmdd'), to_date(19000000 + mem_regno, 'yyyymmdd')) as mem_bir, 
            decode(mem_gender, 1, '남성', '여성') as mem_gender, 
            mem_add, mem_date
            from member
            order by mem_inid asc"""

    
    cursor.execute(sql)
    row = cursor.fetchall()
    
    cursor.close()
    conn.close()    
    
    return row

def join(id, pw, m_name, m_email, tel, regno, gender):
    dsn = cx_Oracle.makedsn('localhost', 1521, 'xe')
    conn = cx_Oracle.connect('hotel', 'dbdb', dsn)
    cursor = conn.cursor()
    
    sql = """insert into member (mem_id, mem_pw, mem_name, mem_email, mem_tel, mem_regno, mem_gender, mem_date, mem_add, mem_staff, mem_cardno, mem_cdpw) values('"""
    sql += id
    sql += "','"
    sql += pw
    sql += "','"
    sql += m_name
    sql += "','"
    sql += m_email
    sql += "','"
    sql += tel
    sql += "','"
    sql += regno 
    sql += "','"
    sql += gender    
    sql += "','"
    sql += '20220506'    
    sql += "','"
    sql += '세종'    
    sql += "','"
    sql += '0'    
    sql += "','"
    sql += ''    
    sql += "','"
    sql += ''   
    sql += "')"
    cursor.execute(sql)
    conn.commit()
    
    sql = """select mem_name, mem_id, mem_date from member where mem_id = '"""
    sql += id
    sql += "'"
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
    set mem_pw = 'testtest', mem_regno = 900101, mem_tel = 01009876654, mem_email = 'change@gmail.com'
    where mem_id = 'wow'"""

    cursor.execute(sql)
    conn.commit()
    
    sql = """select mem_name, mem_id, '0'||mem_tel, mem_regno, 
            decode(mem_gender,
            1, '남자',
            2, '여자'), mem_email, mem_pw from member where mem_id = 'wow'"""
    cursor.execute(sql)
    row = cursor.fetchone()
    
    cursor.close()
    conn.close()
    
    
    return row