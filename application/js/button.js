
// シーン内でボタンが押された時の行動定義関数
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

// 上とほぼ同じ。↑の関数内で呼ばれる、行動関数
lgb.button_action_list = {
	sub_text: {
		quest_id: 'setSubTextQuestId()',
		step: 'setSubTextStep()',
		weapon_id: 'setSubTextWeaponId()',
		armor_id: 'setSubTextArmorId()',
		item_id_1: 'setSubTextItemId1()',
		item_id_2: 'setSubTextItemId2()',
		time: 'setSubTextTime()',
		r_time: 'setSubTextRTime()',
		go: 'noneAction()',
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
	this.isNotChangeScene = false;

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


		if( lgb.app.getNowSceneType() in lgb.button_scene_action_list ){
			eval( "this."+lgb.button_scene_action_list[lgb.app.getNowSceneType()][this.id]);
		}

		this.isNotChangeScene = false;
	};

	this.update = function(){
		// ctx init
		lgb.ctx_init(this.ctx);

		if( this.isOverMouse ){
			this.ctx.fillStyle = "#ff0000";
			this.ctx.strokeStyle = '#ff0000';
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
		// すでにのっている状態なので、実行
		this.lgb_button.changeSceneAction();
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

	// ボタンの行動
	this.setTextByUserData = function(type){
		if( eval("lgb.user.data.quest_select."+type) == null ){
			// ユーザーデータに何もなかったら、何もしない（テキストの表示なので。）
			return ;
		}
		this.sub_text = "";

		// lgb.button_action_list.sub_text のtype変数key 関数の実行
		eval("this."+eval("lgb.button_action_list.sub_text."+type) );
	}

	/* action func */

	this.noneAction = function(){
		// 何もしない
	};

	this.questSelectAction = function(){
		if( lgb.user.data.quest_select.quest_id != null &&
			lgb.user.data.quest_select.quest_id == this.value){
			// 同IDなら変更無し。
			return ;
		}
		var master = lgb.master.quest[this.value];
		lgb.user.data.quest_select.quest_id = this.value;
		lgb.user.data.quest_select.step = 1;			// クエストの選択なので固定
		lgb.user.data.quest_select.time = master.time;
		lgb.user.data.quest_select.r_time = master.time;
	};

	this.stepSelectAction = function(){
		if( lgb.user.data.quest_select.step != null &&
			lgb.user.data.quest_select.step == this.value){
			// 同stepなら変更無し。
			return ;
		}
		lgb.user.data.quest_select.step = this.value;
		lgb.user.data.quest_select.r_time = this.value * lgb.user.data.quest_select.time;
	};

	this.weaponSelectAction = function(){
		lgb.user.data.quest_select.weapon_id = this.value;
	};

	this.armorSelectAction = function(){
		lgb.user.data.quest_select.armor_id = this.value;
	};

	this.item1SelectAction = function(){
		lgb.user.data.quest_select.item_id_1 = this.value;
	};

	this.item2SelectAction = function(){
		lgb.user.data.quest_select.item_id_2 = this.value;
	};

	this.setSubTextQuestId = function(){
		var quest_name = lgb.master.quest[lgb.user.data.quest_select.quest_id].name;
		this.sub_text = quest_name;
	};

	this.setSubTextStep = function(){
		var step = lgb.user.data.quest_select.step;
		this.sub_text = "階層数: "+step;
	};

	this.setSubTextWeaponId = function(){
		this.sub_text = "ぶき";
	};

	this.setSubTextArmorId = function(){
		this.sub_text = "ぼうぐ";
	};

	this.setSubTextItemId1 = function(){
		this.sub_text = "あいてむ１";
	};

	this.setSubTextItemId2 = function(){
		this.sub_text = "あいてむ２";
	};

	this.setSubTextTime = function(){
		var time = lgb.master.quest[lgb.user.data.quest_select.quest_id].time;
		this.sub_text = time+"分";
	};

	this.setSubTextRTime = function(){
		var time = lgb.master.quest[lgb.user.data.quest_select.quest_id].time;
		var now = new Date();
		var now_time = now.getTime();
		var rtime = now_time + (time * 60 * 1000);
		var d = new Date(rtime);
		var yy = d.getFullYear();
		var mm = d.getMonth() + 1;
		var dd = d.getDate();
		var hh = d.getHours();
		var ii = d.getMinutes();
		var ss = d.getSeconds();
		if (mm < 10) { mm = "0" + mm; }
		if (dd < 10) { dd = "0" + dd; }
		if (hh < 10) { hh = "0" + hh; }
		if (ii < 10) { ii = "0" + ii; }
		if (ss < 10) { ss = "0" + ss; }

		delete now;
		delete d;
		this.sub_text = yy+'/'+mm+'/'+dd+' '+hh+':'+ii+':'+ss;
	};

	// 出発アクション
	this.questGoAction = function(){
		var quest = lgb.user.data.quest_select;
		if( quest.quest_id == null ){
			this.isNotChangeScene = true;
			alert('クエストが選択されていません...!');
			return ;
		}
		// ユーザーデータ更新
		///lgb.user.questGo();
	};

	// シーン切り替え処理
	this.changeSceneAction = function(){
		// 次のシーンに移る前にアクション関数実行
		var action = "this."+this.actionType+"Action()";
		eval(action);

		if( this.nextScene == "none" ){
			alert('このボタンはクリックしても反応しません。');
			return ;
		}
		if( this.isNotChangeScene ){
			return ;
		}
		lgb.app.setSceneType(this.nextScene);
	};

	// canvasに自分要素用のcanvas作成
	var style = "background-color: #0ff; left: "+this.position_x+"px; top:"+this.position_y+"px;";
	lgb.create_canvas(this.id, this.width, this.height, style);
};

/**
 * vim600: sw=4 ts=4 fdm=marker
 */

