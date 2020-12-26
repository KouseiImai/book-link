if (location.pathname.match("/searchs") ) {
  document.addEventListener("DOMContentLoaded", () => {
    const inputElement = document.getElementById("keyword_input");
    inputElement.addEventListener("keyup", () => {
      const keyword = document.getElementById("keyword_input").value;
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `searchs/keyword_search/?keyword=${keyword}`, true);
      XHR.responseType = "json";
      XHR.send();
      XHR.onload = () => {
        const searchResult = document.getElementById("search_keyword_result");
        searchResult.innerHTML = "";
        if ( XHR.response ) { 
          const result = XHR.response.keyword;
          result.forEach((word) => {
            const childElement = document.createElement("div");
            childElement.setAttribute("class", "child");
            childElement.setAttribute("id", word.id);
            childElement.innerHTML = word.keyword;
            searchResult.appendChild(childElement);
            const clickElement = document.getElementById(word.id);
            clickElement.addEventListener("click",() => {
              document.getElementById("keyword_input").value = clickElement.textContent;
              clickElement.remove();
            });
          });
        };
      };
    });
  });
};