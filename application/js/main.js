
// 他のJSの読み込み
for (var i = 0; i < lgb.js_urls.length; i++){
	document.write('<script type="text/javascript" src="'+ lgb.js_urls[i] +'"></script>');
}

// main の部分の処理
onload = function (){
	// 初期化とmain
	canvas = $('#main').get(0);
	if( ! canvas.getContext ) {
		alert("ご利用のブラウザではcanvas要素が使用できない様です。IE8より前のバージョンをご使用になっていませんか？");
		return;
	}
	ctx = canvas.getContext('2d');

	lgb.init = function(ctx, font_size){
		var font_size = font_size || 25;
		// クリア
		ctx.clearRect(0, 0, $(canvas).width(), $(canvas).height());
		// 枠表示
		ctx.strokeRect(0, 0, $(canvas).width(), $(canvas).height());
		// font propaty
		lgb.ctx_set_font_size(ctx);
		// text base line propaty
		ctx.textBaseline = 'top';
	};

	// canvasの左上座標の取得
	lgb.canvas_rect = $(canvas).offset();

	canvas.addEventListener('click', function(e){
		console.log('event func x/y' + e.clientX + '/' + e.clientY);
	});

	lgb.app = null;

	lgb.main = function(){
		if( lgb.app == null ){
			lgb.app = new lgb.sceneManager();
			lgb.app.init();
		}

		if( lgb.app.isRemove() == false ){
			// 更新処理
			lgb.app.update();
			// 一定間隔でいる？
			lgb.app.draw();
			
			setTimeout('lgb.main()', 33);
		}else{
			lgb.app.finish();
		}
	};
	
	// start
	lgb.main();
};

