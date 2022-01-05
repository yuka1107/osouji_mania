//updateした内容を差し替え
$('#inputEditForm').html('<%= escape_javascript(render("events/edit", events: @events)) %>');
//モーダル背景画面を消す
$('.modal-backdrop').remove();
// フルカレンダーを一度消し再表示
$('#calendar').fullCalendar('refetchEvents')