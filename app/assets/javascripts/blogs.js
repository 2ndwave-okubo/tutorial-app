$(document).on('turbolinks:load', function () {
$(function () {
    $('.js-text_field').on('keyup', function () {
      var title = $.trim($(this).val());
      
      $.ajax({
        type: 'GET', // リクエストのタイプ
        url: '/blogs/searches', // リクエストを送信するURL
        data:  { title: title }, // サーバーに送信するデータ
        dataType: 'json' // サーバーから返却される型
      }).done(function (data) {
        console.log(data); // dataを確認する
      })
      .done(function (data) {
        $('.js-blogs li').remove(); // 追加する
        $(data).each(function(i,blog) {
          $('.js-blogs').append(
            `<li class="blog"><a href="/blogs/${blog.id}">${blog.title}</a></li>`
          );
        });
     })
     
    });
  })
});