
/**
 * ボタン管理者オブジェクト
 * @param array buttons ボタン情報一覧
 */
lgb.buttonManager = function(buttons, drawType, actionType){
	this.buttonsData = buttons || [];
	this.buttonList = [];

	this.drawType = drawType || "none";

	for ( var b of this.buttonsData ){
		this.buttonList.push( new lgb.button(b.params) );
	}	

	this.init = function(){
		for( var i of this.buttonList ){
			i.init();
		}
	};
	this.update = function(){
		for( var i of this.buttonList ){
			i.update();
		}
	};

	this.draw = function(){
		for( var i of this.buttonList ){
			i.drawDisable();
			i.draw();
		}
	};

	this.finish = function(){
		for( var i of this.buttonList ){
			i.finish();
			delete i;
		}
	};

	this.getButtonList = function(){
		return this.buttonList;
	};

};

