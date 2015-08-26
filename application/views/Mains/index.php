<?php

echo "Mains/index<BR>";
echo "php ver = ".PHP_VERSION."<BR>";

?>



<script type="text/javascript">
	
	var text = "Text2<BR>";

	document.write(text);
	
	/*
	var xmlHttp = new XMLHttpRequest();
	xmlHttp.open('POST', "http://192.168.56.10/index.php/Api/get", true);
	xmlHttp.send([]);

	setTimeout(function(){}, 3000 );
	document.write("xmlHttp readyState="+ xmlHttp.readyState);
	document.write("<BR>xmlHttp status="+ xmlHttp.status);
	*/
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
	lgb_ajax();
</script>
