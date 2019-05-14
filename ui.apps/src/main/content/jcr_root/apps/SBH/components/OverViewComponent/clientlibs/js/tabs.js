
function tabs(selectedtab) {	
					// contents
					var s_tab_content = "tab_content_" + selectedtab;	
					var contents = document.getElementsByTagName("div");
					for(var x=0; x<contents.length; x++) {
						name = contents[x].getAttribute("name");
						if (name == 'tab_content') {
							if (contents[x].id == s_tab_content) {
							contents[x].style.display = "block";						
							} else {
							contents[x].style.display = "none";
							}
						}
					}	
					// tabs
					var	s_tab = "tab_" + selectedtab;		
					var tabs = document.getElementsByTagName("a");
					for(var x=0; x<tabs.length; x++) {
						name = tabs[x].getAttribute("name");
						if (name == 'tab') {
							if (tabs[x].id == s_tab) {
							tabs[x].className = "active";						
							} else {
							tabs[x].className = "";
							}
						}
					}	  
				}