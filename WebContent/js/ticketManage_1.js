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
})

		function dohbxiug(){
			$("#hbxiug").modal("show");
		}
		
		function doaddtjia(){
			$("#addtjia").modal("show");
		}