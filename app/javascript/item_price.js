window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
    const commission = Math.floor(inputValue) * 0.1;
    const gain = inputValue - Math.floor(commission);
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(commission);
    const addGain =  document.getElementById("profit");
    addGain.innerHTML = Math.floor(gain);
  });
});
