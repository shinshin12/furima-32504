window.addEventListener("load", function(){
  const priceItem = document.getElementById("item-price");
  priceItem.addEventListener("input", function(){
    const inputValue = priceItem.value;
   const addTax = document.getElementById("add-tax-price");
      addTax.innerHTML = (Math.floor (0.1 * inputValue));

      const addProfit = document.getElementById("profit");
       const addResult = 0.1 * inputValue
       addProfit.innerHTML = (Math.floor (inputValue - addResult));
  });
});