if !jQuery?
  e = document.createElement('script')
  e.setAttribute('type','text/javascript')
  e.setAttribute('charset','UTF-8')
  e.setAttribute('src','http://code.jquery.com/jquery-1.7.1.min.js')
  document.body.appendChild(e)

window.saveTrelloCard = (idList, key, token) ->
  if !jQuery?
    setTimeout((() -> saveTrelloCard(idList, key, token)), 0)
    return
  opts = 
    url: "https://api.trello.com/1/cards"
    type: "POST"
    data:
      key: key
      token: token
      name: document.title ? "<none>"
      desc: document.location.href
      idList: idList
    dataType: "json"

  # If the browser doesn't support CORS, then use JSONP
  if !$.support.cors
    opts.dataType = "jsonp"
    opts.type = "GET"
    opts.data._method = "POST"

  $.ajax opts
