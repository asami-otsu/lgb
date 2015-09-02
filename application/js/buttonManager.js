
/**
 * ボタン管理者オブジェクト
 * @param array buttons ボタン情報一覧
 */
lgb.buttonManager = function(buttons){
	this.buttonsData = buttons || [];
	this.buttonList = [];

	for ( var b of this.buttonsData ){
		this.buttonList.push( new lgb.button(b.x, b.y, b.params) );
	}	

	this.init = function(){
		for( var i of this.buttonList ){
			i.init();
		}
	};

	this.draw = function(){
		for( var i of this.buttonList ){
			i.drawDisable();
			i.draw();
		}
	};

	this.getButtonList = function(){
		return this.buttonList;
	};

};

