if (location.pathname.match("/searchs") ) {
  document.addEventListener("DOMContentLoaded", () => {
    const inputElement = document.getElementById("mood_input");
    inputElement.addEventListener("keyup", () => {
      const word = document.getElementById("mood_input").value;
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `searchs/mood_text_search/?word=${word}`, true);
      XHR.responseType = "json";
      XHR.send();
      XHR.onload = () => {
        const searchResult = document.getElementById("search_result");
        searchResult.innerHTML = "";
        if ( XHR.response.word != null ) {
          const result = XHR.response.word;
          result.forEach((tag) => {
            const childElement = document.createElement("div");
            childElement.setAttribute("class", "child");
            childElement.setAttribute("id", tag.id);
            childElement.innerHTML = tag.mood_text;
            searchResult.appendChild(childElement);
            const clickElement = document.getElementById(tag.id);
            clickElement.addEventListener("click",() => {
              document.getElementById("mood_input").value = clickElement.textContent;
              clickElement.remove();
            });
          });
        };
      };
    });
  });
};