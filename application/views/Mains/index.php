<?php

echo "Mains/index<BR>";
echo "php ver = ".PHP_VERSION."<BR>";

?>



<script type="text/javascript">
	
	/*
	var ajax_data = null;
	$.ajax({
		type: "GET",
		url: lgb_common.api_url,
		cache: false,
		dataType: "json",
		success: function(data, dataType){
				ajax_data = data;
				alert(data['text']);
			},
		error: function(req, st, thrown){
			alert("$.ajax error status= " + st + " thr=" + thrown);
			},
		data: "Dataaa"
		});
	*/

	$.get(
		lgb_common.api_url,
		function(){
			console.log("$.get callback");
		},
		{}
	);

	var _data = null;
	lgb_ajax(function(data){
		// データを受け取た場合の処理
		_data = data;
		console.log("async "+data);
	});
	console.log(_data);
</script>
