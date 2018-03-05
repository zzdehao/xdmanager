/**
 * 
 */
$.fn.AreaSelect = function(){
	var _self = this;
	var $sel1 = _self.find("select").eq(0);
	var $sel2 = _self.find("select").eq(1);
	var $sel3 = _self.find("select").eq(2);
	var $sel4 = _self.find("select").eq(3);
	
	function getUrl(p , l){
		return "area/list?p="+p+"&s=1&l=" + l; 
	}
	
	function fill(p ,l ,s){
		$.get(getUrl(p , l) , function(data){
			$.each(data , function(i ,n ){
				s.append("<option value='"+n.id+"'>"+n.name+"</option>");
			}) ;
		}) ;
	}
	
	var data = "<option value=''>请选择</option>" ;
	$sel1.append(data);
	$sel2.append(data);
	$sel3.append(data);
	$sel4.append(data);
	
	fill(0 , 1 , $sel1);
	
	
	_self.find("select").change(function(){
		var l = $(this).attr("l") ;
		var v = $(this).val();
		if(l == 1){
			$($sel2).html(data);
			$($sel3).html(data);
			$($sel4).html(data);
			if(v){
				fill(v , 2 , $sel2);
			}
		}else if(l == 2){
			$($sel3).html(data);
			$($sel4).html(data);
			if(v){
				fill(v , 3 , $sel3);
			}
		}else if(l == 3&& v){
			$($sel4).html(data);
			if(v){
				fill(v , 4 , $sel4);
			}
		}
	}) ;
	
	return _self;
};