/**
 * @author liuquanhui
 * @Date 2018-5-24 10:04:28
 * */

var page = {
    init : function () {
        this.initMap();
    },
    initMap : function () {
        var windowsArr = [];
        var marker = [];
        var map = new AMap.Map("mapContainer", {
            resizeEnable: true,
            center: [114.298572,30.584355],//地图中心点
            zoom: 13,//地图显示的缩放级别
            keyboardEnable: false
        });
        AMap.plugin(['AMap.Autocomplete','AMap.PlaceSearch'],function(){
            var autoOptions = {
                city: "北京", //城市，默认全国
                input: "keyword-get-car"//使用联想输入的input的id
            };
            autocomplete= new AMap.Autocomplete(autoOptions);
            var placeSearch = new AMap.PlaceSearch({
                city:'北京',
                map:map
            });
            AMap.event.addListener(autocomplete, "select", function(e){
                //TODO 针对选中的poi实现自己的功能
                placeSearch.setCity(e.poi.adcode);
                placeSearch.search(e.poi.name)
            });

            /*还车地点*/
            var autoOptionsReturnCar = {
                city: "北京", //城市，默认全国
                input: "keyword-return-car"//使用联想输入的input的id
            };
            autocomplete= new AMap.Autocomplete(autoOptionsReturnCar);
            var placeSearch = new AMap.PlaceSearch({
                city:'北京',
                map:map
            });
            AMap.event.addListener(autocomplete, "select", function(e){
                //TODO 针对选中的poi实现自己的功能
                placeSearch.setCity(e.poi.adcode);
                placeSearch.search(e.poi.name)
            });
        });
    }
};

$(function () {
    page.init();
});