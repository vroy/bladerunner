$ ->
  $("[rel=popover]").popover(trigger: "hover", placement: "bottom")

  $("[data-action=open-results-modal]").on "click", (e) ->
    target = $(e.currentTarget)
    alert("@todo modal of this row.")

  prettyPrint()

  window.refreshContent = ->
    $.get window.location.href, (data) ->
      $("#container").html(data)
      prettyPrint()

  testToReload = ->
    filename = $("[data-run-filename]").attr("data-run-filename")
    timestamp = $("[data-run-timestamp]").attr("data-run-timestamp")

    return unless filename? and timestamp?

    $.ajax
      type: "GET"
      dataType: "json"
      url: "/bladerunner/test"
      data: { filename: filename }
      success: (data) ->
        if ( parseInt(data.timestamp) != parseInt(timestamp) )
          refreshContent()

  testToReload()
  setInterval( testToReload, 2000)
