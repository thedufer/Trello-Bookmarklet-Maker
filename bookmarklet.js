(
  function()
  {
    var e=document.createElement('script');
    e.setAttribute('type','text/javascript');
    e.setAttribute('charset','UTF-8');
    e.setAttribute('src','https://raw.github.com/thedufer/Trello-Bookmarklet-Maker/gh-pages/saveToCard.js');
    document.body.appendChild(e);
    function checkSave() {
      if(window.saveTrelloCard)
        saveTrelloCard("#{idList}", "#{key}", "#{token}");
      else
        setTimeout(checkSave, 0);
    }
    setTimeout(checkSave,0);
  }
)()
