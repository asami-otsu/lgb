
// このシーンが持っているオブジェクトenum
lgb.objectTypeList = {
	HEADER: 0,
	BUTTON: 1,
};

/**
 *
 *
 *
 */
lgb.scene = function (nowType, nowTitle, buttons, drawType, actionType){
	this.type = nowType;
	this.title = nowTitle;
	this.buttons = buttons || null;
	this.drawType = drawType;
	this.actionType = actionType;

	this.objects = [];

	this.init = function(){
		// 回すため、ここで突っ込む
		this.objects[lgb.objectTypeList.HEADER] = new lgb.header(this.type, this.title);
		this.objects[lgb.objectTypeList.BUTTON] = new lgb.buttonManager(this.buttons, this.drawType, this.actionType);

		for( var i of this.objects ){
			i.init();
		}
	};

	this.update = function(){
		for( var i of this.objects ){
			i.update();
		}
	};

	this.draw = function(){
		lgb.init(ctx);
		for( var i of this.objects ){
			i.draw();
		}
	};

	this.finish = function(){
		for( var i of this.objects ){
			i.finish();
			delete i;
		}
	};

	this.getType = function(){
		return this.type;
	};
};

