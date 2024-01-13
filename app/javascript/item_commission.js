function item_commission (){
  const inputPrice = document.getElementById("item-price");
  inputPrice.addEventListener('input', () => {
    const outputCommission = document.getElementById("add-tax-price");
    const outputprofit = document.getElementById("profit");
    outputCommission.innerHTML = Math.floor(inputPrice.value * 0.1)
    outputprofit.innerHTML = Math.floor(inputPrice.value - Math.floor(inputPrice.value * 0.1))
  })
};

window.addEventListener('turbo:load', item_commission)
window.addEventListener('turbo:render', item_commission)