if (location.pathname == "/") {
  const window_size = window.innerHeight;
  console.log(window_size);
  window.addEventListener('DOMContentLoaded', function() {
    window.addEventListener('scroll', function() {
      console.log("縦スクロール:"+window.scrollY);
      console.log("スクロール:"+this.scrollHeight);
    });
  });
}