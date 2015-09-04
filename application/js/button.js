
lgb.button_scene_action_list = {
	quest_go_opt: {
		button_quest_list: 'setTextByUserData("quest_id")',
		button_step: 'setTextByUserData("step")',
		button_weapon: 'setTextByUserData("weapon_id")',
		button_armor: 'setTextByUserData("armor_id")',
		button_item_1: 'setTextByUserData("item_id_1")',
		button_item_2: 'setTextByUserData("item_id_2")',
		button_time: 'setTextByUserData("time")',
		button_result_time: 'setTextByUserData("r_time")',
		button_go: 'setTextByUserData("go")',
	},
};

/**
 * LGBボタン基本オブジェクト
 * @param int x
 * @param int y
 * @param object params
 */
lgb.button = function(params){
	this.position_x = params.x || 0;	// このオブジェクト自身の座標
	this.position_y = params.y || 0;

	this.title = params.title || "none title";
	this.text = params.text || "none";
	this.sub_text = params.sub_text || "none";
	this.id = params.id || this.title;
	this.width = params.width || 400;
	this.height = params.height || 30;
	this.value = params.value || 0;
	this.inOverMouse = false;
	this.isSceneAction = false;

	this.canvas = null;
	this.ctx = null;
	this.c_rect = null;

	this.nextScene = params.nextScene;

	this.actionType = params.actionType || "none";

	this.init = function(){
		this.canvas = $('#'+this.id).get(0);
		if( this.canvas.getContext ){
			this.ctx = this.canvas.getContext('2d');
			lgb.init(this.ctx);
		}
		this.c_rect = $(this.canvas).offset();

		// addEventListener
		this.canvas.lgb_button = this;
		this.canvas.addEventListener('mouseover', this.onOver, false);
		this.canvas.addEventListener('click', this.onClick, false);
		this.canvas.addEventListener('mouseout', this.onOut, false);


		Object.keys(lgb.button_scene_action_list).forEach(function(key){
			if( key == lgb.app.getNowSceneType() ){
				this.isSceneAction = true;
			};
		});
	};

	this.update = function(){
		// ctx init
		lgb.ctx_init(this.ctx);

		if( this.isOverMouse ){
			this.ctx.fillStyle = "#ff0000";
			this.ctx.strokeStyle = '#ff0000';
		}

		if( this.isSceneAction ){
console.log("if in isSceneAction");
			eval( "this."+lgb.button_scene_action_list[lgb.app.getNowSceneType()][this.id]);
			//eval ("this."+ eval( eval("lgb.button_scene_action_list."+lgb.app.getNowSceneType())+ "."+this.id) );
		}
	};

	this.draw = function(x, y, text){
		var x = x || this.position_x;
		var y = y || this.position_y;
		var text = text || this.text;


		// 描画
		this.ctx.strokeRect(0, 0, this.width, this.height);

		lgb.ctx_set_font_size(this.ctx, 15);
		this.ctx.fillText(this.title, 0, 0);

		if( this.text != "none" ){
			lgb.ctx_set_font_size(this.ctx, 10);
			this.ctx.fillText(this.text, 5, 20);
		}

		if( this.sub_text != "none" ){
			lgb.ctx_set_font_size(this.ctx, 10);
			this.ctx.fillText(this.sub_text, 300, 10);
		}
	};

	this.finish = function(){
		$('#'+this.id).remove();
	};
// {{{
	this.drawDisable = function(){
	};
// }}}
	this.onClick = function(e){
		// すでにのっている状態

		// 次のシーンに移る前にアクション関数実行
		var actionName = "this.lgb_button."+this.lgb_button.actionType+"Action()";
		eval (actionName);

		lgb.app.setSceneType(this.lgb_button.nextScene);
	};

	this.onOver = function(e){
		this.lgb_button.isOverMouse = true;
	};

	this.onOut = function(e){
		this.lgb_button.isOverMouse = false;
	};

	this.isCollision = function(m_x, m_y){
		var x = this.position_x + this.c_rect.left;
		var y = this.position_y + this.c_rect.top;
		return (x <= m_x && y <= m_y && (x + this.width) >= m_x && (y + this.height) >= m_y );
	};

	this.setTextByUserData = function(type){
		if( type == "go" ){
console.log('setTextByUserData func go');
			return ;
		}
		this.sub_text = "クエストマスターからid=" + eval("lgb.user.data.quest_select."+type) + "のデータを取得し、表示する";
	}

	/* action func */

	this.noneAction = function(){
		// 何もしない
	};

	this.questSelectAction = function(){
		lgb.user.data.quest_select.quest_id = this.value;
	};

	this.weaponSelectAction = function(){
		lgb.user.data.quest_select.weapon_id = this.value;
	};


	// canvasに自分要素用のcanvas作成
	var style = "background-color: #30a077; left: "+this.position_x+"px; top:"+this.position_y+"px;";
	lgb.create_canvas(this.id, this.width, this.height, style);
};

/**
 * vim600: sw=4 ts=4 fdm=marker
 */

