Ext.onReady(function(){











//user info store start 
Ext.create('Ext.data.Store',{
    storeId:'UserInfo',
    fields:[ 'name','phone','qq','email','class','school','college','major','province','area','education'],
    data:{
        'items':[
        { 'name':'葛京','phone':'15399482749','qq':'2439054131','email':'gjblmdlm@sina.com','class':'308','school':'野寨中学','college':'西北工业大学','major':'软件工程','province':'陕西省','area':'西北','education':'本科'} ,   

        ],
    },
    proxy:{
        type:'memory',
        reader:{
            type:'json',
            root:'items'
        }
    },
});



//user info store end












//vbox查询主界面开始
Ext.create('Ext.Panel', {
    width: '100%',
    height: 768,
    title: "51fzhs",
    layout: {
        type: 'vbox',
        align: 'center'
    },
    renderTo: document.body,
    items: [{//检索项开始
        xtype: 'panel',
        title: '可选项',
        width: '100%',
        flex: 2,
        layout:{
            type:'hbox',
            align:'middle',
        },
        items:[
            {
                xtype:'combobox',
                displayField:'hehe',
                valueField:'haha',
                width:'10%',
            },
                        {
                xtype:'combobox',
                displayField:'hehe',
                valueField:'haha',
                width:'10%',
            },
                        {
                xtype:'combobox',
                displayField:'hehe',
                valueField:'haha',
                width:'20%',
            },
                        {
                xtype:'combobox',
                displayField:'hehe',
                valueField:'haha',
            },
                        {
                xtype:'combobox',
                displayField:'hehe',
                valueField:'haha',
            },





        ],
    },//检索项结束
    {//结果显示开始
        xtype: 'grid',
        title: 'result',
        width: '100%',
        store:Ext.data.StoreManager.lookup('UserInfo'),
        columns:[
            {header:'姓名',dataIndex:'name'},
            {header:'手机',dataIndex:'phone'},
            {header:'QQ',dataIndex:'qq'},
            {header:'邮箱',dataIndex:'email'},
            {header:'高中',dataIndex:'school'},
            {header:'班级',dataIndex:'class'},
            {header:'大学',dataIndex:'college'},
            {header:'专业',dataIndex:'major'},
            {header:'学历',dataIndex:'education'},
            {header:'所在省',dataIndex:'province'},
            {header:'区域',dataIndex:'area'},
        ],
        flex: 8
    }]//结果显示结束
});
//vbox查询主界面结束












});

