
function Controller() {    
}    
   
Controller.prototype.init = function()    
{    
    //�����û������    
//    this.createUserTree();    
}    
   
//�����û������    
Controller.prototype.createUserTree = function()    
{    
//    ServiceProvider.getUsers(this.handleUsers);    
}    
   

   
/**===============UI�¼�������=======================*/   
Controller.prototype.onSelectUser = function(node, event)    
{    
    alert(node.id);    
}    

Ext.BLANK_IMAGE_URL = 'ajax/Ext2.0/resources/images/default/s.gif';
var controller = new Controller();    
Ext.onReady(controller.init, controller);    
