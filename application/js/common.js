
/* js 呼び出し元設定資料 */

var lgb_common = {
	api_url: "http://192.168.56.10/index.php/Api/get"
};

// コールバック関数で処理
var lgb_ajax = function (callback, url){
	var url = url || lgb_common.api_url;
	var params = [];

	var res = $.ajax({
		type: "GET",
		url: url,
		cache: false,
		dataType: "json",
		success: function(data, dataType){
			callback(data);
			console.log("ajax succes." +  data['text']);
		},
		error: function(req, st, thr){
			console.log("ajax error st="+st+" thr="+thr);
		},
		data: params
		});

	return res;
};

