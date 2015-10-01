
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
	this.nowType = 'scene_' + lgb.sceneTypeList.MENU;
	this.scene = null;
	this.remove = false;
	this.nonProcess = false;
	this.sceneList = null;

	this.init = function(){
		this.remove = false;
		var data = {
			user_id: lgb.user.id
		};
		// サーバーからデータ取得
		var scenes = $.ajax({
				type: "POST",
				url: lgb.common.api_test_button_url, 
				data: data, 
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
		var nowScene = eval('this.sceneList.'+this.nowType);
		var params = {
			type: this.nowType,
			title: nowScene.sceneName,
			buttons: nowScene.buttons,
			drawType: nowScene.drawType,
			backScene: nowScene.backScene,
		};
		this.scene = new lgb.scene(params);
		this.scene.init();

		this.debug_sceneType();
		this.nonProcess = false;
	};

	this.getNowSceneType = function(){
		return this.nowType;
	};

	this.getBackSceneType = function(){
		return this.scene.getBackScene();
	};

	this.debug_sceneType = function(){
		$('#sceneType').text("sceneType = "+ this.nowType);
	};

};

