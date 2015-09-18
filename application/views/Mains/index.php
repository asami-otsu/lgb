<?php

echo "Mains/index<BR>";
echo "php ver = ".PHP_VERSION."<BR>";

?>

<div id='login'>
name: <input id="user_name" /><br />
pass: <input id="passwd" type="password" />
<input type="button" id"login_send" value="login">
</div>
<script type="text/javascript" >
	$("input:button").click(function(){
		var user_name = $("#user_name").val();
		var passwd = $("#passwd").val();
		if( user_name.length > 0 && passwd.length > 0 ){
			// Ajaxでデータ飛ばして、OKかもらう。（つまり同期する）
			var isLogin = lgb.sendUserLogin(user_name, passwd);
			if( isLogin ){
				// ログインできた。ので、inputとか消す
				$("#login").remove();
//				$("#user_name").remove();
//				$("#passwd").remove();
//				$("#login_send").remove();
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

