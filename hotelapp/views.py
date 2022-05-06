from django.shortcuts import render

# Create your views here.
from django.http import HttpResponse
import hotelapp.model_df.reserve as re
import hotelapp.model_df.board as bo
import hotelapp.model_df.ad_reserve as ad
import hotelapp.model_df.ad_room as adrr
import hotelapp.model_df.ad_mem as sql
import hotelapp.model_df.ad_plot as p
import hotelapp.model_df.ad_bp as bp

def room(request):
    return render(request,
                'hotelapp/room.html',{})
def twin(request):
    return render(request,
                'hotelapp/room/twin.html',{})
def suite(request):
    return render(request,
                'hotelapp/room/suite.html',{})
def bussiness(request):
    return render(request,
                'hotelapp/room/bussiness.html',{})
def deluxe(request):
    return render(request,
                'hotelapp/room/deluxe.html',{})
    
def reserve(request):
    df= re.getReserve_list()
    context = {'df': df}
    return render(request,
                'hotelapp/reserve.html', context)
    
def reserve_info(request):
    df1= re.getReserve_info1()
    df2= re.getReserve_info2()
    context={"df1": df1, "df2": df2}
    return render(request,
                'hotelapp/reserve_info.html', context)
    
def hotel_info(request):
    return render(request,
                'hotelapp/hotel_info.html', {})
    
def index(request):
    return render(request,
                'hotelapp/index.html', {})
def login(request):
    return render(request,
                'hotelapp/login.html', {})
    
def ad_mem(request):
    result= sql.adminMemberShow()
    data = {"data": result}
    return render(request,
                'hotelapp/ad_mem.html', data)
    
def ad_reserve(request):
    re = ad.ad_Reserve()
    context={"re":re}
    return render(request,
                'hotelapp/ad_reserve.html', context)
    
def ad_room(request):
    adr= adrr.ad_room()
    context={"adr": adr}
    return render(request,
                'hotelapp/ad_room.html', context)
    
def board(request):
    bd = bo.board()
    context ={"bd": bd}
    return render(request,
                'hotelapp/board.html', context)
    
def board_write(request):
    return render(request,
                'hotelapp/board_write.html', {})
def board_done(request):
    return render(request,
                'hotelapp/board_done.html', {})
    
def join(request):
    return render(request,
                'hotelapp/join.html', {})
    
def join_suc(request):
    result = sql.join()
    data={"data": result}
    return render(request,
                'hotelapp/join_suc.html', data)
    
def update(request):
    return render(request, 'hotelapp/update.html', {})


def update_suc(request):
    result = sql.update()
    data = {"data" : result}
    return render(request, 'hotelapp/update_suc.html', data)

def plot(request):
    p.get_Plot()
    p.monthlycount()
    p.test()
    return render(request,
                'hotelapp/plot.html', {})
    
def event(request):
    df = bo.get_Event()
    context={"df":df}
    return render (request,
                'hotelapp/event.html',context)
    
def prod(request):
    prod = bp.get_Prod()
    context= {"prod": prod}
    return render (request,
                'hotelapp/ad_prod.html',context)
def buyer(request):
    buyer = bp.get_Buyer()
    context= {"buyer": buyer}
    return render (request,
                'hotelapp/ad_buyer.html',context)
