from django.shortcuts import render

from django.http import HttpResponse
import hotelapp.model_df.board as bod
import hotelapp.model_df.reserve as re
import hotelapp.model_df.ad_room as ar
import hotelapp.model_df.ad_mem as adm
import hotelapp.model_df.ad_reserve as adre
import hotelapp.model_df.test as ts
import hotelapp.model_df.ad_bp as bp
import hotelapp.model_df.event as et

def index(request):
    return render(request,
                  "hotelapp/index.html", {})

def room(request):
    return render(request,
                  "hotelapp/room.html", {})
    
def reserve_info(request):
    return render(request,
                  "hotelapp/reserve_info.html", {})
def reserve(request):
    return render(request,
                  "hotelapp/reserve.html", {})
    
def hotel_info(request):
    return render(request,
                  "hotelapp/hotel_info.html", {})
def login(request):
    return render(request,
                  "hotelapp/login.html", {})
    
def ad_mem(request):
    return render(request,
                  "hotelapp/ad_mem.html", {})
    
def ad_reserve(request):
    return render(request,
                  "hotelapp/ad_reserve.html", {})
    
def ad_room(request):
    return render(request,
                  "hotelapp/ad_room.html", {})
def board(request):
    return render(request,
                  "hotelapp/board.html", {})
def twin(request):
    return render(request,
                  "hotelapp/room/twin.html", {})
def suite(request):
    return render(request,
                  "hotelapp/room/suite.html", {})
def deluxe(request):
    return render(request,
                  "hotelapp/room/deluxe.html", {})
def bussiness(request):
    return render(request,
                  "hotelapp/room/bussiness.html", {})
def board_write(request):
    return render(request,
                  "hotelapp/board_write.html", {})
def board_done(request):
    return render(request,
                  "hotelapp/board_done.html", {})
def update(request):
    return render(request,
                  "hotelapp/update.html", {})
def update_suc(request):
    return render(request,
                  "hotelapp/update_suc.html", {})
def buyer(request):
    buyer = bp.get_Buyer()
    context = {"buyer":buyer}
    return render(request,
                "hotelapp/ad_buyer.html", context)
def prod(request):
    prod = bp.get_Prod()
    context = {"prod":prod}
    return render(request,
                "hotelapp/ad_prod.html", context)
def event(request):
    return render(request,
                "hotelapp/event.html", {})

def board(request):
    bd = bod.board()
    
    context = {"bd" : bd}
    return render(request,
                    "hotelapp/board.html",
                    context)
    
def reserve(request):
    df = re.getReserve_list()
    context = {"df" : df}
    return render(request,
                    "hotelapp/reserve.html", context)

def reserve_info(request):
    df1 = re.getReserve_info1()
    df2 = re.getReserve_info2()
    context = {"df1" : df1, "df2" : df2}
    return render(request,
                    "hotelapp/reserve_info.html", context)
    
def ad_room(request):
    adr = ar.ad_room()
    context = {"adr" : adr}
    return render(request,
                "hotelapp/ad_room.html", context)
    
def ad_reserve(request):
    asdf = adre.ad_Reserve()
    context = {"aa" : asdf} 
    return render(request,
                "hotelapp/ad_reserve.html", context)

def update(request):
    result = adm.update()
    data = {"data" : result}
    return render(request, 'hotelapp/update.html', data)


def update_suc(request):
    result = adm.update()
    data = {"data" : result}
    return render(request, 'hotelapp/update_suc.html', data)

def ad_mem(request):
    result = adm.adminMemberShow()
    
    data = {"data" : result}
    return render(request, 'hotelapp/ad_mem.html', data)

def plot(request):
    ts.get_Plot()
    ts.test()
    ts.monthlycount()
    return render(request, 'hotelapp/plot.html', {})

def event(request):
    eve = et.get_event()
    asdf = {"eve" : eve}
    return render(request, 'hotelapp/event.html', asdf)



def join(request):
    return render(request, 'hotelapp/join.html', {})
 
def join_suc(request):
    id = request.GET.get('mem_id')
    pw = request.GET.get('mem_pw')
    m_name = request.GET.get('mem_name')
    m_email = request.GET.get('mem_email')
    tel = request.GET.get('mem_tel')
    regno = request.GET.get('mem_regno')
    if request.GET.get('mem_gender') == '남성':
        gender = '1'
    else:
        gender = '0'
    result = adm.join(id,pw, m_name, m_email, tel, regno, gender)
    data = {"data" : result}
    
    return render(request, 'hotelapp/join_suc.html', data)