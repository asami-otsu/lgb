
/**
 *
 *
 *
 */
lgb.scene = function (nowType, buttons){
	this.type = nowType;
	this.buttonManager = null;
	this.buttons = buttons || null;

	this.init = function(){
		this.buttonManager = new lgb.buttonManager(this.buttons);
		this.buttonManager.init();
	};

	this.update = function(){
		this.buttonManager.update();
	};

	this.draw = function(){
		lgb.init(ctx);
		this.buttonManager.draw();
	};

	this.finish = function(){
		this.buttonManager.finish();
		delete this.buttonManager;
	};

	this.getType = function(){
		return this.type;
	};
};

