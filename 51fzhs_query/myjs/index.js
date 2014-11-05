Ext.onReady(function(){











//user info store start 





var UserInfo=Ext.create('Ext.data.Store',{
   
    fields:[ 'name','phone','qq','email','class','school','college','major','province','area','education','graduation'],
    autoLoad:true,
    proxy:{
        type:'ajax',
        url:'/index/getalluserinfo',
        reader:{
            type:'json',
            root:'users'
        },
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
        title: '信息',
        width: '100%',
        store:UserInfo,
        columns:[
            {header:'姓名',dataIndex:'name'},
            {header:'手机',dataIndex:'phone'},
            {header:'QQ',dataIndex:'qq'},
            {header:'邮箱',dataIndex:'email'},
            {header:'高中',dataIndex:'school'},
            {header:'届别',dataIndex:'graduation'},
            {header:'班级',dataIndex:'class'},
            {header:'大学',dataIndex:'college'},
            {header:'专业',dataIndex:'major'},
            {header:'学历',dataIndex:'education'},
            {header:'所在地',dataIndex:'province'},
            {header:'区域',dataIndex:'area'},
        ],
        flex: 8
    }]//结果显示结束
});
//vbox查询主界面结束












});

