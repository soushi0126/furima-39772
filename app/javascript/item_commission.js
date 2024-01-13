function item_commission (){
  const inputPrice = document.getElementById("item-price");
  inputPrice.addEventListener('input', () => {
    const outputCommission = document.getElementById("add-tax-price");
    const outputprofit = document.getElementById("profit");
    outputCommission.innerHTML = Math.round(inputPrice.value * 0.1)
    outputprofit.innerHTML = Math.round(inputPrice.value - Math.round(inputPrice.value * 0.1))
  })
};

window.addEventListener('turbo:load', item_commission)
window.addEventListener('turbo:render', item_commission)