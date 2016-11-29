$(function(){
	$("#tweet-box-home-timeline").keydown(function(){
		var x=$(this).text();
		$(".tweet-counter").text(140-x.length);
		if(140-x.length<0){
			$("#twitter_send").attr("disabled","disabled");
		}else{
			$("#twitter_send").removeAttr("disabled");
		}
		$("#tcontent").val(x);
	});
	$("#tweet-box-home-timeline").keyup(function(){
		var x=$(this).text();
		$(".tweet-counter").text(140-x.length);
		if(140-x.length<0){
			$("#twitter_send").attr("disabled","disabled");
		}else{
			$("#twitter_send").removeAttr("disabled");
		}
		$("#tcontent").val(x);
	});
	
});