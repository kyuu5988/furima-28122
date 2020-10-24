function fee() {
  console.log('fee.js発動中');//動作ck用

  const selesCommission = document.getElementById("add-tax-price")
  const selesProfit = document.getElementById("profit")
  const inputCk = document.getElementById("item-price");

    inputCk.addEventListener('input', function(){
      console.log('入力計算発動中');//動作ck用

      const inputPrice = document.getElementById("item-price").value;
      fee10 = inputPrice * 0.1
      selesCommission.innerHTML = fee10.toLocaleString('ja-JP', { style: 'currency', currency: 'JPY' });
      selesProfit.innerHTML = (inputPrice - fee10).toLocaleString('ja-JP', { style: 'currency', currency: 'JPY' });
    })

}
window.addEventListener("load", fee);
