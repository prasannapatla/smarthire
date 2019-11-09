	// initialisation
   
    function set_synax(lang){
        editAreaLoader.init({
            id: "code"	// id of the textarea to transform		
            ,start_highlight: true	// if start with highlight
            ,allow_resize: "both"
            ,allow_toggle: true
            ,word_wrap: true
            ,language: "en"
            ,syntax:lang	
        });
       }
        editAreaLoader.init({
            id: "code"	// id of the textarea to transform		
            ,start_highlight: true	// if start with highlight
            ,allow_resize: "both"
            ,allow_toggle: true
            ,word_wrap: true
            ,language: "en"
            ,syntax: "python"	
        });
        
        function get_text(editor_id){
            return editAreaLoader.getValue(editor_id)
         }
        
        // callback functions
        function my_save(id, content){
            alert("Here is the content of the EditArea '"+ id +"' as received by the save callback function:\n"+content);
        }
        
        function setval(id,text){
            editAreaLoader.setValue(id, text);
        }
        
        function test_setSelectionRange(id){
            editAreaLoader.setSelectionRange(id, 100, 150);
        }
        
        function test_getSelectionRange(id){
            var sel =editAreaLoader.getSelectionRange(id);
            alert("start: "+sel["start"]+"\nend: "+sel["end"]); 
        }
        
        function test_setSelectedText(id){
            text= "[REPLACED SELECTION]"; 
            editAreaLoader.setSelectedText(id, text);
        }
        
        function test_getSelectedText(id){
            alert(editAreaLoader.getSelectedText(id)); 
        }
        
        function editAreaLoaded(id){
            if(id=="code")
            {
                open_file1();
                open_file2();
            }
        }
        
        function open_file1()
        {
            var new_file= {id: "to\\ é # € to", text: "$authors= array();\n$news= array();", syntax: 'php', title: 'beautiful title'};
            editAreaLoader.openFile('code', new_file);
        }
        
        function open_file2()
        {
            var new_file= {id: "Filename", text: "<a href=\"toto\">\n\tbouh\n</a>\n<!-- it's a comment -->", syntax: 'html'};
            editAreaLoader.openFile('code', new_file);
        }
        
        function close_file1()
        {
            editAreaLoader.closeFile('code', "to\\ é # € to");
        }
        
        function toogle_editable(id)
        {
            editAreaLoader.execCommand(id, 'set_editable', !editAreaLoader.execCommand(id, 'is_editable'));
        }
    