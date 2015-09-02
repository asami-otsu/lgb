
/**
 *
 *
 *
 */
lgb.scene = function (nowType){
	this.type = nowType || 'menu';
	this.buttonManager = null;
	
	this.init = function(){
		this.buttonManager.init();
	};

	this.update = function(){

	};

	this.draw = function(){
		lgb.init(ctx);
		this.buttonManager.draw();
	};

	this.finish = function(){

	};

	this.buttonManager = new lgb.buttonManager([
		{params:{text:'hoge'}, x:1, y:1},
		{params:{text:'fuga'}, x:1, y:50}
	]);
};

