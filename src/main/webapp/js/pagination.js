const itemsPerPage = 5; // Number of items to show per page
const itemsContainer = document.getElementById('game-grid-container');
const items = itemsContainer.querySelectorAll('.item');
const paginationContainer = document.getElementById('pagination');
const totalPages = Math.ceil(items.length / itemsPerPage); // Total number of pages

console.log(items.length);
// Function to show items for the specified page
function showPage(pageNumber) {
  const startIndex = (pageNumber - 1) * itemsPerPage;
  const endIndex = startIndex + itemsPerPage;
  items.forEach((item, index) => {
    if (index >= startIndex && index < endIndex) {
      item.style.display = 'block';
    } else {
      item.style.display = 'none';
    }
  });
}

function createPaginationButtons() {
    // "Previous" button
    const prevButton = document.createElement('li');
    prevButton.classList.add('page-item');
    prevButton.innerHTML = `
      <a class="page-link" href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
        <span class="sr-only">Previous</span>
      </a>
    `;
    prevButton.addEventListener('click', () => {
      if (currentPage > 1) {
        currentPage--;
        const activeButton = paginationContainer.querySelector('.active');
        if (activeButton) {
          activeButton.classList.remove('active');
        }
        paginationContainer.querySelector(`li[data-page="${currentPage}"]`).classList.add('active');
        showPage(currentPage);
      }
      prevButton.blur();
    });
    paginationContainer.appendChild(prevButton);
    
    // Numbered buttons
    for (let i = 1; i <= totalPages; i++) {
      const li = document.createElement('li');
      li.classList.add('page-item');
      li.dataset.page = i;
      if (i === 1) {
        li.classList.add('active');
      }
      li.innerHTML = `
        <a class="page-link" href="#">${i}</a>
      `;
      li.addEventListener('click', () => {
        const activeButton = paginationContainer.querySelector('.active');
        if (activeButton) {
          activeButton.classList.remove('active');
        }
        li.classList.add('active');
        currentPage = parseInt(li.dataset.page);
        showPage(currentPage);
      });
      paginationContainer.appendChild(li);
    }
    
    // "Next" button
    const nextButton = document.createElement('li');
    nextButton.classList.add('page-item');
    nextButton.innerHTML = `
      <a class="page-link" href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
        <span class="sr-only">Next</span>
      </a>
    `;
    nextButton.addEventListener('click', () => {
      if (currentPage < totalPages) {
        currentPage++;
        const activeButton = paginationContainer.querySelector('.active');
        if (activeButton) {
          activeButton.classList.remove('active');
        }
        paginationContainer.querySelector(`li[data-page="${currentPage}"]`).classList.add('active');
        showPage(currentPage);
      }
      nextButton.blur();
    });
    paginationContainer.appendChild(nextButton);
  }
  
showPage(1);
createPaginationButtons();