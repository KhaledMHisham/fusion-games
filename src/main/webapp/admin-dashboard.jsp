<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <title>Fusion Admin</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.css" rel="stylesheet" />
    <link href="css/admin-dashboard.css" rel="stylesheet" />
    <link rel="shortcut icon" href="images/phoenix.png" type="image/x-icon" />

</head>

<body class="bg-black">
    <!-- Sidebar -->
    <jsp:include page="header.jsp" />
    <!--Main Navigation-->
    <div class="container">
        <div class="row">
            <div class=" col-lg-3 col-md-3 col-sm-12 mb-3 rounded-2">
                <div class="list-group list-group-dark">
                    <button type="button"
                        class=" account-control-item list-group-item bg-main text-white list-group-item-action px-3 border-0"
                        disabled>
                        <h5>Admin Panel</h5>
                    </button>
                    <button type="button"
                        onclick="getUsers()"
                        class="account-control-item list-group-item bg-main text-white list-group-item-action px-3 border-0"
                        aria-current="true">
                        <i class="fas fa-users fa-fw me-3"></i><span>Users</span>
                    </button>
                    <button type="button"
                        onclick="getGames()"
                        class="account-control-item list-group-item bg-main text-white list-group-item-action px-3 border-0"
                        aria-current="true">
                        <i class="fas fa-gamepad fa-fw me-3"></i><span>Games</span>
                    </button>
                </div>
            </div>
            <div class="bg-main p-3 col-lg-8 col-md-8 col-sm-12 rounded-2 d-flex flex-column justify-content-between">
                <div class="row m-2">
                    <div class="col-12 d-flex flex-row justify-content-between align-items-center">
                        <h3 id="main-section-title">Games</h3>
                        <button class="d-inline btn btn-outline-light btn-lg px-4 text-gold border-gold" type="button"
                            data-mdb-toggle="modal" data-mdb-target="#add-game-modal">Add Game</button>
                        <div class="modal fade" id="add-game-modal" tabindex="-1" data-mdb-backdrop="static"
                            aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                                <form  action="admin/game/add" method="post" enctype="multipart/form-data" class="modal-content bg-dark">
                                    <div class="modal-header border-bottom border-1 border-gold">
                                        <h5 class="modal-title text-gold">Add New Game</h5>
                                    </div>
                                    <div class="modal-body border-bottom border-1 border-gold ">
                                        <div class="row mb-4">
                                            <div class="col-12">
                                                <h5>Game Info</h5>
                                            </div>
                                            <div class="col-6">
                                                <div class="input-group">
                                                    <div class="form-outline mt-3" style="width:100% !important">
                                                        <input type="text" 
                                                            id="add-game-name"
                                                            class="form-control text-white"
                                                            name="add-game-name" required/>
                                                        <label id="add-game-name-label"
                                                            class="form-label text-white bg-dark search-label"
                                                            for="add-game-name">Game name</label>
                                                    </div>
                                                </div>
                                                <div class="input-group date mt-3" id="add-datepicker">
                                                    <input type="date"
                                                        class="form-control bg-dark border border-gold rounded-2 text-white"
                                                        id="add-release-date"
                                                        name="add-release-date" required/>
                                                </div>
                                                <div class="input-group">
                                                    <div class="form-outline mt-3 " style="width:100% !important">
                                                        <input type="text" 
                                                                id="add-developer"
                                                                class="form-control text-white"
                                                                name="add-developer" required/>
                                                        <label id="add-developer-label"
                                                            class="form-label text-white bg-dark search-label"
                                                            for="add-developer">Developer</label>
                                                    </div>
                                                </div>
                                                <div class="input-group">
                                                    <div class="form-outline mt-3" style="width:100% !important">
                                                        <input type="text" id="add-price"
                                                            class="form-control text-white" 
                                                            name="add-price" required/>
                                                        <label id="add-price-label"
                                                            class="form-label text-white bg-dark search-label"
                                                            for="add-price">Price</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="input-group mt-3">
                                                    <div class="form-outline rounded-1" style="width:100% !important">
                                                        <label for="add-game-files" class="custom-file-upload"><i
                                                                class="fa fa-upload text-black"></i></label>
                                                        <input type="file"
                                                            class="form-control text-white bg-dark custom-file-upload"
                                                            style="display: none;"
                                                            id="add-game-files"
                                                            name="add-game-files" required/>
                                                        <label class="mx-1 text-white" style="font-size: 10px;">Game
                                                            Files</label>
                                                    </div>
                                                </div>
                                                <div class="input-group mt-3">
                                                    <div class="form-outline rounded-1" style="width:100% !important">
                                                        <label for="add-game-picture" class="custom-file-upload"><i
                                                                class="fa fa-upload text-black"></i></label>
                                                        <input type="file"
                                                            class="form-control text-white bg-dark custom-file-upload"
                                                            style="display: none;"
                                                            id="add-game-picture"
                                                            name="add-game-picture" required/>
                                                        <label class="mx-1 text-white" style="font-size: 10px;">Game
                                                            Picture</label>
                                                    </div>
                                                </div>
                                                <div class="input-group">
                                                    <div class="form-outline mt-3" style="width:100% !important">
                                                        <input type="text" id="add-publisher"
                                                            class="form-control text-white"
                                                            name="add-publisher" required/>
                                                        <label id="add-publisher-label"
                                                            class="form-label text-white bg-dark search-label"
                                                            for="add-publisher">Publisher</label>
                                                    </div>
                                                </div>
                                                <div>
                                                    <select id="add-discount" name="add-discount" required
                                                        class="bg-dark rounded-1 border-gold border-1 shadow-0 col-6 w-100 p-2 text-white mt-3">
                                                        <option class="bg-dark text-white option-hover" value="NONE">
                                                            NONE
                                                        </option>
                                                        <c:forEach items="${allDiscounts}" var="discount">
                                                            <option class="bg-dark text-white option-hover" value="${discount.id}">
                                                                ${discount.getName()}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <h5>Genres</h5>
                                            </div>
                                            <c:forEach items="${allGenres}" var="genre">
                                                <div class="col-4 mb-1">
                                                    <input type="checkbox" id="add-genre-${genre.id}" name="genres" class="mb-1" value="${genre.id}">
                                                    <label for="add-genre-${genre.id}">${genre.getName()}</label>
                                                </div>
                                            </c:forEach>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <h5>Platforms</h5>
                                            </div>
                                            <c:forEach items="${allPlatforms}" var="platform">
                                                <div class="col-4 mb-1">
                                                    <input type="checkbox" id="add-platform-${platform.id}" name="platforms" class="mb-1" value="${platform.id}">
                                                    <label for="add-platform-${platform.id}">${platform.getName()}</label>
                                                </div>
                                            </c:forEach>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <h5 class="mt-2 mb-3" >Recommended</h5>
                                            </div>
                                            <div class="col-6">
                                                <div class="input-group">
                                                    <div class="form-outline mb-3" style="width:100% !important">
                                                        <input type="text" 
                                                                id="add-recommended-processor"
                                                                name="add-recommended-processor"
                                                                class="form-control text-white" required/>
                                                        <label id="add-recommended-processor-label"
                                                            class="form-label text-white bg-dark search-label"
                                                            for="add-recommended-processor">Processor</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="input-group">
                                                    <div class="form-outline mb-3" style="width:100% !important">
                                                        <input type="text" 
                                                                id="add-recommended-gpu"
                                                                name="add-recommended-gpu"
                                                                class="form-control text-white" required/>
                                                        <label id="add-recommended-gpu-label"
                                                            class="form-label text-white bg-dark search-label"
                                                            for="add-recommended-gpu">GPU</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-4">
                                                <div class="input-group">
                                                    <div class="form-outline mb-3" style="width:100% !important">
                                                        <input type="text" 
                                                            id="add-recommended-ram"
                                                            name="add-recommended-ram"
                                                            class="form-control text-white" required/>
                                                        <label id="add-recommended-ram-label"
                                                            class="form-label text-white bg-dark search-label"
                                                            for="add-recommended-ram">RAM</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-4">
                                                <div class="input-group">
                                                    <div class="form-outline mb-3" style="width:100% !important">
                                                        <input type="text" 
                                                            id="add-recommended-storage"
                                                            name="add-recommended-storage"
                                                            class="form-control text-white" required/>
                                                        <label id="add-recommended-storage-label"
                                                            class="form-label text-white bg-dark search-label"
                                                            for="add-recommended-storage">Storage</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-4">
                                                <div class="input-group">
                                                    <div class="form-outline mb-3" style="width:100% !important">
                                                        <input type="text" 
                                                                id="add-recommended-dxversion"
                                                                name="add-recommended-dxversion"
                                                                class="form-control text-white" required/>
                                                        <label id="add-recommended-dxversion-label"
                                                            class="form-label text-white bg-dark search-label"
                                                            for="add-recommended-dxversion">DX Version</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <h5 class="mb-3">Minimum</h5>
                                            </div>
                                            <div class="col-6">
                                                <div class="input-group">
                                                    <div class="form-outline mb-3" style="width:100% !important">
                                                        <input type="text" 
                                                                id="add-minimum-processor"
                                                                name="add-minimum-processor"
                                                                class="form-control text-white" required/>
                                                        <label id="add-minimum-processor-label"
                                                            class="form-label text-white bg-dark search-label"
                                                            for="add-minimum-processor">Processor</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="input-group">
                                                    <div class="form-outline mb-3" style="width:100% !important">
                                                        <input type="text" 
                                                                id="add-minimum-gpu"
                                                                name="add-minimum-gpu"
                                                                class="form-control text-white" required/>
                                                        <label id="add-minimum-gpu-label"
                                                            class="form-label text-white bg-dark search-label"
                                                            for="add-minimum-gpu">GPU</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-4">
                                                <div class="input-group">
                                                    <div class="form-outline mb-3" style="width:100% !important">
                                                        <input type="text" 
                                                                id="add-minimum-ram"
                                                                name="add-minimum-ram"
                                                                class="form-control text-white" required/>
                                                        <label id="add-minimum-ram-label"
                                                            class="form-label text-white bg-dark search-label"
                                                            for="add-minimum-ram">RAM</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-4">
                                                <div class="input-group">
                                                    <div class="form-outline mb-3" style="width:100% !important">
                                                        <input type="text" 
                                                                id="add-minimum-storage"
                                                                name="add-minimum-storage"
                                                                class="form-control text-white" required/>
                                                        <label id="add-minimum-storage-label"
                                                            class="form-label text-white bg-dark search-label"
                                                            for="add-minimum-storage">Storage</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-4">
                                                <div class="input-group">
                                                    <div class="form-outline mb-3" style="width:100% !important">
                                                        <input type="text" 
                                                                id="add-minimum-dxversion"
                                                                name="add-minimum-dxversion"
                                                                class="form-control text-white" required/>
                                                        <label id="add-minimum-dxversion-label"
                                                            class="form-label text-white bg-dark search-label"
                                                            for="add-minimum-dxversion">DX Version</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="input-group">
                                                    <div class="form-outline mb-3" style="width:100% !important">
                                                        <textarea type="text" 
                                                                    id="add-description"
                                                                    name="add-description"
                                                                    class="form-control text-white" required></textarea>
                                                        <label id="add-description-label"
                                                            class="form-label text-white bg-dark search-label"
                                                            for="add-description">Description</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer border-0">
                                        <button type="button" class="btn border border-1 border-gold text-gold"
                                            data-mdb-dismiss="modal">Close</button>
                                        <button type="submit"
                                            class="btn btn-dark border border-1 border-gold text-gold">Save
                                            changes</button>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <div class="modal fade" id="edit-game-modal" tabindex="-1" data-mdb-backdrop="static"
                             aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                                <form action="admin/game/edit" method="post" enctype="multipart/form-data" class="modal-content bg-dark">
                                    <div class="modal-header border-bottom border-1 border-gold">
                                        <h5 class="modal-title text-gold">Edit New Game</h5>
                                    </div>
                                    <div class="modal-body border-bottom border-1 border-gold ">
                                        <div class="row mb-4">
                                            <div class="col-12">
                                                <h5>Game Info</h5>
                                                <input id="edit-id" name="edit-id" type="hidden">
                                            </div>
                                            <div class="col-6">
                                                <div class="input-group">
                                                    <div class="form-outline mt-3" style="width:100% !important">
                                                        <input type="text"
                                                               id="edit-game-name"
                                                               class="form-control text-white"
                                                               name="edit-game-name" required/>
                                                        <label id="edit-game-name-label"
                                                               class="form-label text-white bg-dark search-label"
                                                               for="edit-game-name">Game name</label>
                                                    </div>
                                                </div>
                                                <div class="input-group date mt-3" id="edit-datepicker">
                                                    <input type="date"
                                                           class="form-control bg-dark border border-gold rounded-2 text-white"
                                                           id="edit-release-date"
                                                           name="edit-release-date" required/>
                                                </div>
                                                <div class="input-group">
                                                    <div class="form-outline mt-3 " style="width:100% !important">
                                                        <input type="text"
                                                               id="edit-developer"
                                                               class="form-control text-white"
                                                               name="edit-developer" required/>
                                                        <label id="edit-developer-label"
                                                               class="form-label text-white bg-dark search-label"
                                                               for="edit-developer">Developer</label>
                                                    </div>
                                                </div>
                                                <div class="input-group">
                                                    <div class="form-outline mt-3" style="width:100% !important">
                                                        <input type="text" id="edit-price"
                                                               class="form-control text-white"
                                                               name="edit-price" required/>
                                                        <label id="edit-price-label"
                                                               class="form-label text-white bg-dark search-label"
                                                               for="edit-price">Price</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="input-group mt-3">
                                                    <div class="form-outline rounded-1" style="width:100% !important">
                                                        <label for="edit-game-files" class="custom-file-upload"><i
                                                                class="fa fa-upload text-black"></i></label>
                                                        <input type="file"
                                                               class="form-control text-white bg-dark custom-file-upload"
                                                               style="display: none;"
                                                               id="edit-game-files"
                                                               name="edit-game-files" />
                                                        <label class="mx-1 text-white" style="font-size: 10px;">Game
                                                            Files</label>
                                                    </div>
                                                </div>
                                                <div class="input-group mt-3">
                                                    <div class="form-outline rounded-1" style="width:100% !important">
                                                        <label for="edit-game-picture" class="custom-file-upload"><i
                                                                class="fa fa-upload text-black"></i></label>
                                                        <input type="file"
                                                               class="form-control text-white bg-dark custom-file-upload"
                                                               style="display: none;"
                                                               id="edit-game-picture"
                                                               name="edit-game-picture" />
                                                        <label class="mx-1 text-white" style="font-size: 10px;">Game
                                                            Picture</label>
                                                    </div>
                                                </div>
                                                <div class="input-group">
                                                    <div class="form-outline mt-3" style="width:100% !important">
                                                        <input type="text" id="edit-publisher"
                                                               class="form-control text-white"
                                                               name="edit-publisher" required/>
                                                        <label id="edit-publisher-label"
                                                               class="form-label text-white bg-dark search-label"
                                                               for="edit-publisher">Publisher</label>
                                                    </div>
                                                </div>
                                                <div>
                                                    <select id="edit-discount" name="edit-discount" required
                                                            class="bg-dark rounded-1 border-gold border-1 shadow-0 col-6 w-100 p-2 text-white mt-3">
                                                        <option class="bg-dark text-white option-hover" value="NONE">
                                                                NONE
                                                        </option>
                                                        <c:forEach items="${allDiscounts}" var="discount">
                                                            <option class="bg-dark text-white option-hover" value="${discount.id}">
                                                                    ${discount.getName()}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <h5>Genres</h5>
                                            </div>
                                            <c:forEach items="${allGenres}" var="genre">
                                                <div class="col-4 mb-1">
                                                    <input type="checkbox" id="edit-genre-${genre.id}" name="genres" class="mb-1" value="${genre.id}">
                                                    <label for="edit-genre-${genre.id}">${genre.getName()}</label>
                                                </div>
                                            </c:forEach>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <h5>Platforms</h5>
                                            </div>
                                            <c:forEach items="${allPlatforms}" var="platform">
                                                <div class="col-4 mb-1">
                                                    <input type="checkbox" id="edit-platform-${platform.id}" name="platforms" class="mb-1" value="${platform.id}">
                                                    <label for="edit-platform-${platform.id}">${platform.getName()}</label>
                                                </div>
                                            </c:forEach>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <h5 class="mt-2 mb-3">Recommended</h5>
                                            </div>
                                            <div class="col-6">
                                                <div class="input-group">
                                                    <div class="form-outline mb-3" style="width:100% !important">
                                                        <input type="text"
                                                               id="edit-recommended-processor"
                                                               name="edit-recommended-processor"
                                                               class="form-control text-white" required/>
                                                        <label id="edit-recommended-processor-label"
                                                               class="form-label text-white bg-dark search-label"
                                                               for="edit-recommended-processor">Processor</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="input-group">
                                                    <div class="form-outline mb-3" style="width:100% !important">
                                                        <input type="text"
                                                               id="edit-recommended-gpu"
                                                               name="edit-recommended-gpu"
                                                               class="form-control text-white" required/>
                                                        <label id="edit-recommended-gpu-label"
                                                               class="form-label text-white bg-dark search-label"
                                                               for="edit-recommended-gpu">GPU</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-4">
                                                <div class="input-group">
                                                    <div class="form-outline mb-3" style="width:100% !important">
                                                        <input type="text"
                                                               id="edit-recommended-ram"
                                                               name="edit-recommended-ram"
                                                               class="form-control text-white" required/>
                                                        <label id="edit-recommended-ram-label"
                                                               class="form-label text-white bg-dark search-label"
                                                               for="edit-recommended-ram">RAM</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-4">
                                                <div class="input-group">
                                                    <div class="form-outline mb-3" style="width:100% !important">
                                                        <input type="text"
                                                               id="edit-recommended-storage"
                                                               name="edit-recommended-storage"
                                                               class="form-control text-white" required/>
                                                        <label id="edit-recommended-storage-label"
                                                               class="form-label text-white bg-dark search-label"
                                                               for="edit-recommended-storage">Storage</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-4">
                                                <div class="input-group">
                                                    <div class="form-outline mb-3" style="width:100% !important">
                                                        <input type="text"
                                                               id="edit-recommended-dxversion"
                                                               name="edit-recommended-dxversion"
                                                               class="form-control text-white" required/>
                                                        <label id="edit-recommended-dxversion-label"
                                                               class="form-label text-white bg-dark search-label"
                                                               for="edit-recommended-dxversion">DX Version</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <h5>Minimum</h5>
                                            </div>
                                            <div class="col-6">
                                                <div class="input-group">
                                                    <div class="form-outline mb-3" style="width:100% !important">
                                                        <input type="text"
                                                               id="edit-minimum-processor"
                                                               name="edit-minimum-processor"
                                                               class="form-control text-white" required/>
                                                        <label id="edit-minimum-processor-label"
                                                               class="form-label text-white bg-dark search-label"
                                                               for="edit-minimum-processor">Processor</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="input-group">
                                                    <div class="form-outline mb-3" style="width:100% !important">
                                                        <input type="text"
                                                               id="edit-minimum-gpu"
                                                               name="edit-minimum-gpu"
                                                               class="form-control text-white" required/>
                                                        <label id="edit-minimum-gpu-label"
                                                               class="form-label text-white bg-dark search-label"
                                                               for="edit-minimum-gpu">GPU</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-4">
                                                <div class="input-group">
                                                    <div class="form-outline mb-3" style="width:100% !important">
                                                        <input type="text"
                                                               id="edit-minimum-ram"
                                                               name="edit-minimum-ram"
                                                               class="form-control text-white" required/>
                                                        <label id="edit-minimum-ram-label"
                                                               class="form-label text-white bg-dark search-label"
                                                               for="edit-minimum-ram">RAM</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-4">
                                                <div class="input-group">
                                                    <div class="form-outline mb-3" style="width:100% !important">
                                                        <input type="text"
                                                               id="edit-minimum-storage"
                                                               name="edit-minimum-storage"
                                                               class="form-control text-white" required/>
                                                        <label id="edit-minimum-storage-label"
                                                               class="form-label text-white bg-dark search-label"
                                                               for="edit-minimum-storage">Storage</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-4">
                                                <div class="input-group">
                                                    <div class="form-outline mb-3" style="width:100% !important">
                                                        <input type="text"
                                                               id="edit-minimum-dxversion"
                                                               name="edit-minimum-dxversion"
                                                               class="form-control text-white" required/>
                                                        <label id="edit-minimum-dxversion-label"
                                                               class="form-label text-white bg-dark search-label"
                                                               for="edit-minimum-dxversion">DX Version</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="input-group">
                                                    <div class="form-outline mb-3" style="width:100% !important">
                                                        <textarea type="text"
                                                                  id="edit-description"
                                                                  name="edit-description"
                                                                  class="form-control text-white" required></textarea>
                                                        <label id="edit-description-label"
                                                               class="form-label text-white bg-dark search-label"
                                                               for="edit-description">Description</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer border-0">
                                        <button type="button" class="btn border border-1 border-gold text-gold"
                                                data-mdb-dismiss="modal">Close</button>
                                        <button type="submit"
                                                class="btn btn-dark border border-1 border-gold text-gold">Save
                                            changes</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <main style="margin-top: 58px">
                    <div id="main-admin-panel" class="container">
                        <!--Section: Sales Performance KPIs-->
                        <section class="mb-4">
                            <div class="card bg-black">
                                <div class="card-header text-center py-3">
                                    <h5 class="mb-0 text-center">
                                        <strong id="table-title" class="text-white">Games</strong>
                                    </h5>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-hover text-nowrap">
                                            <tbody id="main-table-body">

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <!--Section: Sales Performance KPIs-->
                    </div>
                </main>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <jsp:include page="footer.jsp" />

    <!-- Footer -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/solid.min.js"></script>
    <script type="text/javascript" src="js/admin-dashboard.js"></script>
    <script type="text/javascript" src="js/user-profile.js"></script>
</body>

</html>