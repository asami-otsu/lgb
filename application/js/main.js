
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

	lgb.init = function(ctx){
		// クリア
		ctx.clearRect(0, 0, $(canvas).width(), $(canvas).height());
		// 枠表示
		ctx.strokeRect(0,0, 400,300);
		// font propaty
		ctx.font= 'bold 25px Century Gothic';
		// text base line propaty
		ctx.textBaseline = 'top';
	};

	// canvasの左上座標の取得
	lgb.canvas_rect = $(canvas).offset();

	canvas.addEventListener('click', function(e){
		console.log('event func x/y' + e.clientX + '/' + e.clientY);
	});

	var sceneManager = null;

	lgb.main = function(){
		if( sceneManager == null ){
			sceneManager = new lgb.sceneManager();
			sceneManager.init();
		}

		if( sceneManager.isRemove() == false ){
			// 更新処理
			sceneManager.update();
			// 一定間隔でいる？
			sceneManager.draw();
			
			setTimeout('lgb.main()', 1000);
		}else{
			sceneManager.finish();
		}
	};
	
	// start
	lgb.main();
};

