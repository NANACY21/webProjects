// �ҵ�js

//�����ͳ�ʼ����ͼ������
function initMap(){
    createMap();//������ͼ
    setMapEvent();//���õ�ͼ�¼�
    addMapControl();//���ͼ��ӿؼ�
    addMarker();//���ͼ�����marker
}

//������ͼ������
function createMap(){
    var map = new BMap.Map("dituContent");//�ڰٶȵ�ͼ�����д���һ����ͼ
    var point = new BMap.Point(126.621308,45.71211);//����һ�����ĵ�����
    map.centerAndZoom(point,15);//�趨��ͼ�����ĵ�����겢����ͼ��ʾ�ڵ�ͼ������
    window.map = map;//��map�����洢��ȫ��
}

//��ͼ�¼����ú�����
function setMapEvent(){
    map.enableDragging();//���õ�ͼ��ק�¼���Ĭ������(�ɲ�д)
    map.enableScrollWheelZoom();//���õ�ͼ���ַŴ���С
    map.enableDoubleClickZoom();//�������˫���Ŵ�Ĭ������(�ɲ�д)
    map.enableKeyboard();//���ü����������Ҽ��ƶ���ͼ
}

//��ͼ�ؼ���Ӻ�����
function addMapControl(){
    //���ͼ��������ſؼ�
    var ctrl_nav = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
    map.addControl(ctrl_nav);
    //���ͼ���������ͼ�ؼ�
    var ctrl_ove = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:1});
    map.addControl(ctrl_ove);
    //���ͼ����ӱ����߿ؼ�
    var ctrl_sca = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
    map.addControl(ctrl_sca);
}

//�ҵ�λ��
var geolocation = new BMap.Geolocation();
geolocation.getCurrentPosition(function(r){
    if(this.getStatus() == BMAP_STATUS_SUCCESS){
        var mk = new BMap.Marker(r.point);
        map.addOverlay(mk);
        map.panTo(r.point);
        alert('����λ�ã�'+r.point.lng+','+r.point.lat);
        document.getElementById("myX").value=r.point.lng;
        document.getElementById("myY").value=r.point.lat;
    }
    else {
        alert('failed'+this.getStatus());
    }
});

//����marker
function addMarker(){
    for(var i=0;i<markerArr.length;i++){
        var json = markerArr[i];
        var p0 = json.point.split("|")[0];
        var p1 = json.point.split("|")[1];
        var point = new BMap.Point(p0,p1);
        var iconImg = createIcon(json.icon);
        var marker = new BMap.Marker(point,{icon:iconImg});
        var iw = createInfoWindow(i);
        var label = new BMap.Label(json.title,{"offset":new BMap.Size(json.icon.lb-json.icon.x+10,-20)});
        marker.setLabel(label);
        map.addOverlay(marker);
        label.setStyle({
            borderColor:"#808080",
            color:"#333",
            cursor:"pointer"
        });

        (function(){
            var index = i;
            var _iw = createInfoWindow(i);
            var _marker = marker;
            _marker.addEventListener("click",function(){
                this.openInfoWindow(_iw);
            });
            _iw.addEventListener("open",function(){
                _marker.getLabel().hide();
            })
            _iw.addEventListener("close",function(){
                _marker.getLabel().show();
            })
            label.addEventListener("click",function(){
                _marker.openInfoWindow(_iw);
            })
            if(!!json.isOpen){
                label.hide();
                _marker.openInfoWindow(_iw);
            }
        })()
    }
}
//����InfoWindow
function createInfoWindow(i){
    var json = markerArr[i];
    var iw = new BMap.InfoWindow("<b class='iw_poi_title' title='" + json.title + "'>" + json.title + "</b><div class='iw_poi_content'>"+json.content+"</div>");
    return iw;
}
//����һ��Icon
function createIcon(json){
    var icon = new BMap.Icon("img/icon.png", new BMap.Size(json.w,json.h),{imageOffset: new BMap.Size(-json.l,-json.t),infoWindowOffset:new BMap.Size(json.lb+5,1),offset:new BMap.Size(json.x,json.h)})
    return icon;
}

initMap();//�����ͳ�ʼ����ͼ