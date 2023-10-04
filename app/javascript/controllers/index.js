// Import and register all your controllers from the importmap under controllers/*

import { application } from "controllers/application"

// Eager load all controllers defined in the import map under controllers/**/*_controller
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("controllers", application)
// HTML内の必要な要素を取得
// HTML内の必要な要素を取得
const itemPriceInput = document.getElementById("item-price");
const addTaxPriceElement = document.getElementById("add-tax-price");
const profitElement = document.getElementById("profit");

// 価格の入力フィールドが変更されたときに計算を行うリスナーを追加
itemPriceInput.addEventListener("input", () => {
  // 価格を取得
  const price = parseFloat(itemPriceInput.value);

  // 販売手数料 (10%) を計算
  const tax = price * 0.1;

  // 販売利益を計算
  const profit = price - tax;

  // 結果をHTMLに表示（小数点以下を切り上げ）
  addTaxPriceElement.textContent = Math.floor(tax);
  profitElement.textContent = Math.ceil(profit);
});

