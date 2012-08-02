$(->
  $(".explore-api").bind("ajax:before", (event, data, status, xhr) ->
    $("#spinner-wrapper").show()
    $("#api-response").hide()
  )
  
  $(".explore-api").bind('ajax:success', (event, data, status, xhr) ->
    showResponse(this.text, data, status);
  )
  
  # For arbitrary ajax calls.
  $("#api-explorer").submit (event) ->
    val = $("#explore-url").val()
    $.ajax "/explore/" + val + ".json",
      type: 'GET',
      dataType: 'text',
      error: (data, status, jqXHR) ->
        showResponse(val, data, status);
      success: (data, status, jqXHR) ->
        # console.log(arguments)
        showResponse(val, data, status);
      event.preventDefault();
  
  showResponse = (text, data, status) ->
    $("#api-response").html("<h1>Response</h1>
      <h3>Object: " + text + "</h3>
      <h3>Status: " + status + "</h3>
      <pre class='prettyprint lang-js'>" + JSON.stringify(jQuery.parseJSON(data), undefined, 4) + "</pre>")
  
    
  
    $("#api-response").show()
    $("#spinner-wrapper").hide()
    
)

