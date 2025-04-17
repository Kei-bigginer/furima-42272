window.addEventListener(`turbo:load`, () => {
  const priceInput = document.getElementById("item-price");

  priceInput.addEventListener("input", () => {
    const inputValue = Number(priceInput.value);

    const tax = Math.floor(inputValue * 0.1 );
    const profit = inputValue - tax;


    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = tax;

    const addProfitDom = document.getElementById("profit");
    addProfitDom.innerHTML = profit;
  });
});