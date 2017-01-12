// JavaScript Document

function addUpdate(jia) {
	var c = jia.parent().find(".n_ipt").val();
	c = parseInt(c) + 1;
	jia.parent().find(".n_ipt").val(c);
}

function jianUpdate(jian) {
	var c = jian.parent().find(".n_ipt").val();
	if (c == 1) {
		c = 1;
	} else {
		c = parseInt(c) - 1;
		jian.parent().find(".n_ipt").val(c);
	}
}

function addUpdate1(jia) {
	var c = jia.parent().find(".car_ipt").val();
	c = parseInt(c) + 1;
	jia.parent().find(".car_ipt").val(c);
	$.ajax({
		url : "/EasyBuy/ProductServlet?id=" + $(jia).attr("val") + "&type=jia",
		type : "get",
		dataType : "json",
		success : function(data) {
			var li="";

			$.each(data, function(i, item) {
				if (i == 0) {
					$("#gw").text(item.count1);
					$("#zj").text(item.price1);
					$("#price3").text(toDecimal2(item.price1));	
				}
				li+="<li><div class='img'><a href='#'><img  src=images/"+item.fileName+" } width='58' height='58' /></a></div><div class='name'><a href='#'>"+item.name+"</a></div><div class='price'><font color='#ff4e00'>"+item.price+"</font> X"+item.count+"</div></li>   ";
			});
			$("#ul").html(li);
			js();
		}
	});
}

function jianUpdate1(jian) {
	var c = jian.parent().find(".car_ipt").val();
	if (c == 1) {
		c = 1;
	} else {
		c = parseInt(c) - 1;
		jian.parent().find(".car_ipt").val(c);
		$.ajax({
			url : "/EasyBuy/ProductServlet?id=" + $(jian).attr("val")
					+ "&type=jian",
			type : "get",
			dataType : "json",
			success : function(data) {
				var li="";
				$.each(data, function(i, item) {
					if (i == 0) {
						$("#gw").text(item.count1);
						$("#zj").text(item.price1);
						$("#price3").text(toDecimal2(item.price1));	
					}
					li+="<li><div class='img'><a href='#'><img  src=images/"+item.fileName+" } width='58' height='58' /></a></div><div class='name'><a href='#'>"+item.name+"</a></div><div class='price'><font color='#ff4e00'>"+item.price+"</font> X"+item.count+"</div></li>   ";
				});
				$("#ul").html(li);	
				js();
			}

		});
	}

}
function js(){
	$.each($(".td"), function(i, item) {
		var price=$(this).find("input").eq(1).val()*$(this).find("input").eq(1).attr("val");
		$(this).next().find("span").text(toDecimal2(price));
	});
	
}

function toDecimal2(x) {    
    var f = parseFloat(x);    
    if (isNaN(f)) {    
        return false;    
    }    
    var f = Math.round(x*100)/100;    
    var s = f.toString();    
    var rs = s.indexOf('.');    
    if (rs < 0) {    
        rs = s.length;    
        s += '.';    
    }    
    while (s.length <= rs + 1) {    
        s += '0';    
    }    
    return s;    
}   