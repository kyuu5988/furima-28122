const adrs_ck = () => {
  console.log('adrs_ck.js発動中');//動作ck用

    //郵便番号確認
    const post = document.getElementById("postal-code");
    const postOk = document.getElementById("post-ok");

    post.addEventListener('input', function(){
      console.log('郵便ck')//動作ck
      if (post.value.match(/^[0-9]{3}-[0-9]{4}$/) ) {
        postOk.innerHTML = `OK`
        postOk.setAttribute("style","background-color:green");
      }else{
        postOk.innerHTML = `ハイフンを入れて半角数字で入れて下さい`
        postOk.setAttribute("style","background-color:red");
      }
    })

    //都道府県選択確認
    const pref = document.getElementById("prefecture");
    const prefOk = document.getElementById("pref-ok");

    pref.addEventListener('change',function(){
      console.log('都道府県選択ck')//動作ck
      if (pref.select != `--` ){
        prefOk.innerHTML = `OK`
        prefOk.setAttribute("style","background-color:green");
      }
    })



    

};
window.addEventListener("load", adrs_ck);

