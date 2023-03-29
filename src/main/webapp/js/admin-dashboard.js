const mainTableBody = document.getElementById('main-table-body');
const mainSectionTitle = document.getElementById('main-section-title');
const tableTitle = document.getElementById('table-title');

// Game Info
const editGameNameInput = document.getElementById('edit-game-name');
const editReleaseDateInput = document.getElementById('edit-release-date');
const editDeveloperInput = document.getElementById('edit-developer');
const editPriceInput = document.getElementById('edit-price');
const editPublisherInput = document.getElementById('edit-publisher');
const editDiscountInput = document.getElementById('edit-discount');
const descriptionInput = document.getElementById('edit-description');

// Game Files and Picture
const editGameFilesInput = document.getElementById('edit-game-files');
const editGamePictureInput = document.getElementById('edit-game-picture');

// Genres
const editGenresInputs = document.querySelectorAll('input[name="genres"]');

// Platforms
const editPlatformsInputs = document.querySelectorAll('input[name="platforms"]');

//Recommended Specs
const recommendedProcessorInput = document.getElementById('edit-recommended-processor');
const recommendedGPUInput = document.getElementById('edit-recommended-gpu');
const recommendedRAMInput = document.getElementById('edit-recommended-ram');
const recommendedStorageInput = document.getElementById('edit-recommended-storage');
const recommendedDXVersionInput = document.getElementById('edit-recommended-dxversion');

//Minimum Specs
const minimumProcessorInput = document.getElementById('edit-minimum-processor');
const minimumGPUInput = document.getElementById('edit-minimum-gpu');
const minimumRAMInput = document.getElementById('edit-minimum-ram');
const minimumStorageInput = document.getElementById('edit-minimum-storage');
const minimumDXVersionInput = document.getElementById('edit-minimum-dxversion');
const editGameId = document.getElementById("edit-id");


function getGames() {
    const url = new URL("http://localhost:8888/fusion/admin/game");
    url.searchParams.append("time", new Date().getTime);

    const options = {
        method: "GET",
        headers: {
            "Content-Type": "application/json"
        }
    };


    fetch(url, options)
        .then(response => {
            if (response.ok) {
                return response.json();
            } else {
                throw new Error("Request failed.");
            }
        })
        .then(data => {
            mainSectionTitle.innerHTML = "GAMES";
            tableTitle.innerHTML = "GAMES";
            mainTableBody.innerHTML = "";
            for (let i = 0; i < data.length; ++i) {
                if (data[i].discount == null) {
                    mainTableBody.innerHTML += `
                    <tr class="border-bottom border-1 border-gold">
                        <td>
                            <div class="d-flex align-items-center">
                                <a href="product?name=${data[i].name}">
                                    <img src="${data[i].pictureUrl}" alt=""
                                        style="width: 60px; height: 60px" class="rounded-2" />
                                </a>
                                <div class="ms-3">
                                    <p class="fw-bold mb-1 text-gold">${data[i].name}</p>
                                    <p class="text-white mb-0">BASE GAME</p>
                                </div>
                            </div>
                        </td>
                        <td>
                            <p></p>
                            <p class="fw-normal mb-1 text-white">${data[i].netPrice}</p>
                        </td>
                        <td>
                            <p></p>
                            <span class="badge badge-success rounded-pill d-inline ">Sale 0%</span>
                        </td>
                        <td>
                            <div class="dropdown mt-2">
                                <button
                                        class="edit-btn btn dropdown-toggle rounded-pill btn-sm"
                                        type="button" id="dropdown-${data[i].id}"
                                        data-mdb-toggle="dropdown" aria-expanded="false">
                                    Edit
                                </button>
                                <ul class="dropdown-menu"
                                    aria-labelledby="dropdown-${data[i].id}">
                                    <li><button class="dropdown-item"
                                                onclick='getGameDetails("${data[i].id}")'
                                                data-mdb-toggle="modal"
                                                data-mdb-target="#edit-game-modal">Edit</button></li>
                                    <li><button class="dropdown-item" onclick='deleteGame("${data[i].id}")'>Delete</button></li>
                                </ul>
                            </div>
                        </td>
                    </tr>
                    `;
                }
                else {
                    mainTableBody.innerHTML += `
                    <tr class="border-bottom border-1 border-gold">
                        <td>
                            <div class="d-flex align-items-center">
                                <a href="product?name=${data[i].name}">
                                    <img src="${data[i].pictureUrl}" alt=""
                                        style="width: 60px; height: 60px" class="rounded-2" />
                                </a>
                                <div class="ms-3">
                                    <p class="fw-bold mb-1 text-gold">${data[i].name}</p>
                                    <p class="text-white mb-0">BASE GAME</p>
                                </div>
                            </div>
                        </td>
                        <td>
                            <p></p>
                            <p class="fw-normal mb-1 text-white"><s>${data[i].price}</s> ${parseInt(data[i].netPrice)}$</p>
                        </td>
                        <td>
                            <p></p>
                            <span class="badge badge-success rounded-pill d-inline ">Sale
                                                                                ${data[i].discount}%</span>
                        </td>
                        <td>
                            <div class="dropdown mt-2">
                                <button
                                        class="edit-btn btn dropdown-toggle rounded-pill btn-sm"
                                        type="button" id="dropdown-${data[i].id}"
                                        data-mdb-toggle="dropdown" aria-expanded="false">
                                    Edit
                                </button>
                                <ul class="dropdown-menu"
                                    aria-labelledby="dropdown-${data[i].id}">
                                    <li><button class="dropdown-item"
                                                onclick='getGameDetails("${data[i].id}")'
                                                data-mdb-toggle="modal"
                                                data-mdb-target="#edit-game-modal">Edit</button></li>
                                    <li><button class="dropdown-item" onclick='deleteGame("${data[i].id}")'>Delete</button></li>
                                </ul>
                            </div>
                        </td>
                    </tr>
                    `;
                }
            }
        })
        .catch(error => {
            console.error(error);
        });
}

