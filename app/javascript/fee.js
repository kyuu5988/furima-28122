function fee() {
  const inputPrice = document.getElementById("item-price").value;
  const selesCommission = document.getElementById("add-tax-price")
  const selesProfit = document.getElementById("profit")

    fee10 = inputPrice * 0.1
    selesCommission.innerHTML = fee10.toLocaleString('ja-JP', { style: 'currency', currency: 'JPY' });
    selesProfit.innerHTML = (inputPrice - fee10).toLocaleString('ja-JP', { style: 'currency', currency: 'JPY' });
}
setInterval(fee, 1000);
