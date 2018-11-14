function information(){
	$.get(
		"/RealEstateInformationQuery/realEstate/query",
		function(data){
			$('.right').html(data);
		},
		"html"
	);
}

function back(){
	var flag = confirm("是否退出？")
	if (flag){
		location="/RealEstateInformationQuery/userData/logout";
	}
}