
lgb.sceneTypeList = {
	MENU: 'menu',
	MAIN: 'main',
};
/**
 *
 *
 *
 */
lgb.sceneManager = function(){
	// 初期のタイプ
	this.nowType = lgb.sceneTypeList.MENU;
	this.scene = null;
	this.remove = false;
	this.nonProcess = false;

	this.init = function(){
		this.remove = false;
		// サーバーからデータ取得
		this.buttons = $.ajax({
				url: lgb.common.api_url, 
				data: null, 
				success: null, 
				dataType: "json",
				async: false
			});
		this.buttons = JSON.parse(this.buttons.responseText);

		this.createScene();
	};

	this.update = function(){
		if( this.scene.getType() != this.nowType ){
			console.log('type != nowType ');
			this.changeScene();
			return ;
		}
		if( this.nonProcess ){
			console.log('nonProcess update ' + this.nonProcess);
			return ;
		}
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
	
	this.nextScene = function(){
		this.nowType = lgb.sceneTypeList.MAIN;
	};

	this.setSceneType = function(type){
		this.nowType = type;
	};

	this.changeScene = function(){
		this.scene.finish();
		delete this.scene;

		this.createScene();
	};

	this.createScene = function(){
		this.scene = new lgb.scene(this.nowType, eval("this.buttons."+this.nowType) );
		console.log('createScene is type='+this.nowType+ ': '+this.scene.getType());
		this.scene.init();
		this.nonProcess = false;
	};

};

