$(function(){

  $('#go_button').click(send_message);

});

function send_message()
{
  var msg_type = $('input:checked').val();
  var to = $('#receiver').val();
  var msg_text = $('#message_text').val();

  $.ajax({
    type: "POST",
    url: "http://localhost:3001/messages",
    data: { msg_type: msg_type, to: to, msg_text: msg_text  }
  }).done(function( msg )

{
  console.log("Data Saved: " + msg_text);
    alert('your message was sent')
});

}

