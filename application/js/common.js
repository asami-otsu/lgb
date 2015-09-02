
/* js 呼び出し元設定資料 */

var lgb = {};
// ** test **
// lgb.test_string = "test_string";
// console.log(lgb.test_string);

lgb.common = {
	api_url: "http://192.168.56.10/index.php/Api/get"
};

// コールバック関数で処理
lgb.ajax = function (callback, params, url){
	var url = url || lgb.common.api_url;
	var params = params || [];

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

lgb.js_urls = [
	'/application/js/button.js',
	'/application/js/buttonManager.js',
	'/application/js/scene.js',
	'/application/js/sceneManager.js'
];

// ctx の文字等の表示周り初期化
lgb.ctx_init = function(ctx){
	if( ! ctx ){
		// ctx がない
		console.log('ctx non object');
		return ;
	}
	ctx.strokeStyle = '#000000';
};

