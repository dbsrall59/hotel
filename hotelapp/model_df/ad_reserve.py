import pandas as pd
import cx_Oracle

def ad_Reserve():
    dsn= cx_Oracle.makedsn('localhost',1521,'xe')
    conn= cx_Oracle.connect('hotel','dbdb',dsn)
    cursor=conn.cursor()
    
    sql=""" select res_id, mem_name, mem_email, mem_tel, rmnum_id, room_type, res_adult, res_kid, res_baby, res_in, res_out, res_date, res_price 
    from reserve inner join member
    on (res_mem = mem_inid)
    inner join rmnum
    on (res_rmnum = rmnum_id)
    inner join room
    on (room_id = rmnum_room)
    order by res_in desc
    """
    cursor.execute(sql)
    
    row= cursor.fetchall()
    colname= cursor.description
    
    cursor.close()
    conn.close()
    
    col=[]
    for i in colname:
        col.append(i[0])
        
    re = pd.DataFrame(row, columns=col)
    return row