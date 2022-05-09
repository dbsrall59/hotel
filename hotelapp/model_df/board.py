import pandas as pd
import cx_Oracle

def board():
    dsn = cx_Oracle.makedsn('localhost', 1521, 'xe')
    conn = cx_Oracle.connect('hotel','dbdb', dsn)
    cursor = conn.cursor()

    sql = """select post_id as "번호", 
                    decode(post_type,
                            1, '문의글',
                            0, '후기글') as "구분", 
                    post_title as "제목", 
                    mem_id as "글쓴이", 
                    post_date as "작성일", 
                    post_count as "조회수"
                    from post inner join member
                        on(mem_inid = post_mem)
            order by post_id desc"""
    cursor.execute(sql)
    row = cursor.fetchall()
    colname = cursor.description

    cursor.close()
    conn.close()

    col = []
    for i in colname:
        col.append(i[0])

    bd = pd.DataFrame(row, columns = col)

    return row
