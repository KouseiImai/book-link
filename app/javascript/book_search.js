if ( location.pathname == "/books/new" || location.pathname == "/books"){
  $(function() {
    $('#getBookContents').click( function( e ) {
      e.preventDefault();
      $('.book_form').val(" ");
      $("#thumbnail").html(' ');
      $("#book-image-field").css({'visibility':'visible','display':'inline'});
      const isbn = $("#isbn").val();
      const url = "https://api.openbd.jp/v1/get?isbn=" + isbn;

      $.getJSON( url, function( data ) {
        if( data[0] == null ) {
          alert("データが見つかりません");
        } else {
          $("#isbn").val(isbn.replace(/-/g,''));
          if( data[0].summary.cover == "" ){
            $("#thumbnail").html('<label>イメージ画像がありません可能でしたら画像を登録して下さい</label>');
            $("#thumbnail").css({'color':'red'});
          } else {
            const XHR = new XMLHttpRequest();
            XHR.open("GET", data[0].summary.cover, true);
            XHR.responseType = "json";
            XHR.send();
            XHR.onload = () => {
              if ( XHR.status === 200 ){
                $("#thumbnail").html('<label>イメージ</label><br><img src=\"' + data[0].summary.cover + '\" style=\"margin: 5px 0 20px 0\" />');
                $("#book-image-field").css({'visibility':'hidden','display':'none'});
                $("#thumbnail").css({'color':'black'});
                const book_image = data[0].summary.cover;
                book_image.slice(0,-1);
                $("#book-image").val(book_image);
              }else {
                $("#thumbnail").html('<label>イメージ画像がありません可能でしたら画像を登録して下さい</label>');
                $("#thumbnail").css({'color':'red'});
              }
            };
            $("#thumbnail").html('<label>イメージ画像がありません可能でしたら画像を登録して下さい</label>');
            $("#thumbnail").css({'color':'red'});
          }
          $("#title").val(data[0].summary.title);
          $("#publisher").val(data[0].summary.publisher);
          $("#author").val(data[0].summary.author);
          if ( data[0].onix.CollateralDetail.TextContent[0].Text != undefined ){
            $("#description").val(data[0].onix.CollateralDetail.TextContent[0].Text);
          } else if ( data[0].onix.CollateralDetail.TextContent[1].Text != undefined ){
            $("#description").val(data[0].onix.CollateralDetail.TextContent[1].Text);
          }
          const pub_date = data[0].summary.pubdate;
          let pubdate = data[0].summary.pubdate;
          let release_date = pub_date;
          if ( pub_date.length == 10 && pub_date.match(/-/) ){
            pubdate_edit = pub_date.replace('-','');
            pubdate = pubdate_edit.replace('-','');
          } else if ( pub_date.length == 9 && pub_date.match(/-/) ){
            if ( pub_date.indexOf('-',5) == 6 ){
              pubdate_edit = pub_date.replace('-','0');
              pubdate = pubdate_edit.replace('-','');
            }else{
              pubdate_edit = pub_date.replace('-','');
              pubdate = pubdate_edit.replace('-','0');
            }
          } else if ( pub_date.length == 8 && pub_date.match(/-/) ){
            pubdate_edit = pub_date.replace('-','0');
            pubdate = pubdate_edit.replace('-','0');
          } else if ( pub_date.length == 7 && pub_date.match(/-/) ){
            pubdate = pub_date.replace('-','');
          } else {
            pubdate = pub_date;
          }
          if ( pub_date.length >= 6 && pub_date.indexOf('/') == -1 ){
            const year = pubdate.slice(0,4);
            const month = pubdate.slice(4,6);
            const day = pubdate.slice(6,8);
            const date = [year,month,day];
            release_date = date.join('/');
          }
          $("#pubdate").val(release_date);
          if ( data[0].onix.DescriptiveDetail.Subject != null ){
            const c_code = Number(data[0].onix.DescriptiveDetail.Subject[0].SubjectCode);
            const c_code_first = parseInt((c_code / 1000), 10);
            const c_code_second = parseInt((c_code / 100 ) % 10, 10);
            const c_code_third = c_code % 100;
            $("#c-code-first").val(c_code_first);
            $("#c-code-second").val(c_code_second);
            $("#c-code-third").val(c_code_third);
            if ( data[0].onix.DescriptiveDetail.Subject[1].SubjectHeadingText != undefined ){
              $("#keyword").val((data[0].onix.DescriptiveDetail.Subject[1].SubjectHeadingText).replace(/;;/g,''));
            } else if ( data[0].onix.DescriptiveDetail.Subject[2].SubjectHeadingText != undefined ){
              $("#keyword").val((data[0].onix.DescriptiveDetail.Subject[2].SubjectHeadingText).replace(/;;/g,''));
            }
          }
        }
      });
    });
  });
};