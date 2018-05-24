function dotp(){
	$("#tp").modal("show");
}

function showAll(){
	$.ajax({
		url:"http://localhost:8080/ticketSystem/order/getOrderByICard",
		type:"POST",
		dataType:"json",
		success:function(){
			 
		}
	
	
	
	})
}