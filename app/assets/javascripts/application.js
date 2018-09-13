// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
// 
//= require jquery 
//= require rails-ujs
//= require turbolinks
//= require_tree.
  function closeit(){ 
    document.getElementById('close').setAttribute("style", "display:none");
}
function createMessageChannel() {
  App.messages = App.cable.subscriptions.create({
        channel: 'MessagesChannel', chat_id: parseInt($("#message_chat_id").val())
        },
        {
        received: function(data) {
          $("#messages").removeClass('hidden')
          return $('#messages').append(this.renderMessage(data));
        },
        renderMessage: function(data) {
    return "<p> <b>" + data.user + ": </b>" + data.message + "</p>";
  },
      });

return App.messages;
}

function messageForm(){
  var shiftDown = false;
  var chatForm = $("#message");
  var messageBox = chatForm.children("message_input");
  $(document).keypress(function (e) {
      if(e.keyCode == 13) {
          if(messageBox.is(":focus") && !shiftDown) {
           e.preventDefault(); // prevent another \n from being entered
      chatForm.submit();
      $(chatForm).trigger('reset');
          }
      }
  });

$(document).keydown(function (e) {
      if(e.keyCode == 16) shiftDown = true;
  });

$(document).keyup(function (e) {
      if(e.keyCode == 16) shiftDown = false;
  });
}
