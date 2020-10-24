const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();//Railsの送信をキャンセル

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("number"),
      cvc: formData.get("cvc"),
      exp_month: formData.get("exp_month"),
      exp_year: `20${formData.get("exp_year")}`,
    };

    //pay jpのトークン化オブジェクト
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;

        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden" >`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);

        //フォームのクレジットの情報を削除
        const num = document.getElementById("card-number");
        const cvc = document.getElementById("card-cvc");
        const month = document.getElementById("card-exp-month");
        const year = document.getElementById("card-exp-year");
        num.remove();
        cvc.remove();
        month.remove();
        year.remove();
        //↑フォームのクレジット情報削除

        //JSでフォームの情報を送信
        document.getElementById("charge-form").submit();
    
      } else if (status != 200) {
        alert(`カード情報が入力されていません。または正しくありません。もう一度初めから入力して下さい。安全の為に入力情報は削除されます。`);
        window.location.reload();
      }

    });
    //トークン化

  });
  
};
window.addEventListener("load", pay);
