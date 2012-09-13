checkAuth = () ->
  Trello.authorize(interactive: false, error: () ->
    auth()
  success: () ->
    startSetup()
  )

auth = () ->
  Trello.authorize
    type: "redirect"
    name: "Trello Bookmarklet Maker"
    persist: false
    scope:
      write: true
    expiration: "never"

startSetup = () ->
  #get boards
  Trello.get("members/me", {boards: "open"}, success: (data) ->
    console.log data
  )
    
$(checkAuth)
