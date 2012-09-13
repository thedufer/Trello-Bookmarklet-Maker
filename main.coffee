checkAuth = () ->
  Trello.authorize({interactive: false, persist: false, error: () ->
    auth()
  success: () ->
    startSetup()
  })

auth = () ->
  Trello.authorize
    type: "redirect"
    name: "Trello Bookmarklet Maker"
    persist: false
    scope:
      write: true
    expiration: "never"

key = "d1ab807253d29b75aa6ba1569bb76"

startSetup = () ->
  #get boards
  $(".js-list-div").hide()
  Trello.get("members/me", {boards: "open"}, (data) ->
    span = $(".js-board-selector")
    span.append("<select class=\"js-select\"></select>")
    select = span.find(".js-select")
    for board in data.boards
      select.append("<option value=\"#{board.id}\">#{board.name}</option>")
    button = $(".js-board-select-button")
    button.click( () ->
      id = select.val()
      setupLists(id)
    )
  )

setupLists = (idBoard) ->
  #get lists
  Trello.boards.get(idBoard, {lists: "open"}, (data) ->
    $(".js-list-div").show()
    span = $(".js-list-selector")
    span.append("<select class=\"js-select\"></select>")
    select = span.find(".js-select")
    for list in data.lists
      select.append("<option value=\"#{list.id}\">#{list.name}</option>")
    button = $(".js-list-select-button")
    button.click( () ->
      idList = select.val()
      makeBookmarklet(idBoard, idList)
    )
  )

makeBookmarklet = (idBoard, idList) ->
  console.log idBoard, idList
  token = Trello.token()
  bookmarklet = "(function(){function b(){if(window.saveTrelloCard)saveTrelloCard(\"#{idList}\",\"#{key}\",\"#{token}\");else setTimeout(b,0)}var a=document.createElement(\"script\");a.setAttribute(\"type\",\"text/javascript\");a.setAttribute(\"charset\",\"UTF-8\");a.setAttribute(\"src\",\"http://thedufer.github.com/Trello-Bookmarklet-Maker/saveToCard.js\");document.body.appendChild(a);setTimeout(b,0)})()"
  a = $('.js-show-link')
  a.href = "javascript:#{bookmarklet}"
  a.html = "Bookmark this link"
    
$(checkAuth)
