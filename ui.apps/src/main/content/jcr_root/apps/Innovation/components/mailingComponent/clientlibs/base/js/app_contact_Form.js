
(function(){
	var app = angular.module("contact_Form",[]);
	
	app.controller('ContactController',function(){this.contacts = {};										
		this.addContact = function(contactfrm) {
		contact_Form.contacts.push(this.contacts);
            this.contacts={};
		};
	});	
})();