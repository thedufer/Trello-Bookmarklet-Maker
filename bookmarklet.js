(
  function()
  {
    var e=document.createElement('script');
    e.setAttribute('type','text/javascript');
    e.setAttribute('charset','UTF-8');
    e.setAttribute('src','http://thedufer.github.com/Trello-Bookmarklet-Maker/saveToCard.js');
    document.body.appendChild(e);
    setTimeout(function(){saveTrelloCard("#{idList}","#{key}","#{token}")},0);
  }
)()
