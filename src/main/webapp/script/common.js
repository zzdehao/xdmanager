 /**
 * 金额格式化（精确到小数点后两位）
 * @param mnt
 * @returns
 */
function formatMoney(mnt) {
	var amount = (mnt == Math.floor(mnt)) ? mnt + '.00' : ((mnt * 10 == Math
			.floor(mnt * 10)) ? mnt + '0' : mnt);
	
	return commafy(amount);
}

function setcolor(val) {
	var _txt="";
	switch(val)
	{ 
		case "充值成功":
		  _txt= "<font color='#009cde'>"+val+"</font>";
		  break;
		 case "提现成功":
		  _txt= "<font color='#009cde'>"+val+"</font>";
		  break;
		default:
		     _txt= "<font color='#FF000'>"+val+"</font>";
		break;
    }
	return _txt;
}


function commafy(n) { 
	if(n<1000){
		return n;
	}
	var n = ""+n;
	var re=/\d{1,3}(?=(\d{3})+$)/g; 
	var n1=n.replace(/^(\d+)((\.\d+)?)$/,function(s,s1,s2){
		return s1.replace(re,"$&,")+s2;
	});
	return n1; 
}

function formatPercent(num){
	if(num == 0){
		return "0.00%";
	}
    if(!/\d+\.?\d+/.test(num)){
        return ""; 
    }
    var result = (num * 100).toString(),
        index = result.indexOf(".");
    if(index == -1){
        result =  result + ".00%";
    }else {
		if(result.substr(index+1).length == 1){
			result = result + "0%";
		}else if(result.substr(index+1).length > 2){
			result = result.substr(0, index + 3) + "%";
		}
	}
    return result ;
}

/*Handlebars 工具类*/
function hCompare(v1,v2,operator,options){
	var flag = false ;
	if(operator == '>'){
		flag = v1 > v2 ;
	}else if(operator == '='){
		flag = v1==v2 ;
	}else if(operator == '<'){
		flag = v1 < v2 ;
	}
	
	if(flag){
		return options.fn(this);
	}else{
		return options.inverse(this);
	}
}
Handlebars.registerHelper("compare" , hCompare) ;