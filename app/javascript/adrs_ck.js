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

    //市区町村確認
    const city = document.getElementById("city");
    const cityOk = document.getElementById("city-ok");

    city.addEventListener('input', function(){
      console.log('市区町村ck')//動作ck
      if (city.value != `` ) {
        cityOk.innerHTML = `OK`
        cityOk.setAttribute("style","background-color:green");
      }else {
        cityOk.innerHTML = `必ず入力して下さい`
        cityOk.setAttribute("style","background-color:red");
      }
    })

    //番地確認
    const area = document.getElementById("addresses");
    const areaOk = document.getElementById("area-ok");

    area.addEventListener('input', function(){
      console.log('番地ck')//動作ck
      if (area.value != `` ) {
        areaOk.innerHTML = `OK`
        areaOk.setAttribute("style","background-color:green");
      }else {
        areaOk.innerHTML = `必ず入力して下さい`
        areaOk.setAttribute("style","background-color:red");
      }
    })

    //電話番号確認
    const tel = document.getElementById("phone-number");
    const telOk = document.getElementById("tel-ok");

    tel.addEventListener('input', function(){
      console.log('tel-ck')//動作ck
      if (tel.value.match(/^[0-9]{10,11}$/) ) {
        telOk.innerHTML = `OK`
        telOk.setAttribute("style","background-color:green");
      }else{
        telOk.innerHTML = `10〜11桁の半角数字で入れて下さい`
        telOk.setAttribute("style","background-color:red");
      }
    })


};
window.addEventListener("load", adrs_ck);

