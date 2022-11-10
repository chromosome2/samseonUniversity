$(function(){
	let cl_id_input=document.getElementById("cl_id");
	let check=false;
	
	cl_id_input.onblur = function(e){
		let cl_id=$('#cl_id').val();
		$.ajax({
			type:"post",
			async:true,
			dataType:"text",
			url:"http://127.0.0.1:8090/samseon/view/check_cl_id.do",
			data:{cl_id:cl_id},
			success:function(data,textStatus){
				if(data=='usable'){
					check=true;
				}else{
					alert("사용 불가능한 과목 코드입니다.");
					check=false;
				}
			},
			error:function(data, textStatus){
				alert("에러발생~!");
			}
		})
	}
	
	$('.btn_submit').on('click',function (e){
		if(check==false){
			e.preventDefault();
			alert('과목 코드를 변경해주세요.');
		}
	});
});