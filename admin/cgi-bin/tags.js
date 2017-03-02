
function addTag(tagName)
{
     $.ajax( 
    { 
        type:   "get",
        url: "/admin/ajax/tagAdd.aspx",
        data:"id=" + $("#IDHidden").val() + "&type=" + $("#TagTypeHidden").val() + "&name=" + encodeURIComponent(tagName),  
        success:   function(msg)
        {   
                if(msg=='0')
                     alert("无法添加标签 "+tagName+"！");
                else
                    $('#tagList').append(msg);
        },
        failure:function(msg,resp,status)
        {
            alert(msg);
            alert(resp);
            alert(status);
        }
    } 
    ); 
}
        
function removeTag(tagName)
{
     $.ajax( 
    { 
        type:   "get", 
        url:   "/admin/ajax/tagDelete.aspx?id="+$("#IDHidden").val()+"&type="+$("#TagTypeHidden").val()+"&name="+encodeURIComponent(tagName), 
        datatype: "html ", 
        success:   function(msg)
        {   
                if(msg=='0')
                     alert("无法删除标签 "+tagName+"！");
                else
                    $('#tagList').html(msg);
        }   
    } 
    ); 
}

function KeyPressAdd(obj)
{
	if(event.keyCode==13 || event.keyCode==0)
	{
	    addTag(obj.value);
		return;
	}
}    