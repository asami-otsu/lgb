
/**
 *
 *
 *
 */
lgb.sceneManager = function(){
	// 初期のタイプ
	this.nowType = 'menu';
	this.scene = null;
	this.remove = false;

	this.init = function(){
		this.remove = false;
		this.scene.init();
	};

	this.update = function(){
		this.scene.update();
	};

	this.draw = function(){
		this.scene.draw();
	};

	this.finish = function(){
		this.scene.finish();
	};

	this.isRemove = function(){
		return this.remove;
	};

	this.scene = new lgb.scene(this.nowType);
};

