
/*
 * シーンごとのヘッダー
 *
 */
lgb.header = function(type, title){
	this.sceneType = type;
	this.title = lgb.common.title;			// ゲームタイトル
	this.sceneTitle = title || "scene hogehoge";	// シーンタイトル

	this.canvas = null;
	this.ctx = null;


	this.init = function(){
		var button_params = {
			y: -1,
			title: "戻る",
			id: "back",
			width: 45,
			height: 30,
			nextScene: lgb.app.getBackSceneType(),
		};
		this.backButton = new lgb.backButton(button_params);

		this.backButton.init();
	};

	this.update = function(){
		lgb.ctx_init(this.ctx);

		this.backButton.update();
	};

	this.draw = function(){
		var backbutton_x = 0;
		var backbutton_y = 0;
		var gametitle_x = 50;
		var gametitle_y = 0;
		var scenetitle_x = 55;
		var scenetitle_y = 15;
		var money_x = 300;
		var money_y =5;

		// 描画
		// GameTitle
		lgb.ctx_set_font_size(this.ctx, 10);
		this.ctx.fillText(this.title, gametitle_x, gametitle_y);
		// SceneTitle
		lgb.ctx_set_font_size(this.ctx, 8);
		this.ctx.fillText(this.sceneTitle, scenetitle_x, scenetitle_y);
		// Money
		lgb.ctx_set_font_size(this.ctx, 10);
		this.ctx.fillText('所持金:'+lgb.user.money, money_x, money_y);

		this.backButton.draw();
	};

	this.finish = function(){
		this.backButton.finish();
		$('#'+this.getId()).remove();
	};

	this.getId = function(){
		return 'header_'+this.sceneType;
	};

	this.getRect = function(){
		return this.c_rect;
	};

	lgb.create_canvas(this.getId(), 'canvas_header', 400, 30, "background-color: #4033d2; left: 0px; top: 0px");
	this.canvas = $('#'+this.getId()).get(0);
	if( this.canvas.getContext ){
		this.ctx = this.canvas.getContext('2d');
		lgb.init(this.ctx);
	}
	this.c_rect = $(this.canvas).offset();
	this.c_rect.height = this.canvas.height;
	this.c_rect.width = this.canvas.width;
};

