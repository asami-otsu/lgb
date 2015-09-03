
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
	this.sceneList = null;

	this.init = function(){
		this.remove = false;
		// サーバーからデータ取得
		var scenes = $.ajax({
				url: lgb.common.api_url, 
				data: null, 
				success: null, 
				dataType: "json",
				async: false
			});
		this.sceneList = JSON.parse(scenes.responseText);

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

	// もういらないかも。。
	this.nextScene = function(){
		this.nowType = this.nowType;
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
		var nowScene = eval('this.sceneList.scene_'+this.nowType);
		this.scene = new lgb.scene(this.nowType, nowScene.sceneName, nowScene.buttons );
		console.log('createScene is type='+this.nowType+ ': '+this.scene.getType());
		this.scene.init();
		this.nonProcess = false;
	};

};

