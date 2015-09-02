
/**
 * LGBボタン基本オブジェクト
 * @param int x
 * @param int y
 * @param object params
 */
lgb.button = function(x, y, params){
	this.position_x = x || 0;
	this.position_y = y || 0;
	this.text = params.text || "NoneText";
	this.size_x = params.size_x || 400;
	this.size_y = params.size_y || 30;
	this.inOverMouse = false;

	this.canvas = null;
	this.ctx = null;
	this.c_rect = null;

	this.nextScene = params.nextScene;

	this.init = function(){
		this.canvas = $('#'+this.text).get(0);
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
		this.ctx.fillText(this.text, 0, 0);
		this.ctx.strokeRect(0, 0, this.size_x, this.size_y);
	};

	this.finish = function(){
		$('#'+this.text).remove();
	};

	this.drawDisable = function(){
	};

	this.onClick = function(e){
		// すでにのっている状態
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
		return (x <= m_x && y <= m_y && (x + this.size_x) >= m_x && (y + this.size_y) >= m_y );
	};

	// canvasに自分要素用のcanvas作成
	$('#canvas').append("<canvas id='"+this.text+"' width='"+this.size_x+"' height='"+this.size_y+"' style='background-color: #30a077; left:"+this.position_x+"px; top:"+this.position_y+"px' ></canvas>");
};

