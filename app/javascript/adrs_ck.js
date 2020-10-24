const adrs_ck = () => {
  console.log('adrs_ck.js発動中');//動作ck用

    //カード番号確認
    const card = document.getElementById("card-number");
    const cardOk = document.getElementById("card-ok");

    card.addEventListener('input', function(){
      console.log('カード番号ck')//動作ck
      if (card.value.match(/^[0-9]{16}$/) ) {
        cardOk.innerHTML = `OK`
        cardOk.setAttribute("style","background-color:green");
      }else{
        cardOk.innerHTML = `16桁の半角数字のみで入力して下さい`
        cardOk.setAttribute("style","background-color:red");
      }
    })

    //有効mon確認
    const expMon = document.getElementById("card-exp-month");
    const expYear = document.getElementById("card-exp-year");
    const expOk = document.getElementById("exp-ok");

    expMon.addEventListener('input', function(){
      console.log('有効monck')//動作ck
      if (expMon.value.match(/^[0-9]{1,2}$/) 
        && expYear.value.match(/^[0-9]{1,2}$/) ) {
        expOk.innerHTML = `OK`
        expOk.setAttribute("style","background-color:green");
      }else{
        expOk.innerHTML = `2桁までの半角数字のみで入力して下さい`
        expOk.setAttribute("style","background-color:red");
      }
    })

    //有効year確認
    expYear.addEventListener('input', function(){
      console.log('有効yearck')//動作ck
      if (expMon.value.match(/^[0-9]{1,2}$/) 
        && expYear.value.match(/^[0-9]{1,2}$/) ) {
        expOk.innerHTML = `OK`
        expOk.setAttribute("style","background-color:green");
      }else{
        expOk.innerHTML = `2桁までの半角数字のみで入力して下さい`
        expOk.setAttribute("style","background-color:red");
      }
    })

    //有効cvc確認
    const cardCvc = document.getElementById("card-cvc");
    const cvcOk = document.getElementById("cvc-ok");

    cardCvc.addEventListener('input', function(){
      console.log('cvc-ck')//動作ck
      if (cardCvc.value.match(/^[0-9]{3,4}$/)) {
        cvcOk.innerHTML = `OK`
        cvcOk.setAttribute("style","background-color:green");
      }else{
        cvcOk.innerHTML = `3〜4桁までの半角数字のみで入力して下さい`
        cvcOk.setAttribute("style","background-color:red");
      }
    })
    

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
        telOk.innerHTML = `10〜11桁の半角数字のみで入力して下さい`
        telOk.setAttribute("style","background-color:red");
      }
    })

    //送信ボタン隠し
    const buyBtn = document.getElementById("b-btn");
    const neIn = document.getElementById("ne-in");
    window.addEventListener(`input`,function(){
      console.log('ボタン隠し')//動作ck
      if (postOk.innerHTML == `OK` && prefOk.innerHTML == `OK` 
      && cityOk.innerHTML == `OK` && areaOk.innerHTML == `OK` 
      && telOk.innerHTML == `OK` && cardOk.innerHTML == `OK` 
      && expOk.innerHTML == `OK` && cvcOk.innerHTML == `OK` ){
        buyBtn.setAttribute("style", "display:block;");
        neIn.setAttribute("style", "display:none;");
      } else {
        buyBtn.setAttribute("style", "display:none;");
        neIn.setAttribute("style", "display:block;");
      }
    })
};
window.addEventListener("load", adrs_ck);



