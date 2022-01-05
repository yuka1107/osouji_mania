//フォームを殻にする
$('input[type="text"]').val('');
//モーダルを消す
$('#inputScheduleForm').model('hide');
//作成した予定を差し替える
$('#inputEditForm').html('<%= escape_javascript(render("events/edit", events: @events )) %>');
//古カレンダーを一度消しもう一度表示
('#calendar').fullCalendar('refetchEvents');