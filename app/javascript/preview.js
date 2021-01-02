if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded', function() {
    const check_image = document.querySelector('#image');
    if (check_image) {
      const ImageList = document.getElementById('image-list');

      const createImageHTML = (file_url) => {
        const imageElement = document.createElement('div');
        const fileImage = document.createElement('img');
        imageElement.setAttribute('class','preview_contents');
        fileImage.setAttribute('src',file_url);
        fileImage.setAttribute('class','preview');
        imageElement.appendChild(fileImage);
        ImageList.appendChild(imageElement);
      };

      document.getElementById('image').addEventListener('change', function(e) {
        const imageContent = document.querySelector('.preview');
        if (imageContent) {
          imageContent.remove();
        }
        const file = e.target.files[0];
        const file_url = window.URL.createObjectURL(file);
        createImageHTML(file_url);
      });
    }
  });
}