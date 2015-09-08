
// このシーンが持っているオブジェクトenum
lgb.objectTypeList = {
	HEADER: 0,
	BUTTON: 1,
};

lgb.sceneActionList = {
	none: "None",
	quest_select: "Quest",
	weapon_select: "Weapon",
	armor_select: "Armor",
	item_select_1: "Item",
};

/**
 *
 *
 *
 */
lgb.scene = function (nowType, nowTitle, buttons, drawType){
	this.type = nowType;
	this.title = nowTitle;
	this.buttons = buttons || null;
	this.drawType = drawType || "none";

	this.objects = [];

	this.init = function(){
		// データ取得
		eval("this.get"+lgb.sceneActionList[this.drawType]+"Action()");


		// 回すため、ここで突っ込む
		this.objects[lgb.objectTypeList.HEADER] = new lgb.header(this.type, this.title);
		this.objects[lgb.objectTypeList.BUTTON] = new lgb.buttonManager(this.buttons, this.drawType);

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

	this.getHeader = function(){
		return this.objects[lgb.objectTypeList.HEADER];
	};

	/**
	 * action
	 */

	this.getNoneAction = function(){
		
	};

	this.getQuestAction = function(){
		
	};

	this.getWeaponAction = function(){
		
	};
	
	this.getArmorAction = function(){
		
	};

	this.getItemAction = function(){
		
	};
};

