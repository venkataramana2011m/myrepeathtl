//------------------------------------------------------------------------------
// example grid showing a reference search
// and how cells can be edited
 
//Get the grid data
function getGridData(grid)
   {
     
       var store = grid.getStore();
       var tt=store.getCount();
               
      //Iterate through the grid and get back data
       for (var z=0; z < tt; z++)
       {
           var myRec = store.getAt(z);
            var myJSON = myRec.json ; 
            
            //Get the Values of grid columns - 2nd and 3rd
            var TextVal = myJSON.text;
            var TestVal = myJSON.test;
                                   
       }
             
   } 
 
function getGridPanel() {
    var reader = new CQ.Ext.data.JsonReader({
            root: 'hits',
            totalProperty: 'results',
            fields: [
                {name: 'jcr:path', type: 'string'},
                {name: 'text', type: 'string'},
                {name: 'test', type: 'string'},
                {name: 'test1', type: 'string'}
            ]
    });
 
    var cm = new CQ.Ext.grid.ColumnModel([
        {
            id:'path',
            header: CQ.I18n.getMessage("Path"),
            dataIndex: 'jcr:path',
            width: 220
        },{
            header: CQ.I18n.getMessage("Text"),
            dataIndex: 'text',
            width: 200,
            renderer: function(v) {
                if (v.length > 50) {
                    v = v.substring(0, 46) + "...";
                }
                return v;
            }

        },{
            header: CQ.I18n.getMessage("Test"),
            dataIndex:"test",
            width: 100,
            editor: new CQ.Ext.form.TextField({})
        }
    ]);
    // by default columns are sortable
    cm.defaultSortable = true;

    var store = new CQ.Ext.data.GroupingStore({
        proxy: new CQ.Ext.data.HttpProxy({
            url: CQ.HTTP.externalize("/bin/querybuilder.json"),
            method:"GET"
        }),
        baseParams: {
            "p.limit":0,
            "p.hits":"full",
            "path":"/content",
            "property":"sling:resourceType",
            "property.value":"foundation/components/text"
        },
        reader: reader,
        sortInfo:{field: 'jcr:path', direction: "ASC"},
        groupField: 'jcr:path'
    });
 
    var gridPanel = new CQ.Ext.grid.EditorGridPanel({
        store: store,
        stateful: false,
        cm: cm,
        clicksToEdit:2,
        sm: new CQ.Ext.grid.RowSelectionModel({singleSelect:true}),
        frame:false,
        listeners: {
            beforeedit: function(params) {
            },
            afteredit: function(params) {
                var postParams = {};
                postParams["_charset_"] = "utf-8";
                postParams["./test"] = params.value;
                var response = CQ.HTTP.post(params.record.get("jcr:path"), null, "");
                if (CQ.HTTP.isOk(response)) {
                    params.record.commit();
                } else {
                    params.record.reject();
                }
            }
        },
        autoExpandColumn: 'path'
    });
    return gridPanel;
}
