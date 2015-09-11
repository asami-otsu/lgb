<?php

echo "Mains/index<BR>";
echo "php ver = ".PHP_VERSION."<BR>";

?>

id: <input id="user_id" /><br />
pass: <input id="passwd" />
<input type="button" id"login_send" value="login">
<script type="text/javascript" >
	$("#login_send").click(function(){
		var user_id = $("#user_id").val();
		var passwd = $("#passwd").val();
		if( user_id.length > 0 || passwd.length > 0 ){
			// Ajaxでデータ飛ばして、OKかもらう。（つまり同期する）
			var isLogin = lgb.sendUserLogin(user_id, passwd);
			if( isLogin ){
				// ログインできた。ので、inputとか消す
				$("#user_id").remove();
				$("#passwd").remove();
				$("#login_send").remove();
				$("#canvas").append("<canvas id='main' width='400' height='300'></canvas>");

				// start
				lgb.main();
			}else{
				alert('正常にログインできませんでした。');
			}
		}else{
			alert('ユーザーID、もしくはパスワードが入力されていません。');
		}
	});
</script>

<div id="canvas" width="400" height="300" style="position: relative">
</div>

