<?php

echo "Mains/index<BR>";
echo "php ver = ".PHP_VERSION."<BR>";
?>

<script type="text/javascript" >
	onload = function(){
		var user_id = <?php echo json_encode($data, true); ?>;
		if( !user_id ){
			alert('データベースに該当ユーザーデータが存在しないようです。');
		}
		console.log("ユーザデータ有");
		var data = {};
		data.id = user_id;
		$.ajax({
			type: "POST",
			url: lgb.common.api_get_user_data_url,
			dataType: "json",
			data: user_id,
			success: function(response){
				console.log('get user success');
				console.log(response);
				lgb.user = JSON.parse(response.responseText);
				$("#canvas").append("<canvas id='main' width='400' height='300'></canvas>");
				lgb.main();
			},
		});
	};
</script>

<div id="canvas" width="400" height="300" style="position: relative">
</div>

