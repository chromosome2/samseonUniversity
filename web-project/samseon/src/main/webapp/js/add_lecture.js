$(function(){
	let cl_id=document.getElementById("cl_id");
	
	cl_id.onblur = function(e){
		/*$.ajax({
			type:"post",
			async:true,
			dataType:"number",
			url:"http://127.0.0.1:8090/samseon/view/check_cl_id.do",
			data:{cl_id:cl_id},
			success:function(data,textStatus){
				if(data=='usable'){
					alert("사용가능합니다.");
				}else{
					alert("사용 불가능한 과목 코드입니다.");
				}
			},
			error:function(data, textStatus){
				alert("에러발생~!");
			}
		})*/
	}
});