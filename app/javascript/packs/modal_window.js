$(function() {
	function errorFieldName(str) {
	  var stringArray = str.toLowerCase().split("_");
	  var processedArray = stringArray.map(
	  	s => s.replace(
	  	  /\w\S*/g,
	      function (txt) {
	      	return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();
	      }
		)
	   );

	  var fieldName = processedArray.join(" ");
	  return fieldName;
	};

	window.addEventListener("click", function() {
		var submitBtn = $("#submit-form-btn")[0];
		if (submitBtn) {
			document.body.addEventListener("ajax:error", function(event) {
			  console.log('hi error');
			  var detail = event.detail;
			  var data = detail[0];
			  var er ="<ul>";

			  jQuery.each(data, function(i, val) {
			  	var key = errorFieldName(i);
			  	er += "<li>"+ key + " " + val + "</li>"
			  });

			  er+="</ul>"

			  $("#error_explanation").html(er);
			});

			document.body.addEventListener("ajax:success", function(event) {
			  console.log('hi success')
			  var eventObject = (event.detail[0]);
			  var accountId = eventObject.id;
			  location.href = '/accounts/' + accountId;
			});
		}
	})

	$(".close").click(function(){
        $("#modal-window").modal('hide');
    });
});