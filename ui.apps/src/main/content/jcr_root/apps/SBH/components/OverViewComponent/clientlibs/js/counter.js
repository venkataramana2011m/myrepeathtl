
jQuery(document).ready(function() {
                    var counter = 0;
                    window.setInterval("refreshDiv()", 5000);
                    function refreshDiv(){
                        counter = counter + 1;
                        document.getElementById("timediv").innerHTML  += "Testing " + counter;
                    }

					function count($this){
						var current = parseInt($this.html(), 0);
						current = current + 1; /* Where 1 is increment */

						$this.html(current);
						if(current > $this.data('count')){
							$this.html($this.data('count'));
						} else {
							setTimeout(function(){count($this)}, 5000);
						}
					}

					jQuery(".stat-count").each(function() {
					  jQuery(this).data('count', parseInt(jQuery(this).html(), 0));
					  jQuery(this).html('0');
					  count(jQuery(this));
					});
				});