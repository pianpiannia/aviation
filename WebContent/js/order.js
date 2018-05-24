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
})

function doyud(){
	$("#yud").modal("show");
}