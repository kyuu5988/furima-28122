const adrs_ck = () => {
  console.log('adrs_ck.js発動中');//動作ck用

    //フォーム入力確認
    const post = document.getElementById("postal-code");
    const postOk = document.getElementById("post-ok");

    post.addEventListener('input', function(){
      console.log('郵便チェック')//動作ck
      if (post.value.match(/^\d{3}-?\d{4}$/g) ) {
        postOk.innerHTML = `OK`
        postOk.setAttribute("style","background-color:green");
      }else{
        postOk.innerHTML = `ハイフンを入れて半角数字で入れて下さい`
        postOk.setAttribute("style","background-color:red");
      }


    })


};
window.addEventListener("load", adrs_ck);

