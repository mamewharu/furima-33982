const pay = () => {
  // payjp.setPublickey()
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");
    const formDate = new FormData(formResult);
    const card ={
      number: formDate.get("pay_street_address[number]"),
      cvc:  formDate.get("pay_street_address[cvc]"),
      exp_month: formDate.get("pay_street_address[exp_month]"),
      exp_year: `20${formDate.get("pay_street_address[exp_year]")}`,
    };
  });
};

window.addEventListener("load",pay);