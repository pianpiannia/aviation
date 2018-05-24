$(function(){
	$('.form_date').datetimepicker({
	    format: "yyyy-mm-dd",
	    language : 'zh-CN',
	    weekStart : 1,
	    todayBtn : true,
	    autoclose : 1,
	    startView: 3,
	    minView : 2,
	});
	$('.form_time').datetimepicker({
	    language:  'fr',
	    weekStart: 1,
	    todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 1,
		minView: 0,
		maxView: 1,
		forceParse: 0
	});
	
	allflights(1);
	
})
	function dotjia(){
			$("#addtjia").modal("show");
		}
//添加		
function doadddFlight(){
	 $.ajax({
			url : "http://192.168.21.8:8080/ticketSystem/flight/add",
			data: $("#addmo").serialize(),
			type:"POST",
			dataType : "json",
			success : function(data) { 
				window.location.href="flightManage.jsp";
			}
	 })
}

//修改
function doModifyflight(no,id){
	var id=id;
	var no=no;
	$.ajax({
		url:"http://192.168.21.8:8080/ticketSystem/flight/getFlightDetail",
		data:"no="+no,
		type:"POST",
		success:function(data){
			$("#ids").val(data.data.id);
			$("#hbs").val(no);
			$("#companys").val(data.data.company);
			$("#models").val(data.data.model);
			$("#totleSeatss").val(data.data.totleSeats);
			$("#leaveCitys").val(data.data.leaveCity);
			$("#arrivalCitys").val(data.data.arrivalCity);
			$("#economyPrices").val(data.data.economyPrice);
			$("#firstPrices").val(data.data.firstPrice);
			$("#leaveTimes").val(data.data.leaveTime);
			$("#arrivalTimes").val(data.data.arrivalTime);
			$("#xiug").modal("show");
		}
	})
}


//修改提交
function doModif(){
	 $.ajax({
			url :"http://192.168.21.8:8080/ticketSystem/flight/modify",
			data: $("#doMod").serialize(),
			type:"POST",
			dataType : "json",
			success : function(data) {
				window.location.href="flightManage.jsp";
			}
	 })
}

//删除
function dodelete(id){
	$.ajax({
		url:"http://192.168.21.8:8080/ticketSystem/flight/delete",
		data:"id="+id,
		type:"POST",
		dataType:"json",
		success:function(data){
			if(data.success==true){
				alert("删除成功");
				location.href="flightManage.jsp";
			}else{
				alert("删除失败");
			}
		}
	})
}

//查询

// 展示所有数据
function allflights(pageIndex){
	 $.ajax({
			url: "http://192.168.21.8:8080/ticketSystem/flight/getFlightsByFuzzy",
			type:"POST",
			data:"pageNo="+pageIndex,
			success : function(datas) {
				var pageNO = datas.pageNo;
				var totalPage = datas.pageCount;		
				for (var i = 0; i <=datas.results.length-1; i++) {
					var data = datas.results[i];
					var tr = $("<tr>").appendTo("#tb");
					$("<td>").html(i+1).appendTo(tr);
					$("<td>").html(data.no).appendTo(tr);
					$("<td>").html(data.model).appendTo(tr);
					$("<td>").html(data.totleSeats).appendTo(tr);
					$("<td>").html(data.leaveCity).appendTo(tr);
					$("<td>").html(data.arrivalCity).appendTo(tr);
					$("<td>").html(data.leaveTime + "-" + data.arrivalTime).appendTo(tr);
					$("<td>").html(data.company).appendTo(tr);
					$("<td>").html("头等舱：" + data.firstPrice + "<br>经济舱"+ data.economyPrice).appendTo(tr);	
					$("<td>").html('<button onclick="doModifyflight(\''+data.no+'\','+(i+1)+')">修改</button><br><button onclick="dodelete('+ data.id + ')">删除</button>').appendTo(tr);
				}
				
				var options = {
			            currentPage:pageNO-1,
			            totalPages:totalPage,
			            bootstrapMajorVersion:3,
		           		size:"normal",
		            	alignment:"center",
			            onPageClicked: function (event, originalEvent, type, page)
			            {
			            	
							$("#tb").empty();
							
							allflights(page);
			            }
			        };
		        $('#page').bootstrapPaginator(options);
			}
		});
}