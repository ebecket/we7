/*
 * Ext JS Library 2.0
 * Copyright(c) 2006-2007, Ext JS, LLC.
 * licensing@extjs.com
 * 
 * http://extjs.com/license
 */

Ext.onReady(function(rootID){

 // turn on quick tips
    Ext.QuickTips.init();

    var Tree = Ext.tree;
    var win;
     
    var tree = new Tree.TreePanel({
        el: 'tree-div',
        width: 170,
        autoScroll:true,
        animate:true,
        enableDD:true,
        containerScroll: true, 
        loader: new Tree.TreeLoader({
            dataUrl:'ajax/FolderNodesGet.aspx'
        })
    });

    var rootID='root';
    var title= '本站数据文件夹';
    if(QueryString("folder"))
    {
        rootID=QueryString("folder");
        title=QueryString("folder");
    }

    // set the root node
    var root = new Tree.AsyncTreeNode({
        text:title,
        cls : 'root',
        icon: 'ajax/Ext2.0/resources/images/site.gif', 
        draggable:false,
        id:rootID
    });
    tree.setRootNode(root);

    // render the tree
    tree.render();
    root.expand();

     //Add the context menu code 
    tree.on('click', onOpenArticlesClick);
//    tree.on('contextmenu', menuShow); 

   var sm = tree.getSelectionModel();   
   

    function expandMe(node) {
        node.toggle();
    }
    
        
    //菜单显示 
    function menuShow(node){
        node.select();
        if(node==tree.getRootNode())
        {
             var menuR =  new Ext.menu.Menu({
            id: 'rootMenu',
            items: [
                {
                    text: '新建一级栏目',
                    handler: onCreateItemClick
                },'-',
                {
                    text: '刷新',
                    handler: freshTree
                },'-',
               {
                    text: '子栏目全部展开',
                    handler: expandTree
                },
                {
                    text: '子栏目全部折叠',
                    handler: collapseTree
                }  
                ]
                 });
            menuR.show(node.ui.getAnchor());
        }
        else
        {
            var content='<div style="width:300px;height:250px;padding-left:30px;padding-top:10px">Choose a Theme</div> ';
            Ext.lib.Ajax.request(
                'POST',
                'ajax/ChannelNodesGet.aspx',
               {
                   success: function ( result, request) {
                        var responseArray = result.responseText;
                       content='<div style="width:250px;height:180px;padding-left:30px;padding-top:10px"><b>栏目信息概览</b><br>'+responseArray+
                       '</div> '; 
                       createMenuContent(content,node)
                    },
                    failure: function ( result, request) {
                        var responseArray = result.responseText;
                        alert( responseArray); 
                    }
               },
                'type=detail&node='+node.id
            );
                        
        }
    }
   
   
    function expandTree()
   {
        tree.expandAll();
   }
    
   function collapseTree()
   {
        tree.collapseAll();
        root.expand();
   }
    
   
   //点击栏目文章
   function onOpenArticlesClick(item){
//   debugger;
        var n = sm.getSelectedNode();
         if(n==tree.getRootNode() && n.id=="root")
         {
                window.ifRightDetail.location.href="Help/WelcomeToFiles.aspx";
         }
         else 
                 window.ifRightDetail.location.href="Folder.aspx?noSelect=1&folder="+n.id; 
   }
           
 
  function formatToGUID(id)
   {
        if(id=='') return id;
        var GUIDId=id.replace('_','-').replace('_','-').replace('_','-').replace('_','-');
        if(GUIDId.substr(0,1)!="{") GUIDId="{"+GUIDId+"}"; 
        return  GUIDId;
   }  
     
});

function QueryString(name){
var qs=name+"=";
var str=location.search;
if(str.length>0){
begin=str.indexOf(qs);
if(begin!=-1){
begin+=qs.length;
end=str.indexOf("&",begin);
if(end==-1)end=str.length;
return(str.substring(begin,end));
}
}
return null;
}