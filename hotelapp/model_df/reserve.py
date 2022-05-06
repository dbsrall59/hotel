import pandas as pd
import cx_Oracle

def getReserve_list():
    
    dsn=cx_Oracle.makedsn('localhost',1521,'xe')


    conn = cx_Oracle.connect('hotel','dbdb',dsn)


    cursor = conn.cursor()


    sql= """select res_in, res_out, room_sale, event_title, event_code, (room_sale*0.85)as 지불가격
            from reserve inner join rmnum
                on (res_rmnum = rmnum_id)
                inner join room
                on (room_id = rmnum_room)
                inner join member
                on (mem_inid = res_mem) 
                inner join event
                on (mem_inid = event_mem)
                where mem_inid = 32
                and extract(year from res_in)= 2022
    """
    cursor.execute(sql)


    row = cursor.fetchall()


    colname = cursor.description



    cursor.close()


    conn.close()



    col=[]
    for i in colname:
        col.append(i[0])


    df = pd.DataFrame(row, columns=col)

    return row

def getReserve_info1():
    
    dsn=cx_Oracle.makedsn('localhost',1521,'xe')


    conn = cx_Oracle.connect('hotel','dbdb',dsn)


    cursor = conn.cursor()


    sql= """select res_id, event_title, res_date, (room_sale*0.85)
        from reserve inner join rmnum
                on (res_rmnum = rmnum_id)
                inner join room
                on (room_id = rmnum_room)
                inner join member
                on (mem_inid = res_mem) 
                inner join event
                on (mem_inid = event_mem) 
        where extract(year from res_in)= 2022
    """
    cursor.execute(sql)


    row = cursor.fetchall()


    colname = cursor.description



    cursor.close()


    conn.close()



    col=[]
    for i in colname:
        col.append(i[0])


    df1 = pd.DataFrame(row, columns=col)

    return row

def getReserve_info2():
    
    dsn=cx_Oracle.makedsn('localhost',1521,'xe')


    conn = cx_Oracle.connect('hotel','dbdb',dsn)


    cursor = conn.cursor()


    sql= """select mem_id, mem_name, res_in, res_out, room_nm, rmnum_id
            from reserve inner join rmnum
                on (res_rmnum = rmnum_id)
                inner join room
                on (room_id = rmnum_room)
                inner join member
                on (res_mem = mem_inid)
            where extract(year from res_in)= 2022
    """
    cursor.execute(sql)


    row = cursor.fetchall()


    colname = cursor.description



    cursor.close()


    conn.close()



    col=[]
    for i in colname:
        col.append(i[0])


    df2 = pd.DataFrame(row, columns=col)

    return row