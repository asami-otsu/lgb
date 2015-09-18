<?php

echo "Mains/index<BR>";
echo "php ver = ".PHP_VERSION."<BR>";
?>

<script type="text/javascript" >
	onload = function(){
		var user_id = <?php echo json_encode($data, true); ?>;
		if( user_id typeof undefined || user_id < 1  ){
			alert('データベースに該当ユーザーデータが存在しないようです。');
		}
		console.log("ユーザデータ有 "+user_id);
		var data = {};
		data.id = user_id;
		$.ajax({
			type: "POST",
			url: lgb.common.api_get_user_data_url,
			dataType: "json",
			data: data,
			success: function(response){
				console.log('get user success');
				lgb.user = response;
				console.log(lgb.user);
				$("#canvas").append("<canvas id='main' width='400' height='300'></canvas>");
				lgb.main();
			},
		});
	};
</script>

<div id="canvas" width="400" height="300" style="position: relative">
</div>

