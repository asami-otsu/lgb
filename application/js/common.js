
/* js 呼び出し元設定資料 */

var lgb = {};
// ** test **
// lgb.test_string = "test_string";
// console.log(lgb.test_string);

lgb.common = {
	api_button_url: "http://192.168.56.10/index.php/Api/getButtons",
	api_test_button_url: "http://192.168.56.10/index.php/Test/menu",
	api_user_url: "http://192.168.56.10/index.php/User/questGo",
	title: "Let Go Braver!!!",
};

// コールバック関数で処理
lgb.ajax = function (callback, params, url){
	var url = url || lgb.common.api_url;
	var params = params || [];

	var res = $.ajax({
		type: "POST",
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
	'/application/js/header.js',
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
	ctx.fillStyle = '#000000';
};

// canvas作成
lgb.create_canvas = function(id, width, height, style){
	$('#canvas').append('<canvas id='+id+' width="'+width+'" height="'+height+'" style="'+style+'" ></canvas>');
};

lgb.user = {
	id: 1,
	money: 15837,
	data: { 
		quest: { 
			list: {
				1: { 
					id: 1,
					status: 'clear',
				},
				2: {
					id: 2,
					status: "open",
				}
			},
			now: {
				id: 1,
				step: 8			// 進もうとしている階層
			}
		},
		items: {
			1: {
				id: 1,
				amount: 4,
			}
		},
		quest_select: {
			quest_id: null,
			step: null,
			weapon_id: null,
			armor_id: null,
			item_id_1: null,
			item_id_2: null,
			time: null,
			r_time: null,
			log_id: null,
		},
	},
	questGo: function(){
		// phpと通信し、ユーザーデータを更新/クエスト処理の開始
		var data = {
			user_id: this.id,
			quest_data: this.data.quest_select,
		};
		$.ajax({
			type: "POST",
			url: lgb.common.user_api,
			data: data,
			success: null,
			dataType: "json",
			async: false
		});
	},
};

lgb.master = {
	quest: {
		1: {
			id: 1,
			name: "quest_hoge",
			time: 1,
			max_step: 10
		},
		2: {
			id: 2,
			name: "quest_fuga",
			time: 2,
			max_step: 15
		},
	},
	item: {
		1: {
			id: 1,
			name: '生命のなんたら',
			type: 'hp_up',
			result: 30
		},
		2: {
			id: 2,
			name: '棍棒',
			type: 'attack_up',
			result: 5
		}
	},
};

lgb.ctx_set_font_size = function(ctx, font_size){
	var font_size = font_size || 15;
	ctx.font = 'bold '+font_size+'px Century Gothic';
};

