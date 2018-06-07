/**
** leray_load_area 自定义加载地区函数
** @param cid 当前 id
** @param pid 父级 id
** @param grade 级别
** @param names select 的名字集合，为字符串，如：“provice,city,area” 函数将自动处理级别，以逗号分隔为数组
*/
function leray_load_area(cid,pid,grade,names,class1){
	var kname = arguments[5] ? arguments[5] :'#area_';
	if(names.indexOf("spell")>0){
		param = "parent_spell=" + pid;
		key = "region_spell";
	}else{
		param = "parent_id=" + pid;
		key = "region_id";
	}
	var xNames = names.split(",");
	if(pid == "" && grade != 0){
		for(i=grade;i<xNames.length;i++){
			$(kname + i).html("");
		}
		return false;
	}
	var defaultValue = arguments[6] ? arguments[6] :"请选择";
	//alert(xNames[grade]);
	if(xNames[grade].indexOf("provspell")>0){defaultValue = "全国";}
	if(xNames[grade].indexOf("cityspell")>0){defaultValue = "全省";}
	if(xNames[grade].indexOf("areaspell")>0){defaultValue = "全市";}
	$.ajax({
		type:'get',
		url:'/app/publish/get_linkage.php',
		data:'act=ajax_select&'+ param +'&keyid=1',
		cache:false,
		//datatype:'html',
		timeout:10000,
		beforeSend:function(){
			//加载…………
		},
		error:function(){
			//错误
		},
		success:function(msg){
			msg = eval("("+ msg +")");
			var datatype=(class1==1)?'datatype="*"':'';
			if(xNames.length <= (grade + 1)){
				if(grade==2){datatype='';}
				html = '<select name="'+ xNames[grade] +'" '+datatype+' class="small">';
			}else{
				html = '<select name="'+ xNames[grade] +'"'+datatype+' class="small" onchange="leray_load_area(0,this.value,'+ (grade + 1) +',\''+ names +'\',1,\''+kname+'\',\''+defaultValue+'\');">';
			}
			option = '<option value="" selected>'+ defaultValue +'</option>';
			html += option;
			for(i = 0;i<msg.length;i++){
				if(cid == msg[i][key]){
					option = '<option value="'+ msg[i][key] +'" selected>'+ msg[i]['region_name'] +'</option>';
				}else{
					option = '<option value="'+ msg[i][key] +'">'+ msg[i]['region_name'] +'</option>';
				}
				html += option;
			}

			html += '</select>';
			if(msg.length<=0){
				$(kname + grade).html("");
			}else{
				$(kname + grade).html(html);
			}
		}
	});
}


function leray_load_area2(cid,pid,grade,names,style,keyid){
	param = "parent_id=" + pid;
	key = "region_id";
	var xNames = names.split(",");
	if(pid == "" && grade != 0){
		for(i=grade;i<xNames.length;i++){
			$("#area_" + i).html("");
		}
		return false;
	}
	if(style=="goods_new_"){
		var defaultValue = "请选择分类";
		if(grade>0){defaultValue = "请选择子类";}
	}else{
		var defaultValue = "选择省";
		if(grade>0){defaultValue = "选择市";}
	}
	$.ajax({
		type:'get',
		url:'/app/publish/get_linkage.php',
		async:false,
		data:'act=ajax_select&'+ param +'&keyid='+keyid,
		cache:false,
		//datatype:'html',
		timeout:10000,
		beforeSend:function(){
			//加载…………
		},
		error:function(){
			//错误
		},
		success:function(msg){
			msg = eval("("+ msg +")");
			html = '<select name="'+ xNames[grade] +'" class="ui-select">';
			option = '<option value="" selected>'+ defaultValue +'</option>';
			html += option;
			for(i = 0;i<msg.length;i++){
				option = '<option value="'+ msg[i][key] +'">'+ msg[i]['region_name'] +'</option>';
				html += option;
			}
			html += '</select>';
			$("#"+style + grade).html(html);

		}
	});
}

$(document).ready(function() {
	$(".select-list>li").click(function(){
		alert(555);
		var parentid=$(this).parents("#area_new_0").length;
		name=(parentid>0)?"area_new_":"goods_new_";
		inputname=(parentid>0)?"area_0,cityid":"goods_0,goodsid";
		keyid=(parentid>0)?1:3360;
		var num=$(this).index();
		var vv=$("#"+name+"0").find("option").eq(num).val();
		leray_load_area2(0,vv,1,inputname,name,keyid);
		$(".ui-select").selectWidget({
			change: function (changes) {
				return changes;
			},
			effect       : "slide",
			keyControl   : true,
			speed        : 200,
			scrollHeight : 250
		});
	})

	$("#goodsearch").click(function(){
		goods_0=$("#goods_new_0").find("option:selected").val();
		goodsid=$("#goods_new_1").find("option:selected").val();
		if(goodsid==""){
			$("#goods_new_1").find("select>option").val(goods_0);
		}
		$("#form2").submit();
	})
});