function getUsers() {
    const url = new URL("http://localhost:8888/fusion/admin/user");
    url.searchParams.append("time", new Date().getTime);

    const options = {
        method: "GET",
        headers: {
            "Content-Type": "application/json"
        }
    };


    fetch(url, options)
        .then(response => {
            if (response.ok) {
                return response.json();
            } else {
                throw new Error("Request failed.");
            }
        })
        .then(data => {
            mainSectionTitle.innerHTML = "USERS";
            tableTitle.innerHTML = "USERS";
            mainTableBody.innerHTML = `
                                        <tr class="border-bottom border-1 border-gold">
                                            <td>
                                                <p class="fw-normal mb-1 text-white">USERNAME</p>
                                            </td>
                                            <td>
                                                <p class="fw-normal mb-1 text-white">EMAIL</p>
                                            </td>
                                            <td>
                                                <p class="fw-normal mb-1 text-white">COUNTRY</p>
                                            </td>
                                            <td>
                                                <p class="fw-normal mb-1 text-white">CREDIT LIMIT</p>
                                            </td>
                                            <td>
                                                <p class="fw-normal mb-1 text-white">History</p>
                                            </td>
                                        </tr>
                                    `;
            for (let i = 0; i < data.length; ++i) {
                mainTableBody.innerHTML += `
                                                <a href="home">
                                                <tr class="border-bottom border-1 border-gold">
                                                    <td>
                                                        <p class="fw-normal mb-1 text-white">${data[i].username}</p>
                                                    </td>
                                                    <td>
                                                        <p class="fw-normal mb-1 text-white">${data[i].email}</p>
                                                    </td>
                                                    <td>
                                                        <p class="fw-normal mb-1 text-white">${data[i].country}</p>
                                                    </td>
                                                    <td>
                                                        <p class="fw-normal mb-1 text-white">${data[i].creditLimit}$</p>
                                                    </td>
                                                    <td>
                                                        <a class="btn btn-gold text-black 
                                                        hover-overlay border-gold p-1 w-75" 
                                                        type="button" href="user-orders?userId=${data[i].id}"">History</a>
                                                    </td>
                                                </tr>
                                                </a>
                                            `
            }
        })
        .catch(error => {
            console.error(error);
        });
}

function deleteGame(gameId) {
    const url = new URL("http://localhost:8888/fusion/admin/game/delete");

    const requestBody = {
        gameId: gameId
    };

    const options = {
        method: "DELETE",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(requestBody)
    };


    fetch(url, options)
        .then(response => {
            if (response.ok) {
                return response.json();
            } else {
                throw new Error("Request failed.");
            }
        })
        .then(data => {
            console.log(data);
        })
        .catch(error => {
            console.error(error);
        });
}

function getGameDetails(gameId) {
    console.log(gameId);
    const url = new URL("http://localhost:8888/fusion/admin/game/edit");
    url.searchParams.append("gameId", gameId)

    const options = {
        method: "GET",
        headers: {
            "Content-Type": "application/json"
        }
    };


    fetch(url, options)
        .then(response => {
            if (response.ok) {
                return response.json();
            } else {
                throw new Error("Request failed.");
            }
        })
        .then(data => {
            editGameId.value = data.gameInfo.id;
            propagateGameInfo(data);
            propagateDiscount(data);
            propagateGenres(data);
            propagatePlatforms(data);
            propagateMinimumSpec(data);
            propagateRecommendedSpec(data);
        })
        .catch(error => {
            console.error(error);
        });
}


function propagateGameInfo(data) {
    editGameNameInput.value = data.gameInfo.name;
    editReleaseDateInput.value = new Date(Date.parse(data.gameInfo.releaseDate)).toISOString().slice(0, 10);
    editDeveloperInput.value = data.gameInfo.developer;
    editPriceInput.value = data.gameInfo.price;
    editPublisherInput.value = data.gameInfo.publisher;
    descriptionInput.value = data.gameInfo.description;
}
function propagateDiscount(data) {
    for (let i = 0; i < editDiscountInput.options.length; i++) {
        const option = editDiscountInput.options[i];
        if (option.value === data.gameInfo.discount) {
            editDiscountInput.selectedIndex = i;
            break;
        }
    }
}

function propagateGenres(data) {
    editGenresInputs.forEach((checkbox) => {
        if (data.genres.includes(checkbox.value)) {
            checkbox.checked = true;
        }
    });
}

function propagatePlatforms(data) {
    editPlatformsInputs.forEach((checkbox) => {
        if (data.platforms.includes(checkbox.value)) {
            checkbox.checked = true;
        }
    });
}

function propagateMinimumSpec(data) {
    minimumProcessorInput.value = data.minimumSpec.cpu;
    minimumGPUInput.value = data.minimumSpec.gpu;
    minimumRAMInput.value = data.minimumSpec.ram;
    minimumStorageInput.value = data.minimumSpec.storage;
    minimumDXVersionInput.value = data.minimumSpec.dxVersion;
}

function propagateRecommendedSpec(data) {
    recommendedProcessorInput.value = data.recommendedSpec.cpu;
    recommendedGPUInput.value = data.recommendedSpec.gpu;
    recommendedRAMInput.value = data.recommendedSpec.ram;
    recommendedStorageInput.value = data.recommendedSpec.storage;
    recommendedDXVersionInput.value = data.recommendedSpec.dxVersion;
}

window.onload = getGames;

// function viewUserOrders(userId){
//     console.log(userId);
//     $.post("/fusion/user/user-orders",
//         JSON.stringify({userId:userId}));
// }
