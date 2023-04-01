<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <title>profile</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.css" rel="stylesheet" />
    <link href="../css/header.css" rel="stylesheet" />
    <link href="../css/home-page.css" rel="stylesheet" />
    <link href="../css/user-profile.css" rel="stylesheet"/>
    <link rel="shortcut icon" href="images/phoenix.png" type="image/x-icon" />

</head>

<body class="bg-black">

    <!--Main Navigation-->
    <jsp:include page="header.jsp" />


    <div class="container">
        <div class="row">
            <div class=" col-lg-3 col-md-3 col-sm-12 mb-3 rounded-2">
                <div class="list-group list-group-dark">
                    <button type="button" class=" account-control-item list-group-item bg-main text-white list-group-item-action px-3 border-0" disabled>
                        <h5>Account Controls</h5>
                    </button>
                    <button type="button" class="account-control-item list-group-item bg-main text-white list-group-item-action px-3 border-0"
                      aria-current="true">
                      <i class="fas fa-wrench fa-fw me-3"></i><span>Account Settings</span>
                    </button>
                    <button type="button" class="account-control-item list-group-item bg-main text-white list-group-item-action px-3 border-0"
                      aria-current="true">
                      <i class="fas fa-chart-bar fa-fw me-3"></i><span>Orders</span>
                    </button>
                  </div>
            </div>
            <div class="bg-main p-3 col-lg-8 col-md-8 col-sm-12 rounded-2 d-flex flex-column justify-content-between">
                <div class="row m-2">
                    <div class="col-12">
                        <h3>Account Information</h3>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12 ">
                        <div class="input-group d-flex flex-column">
                            <div class="form-outline mt-2 d-flex flex-column">
                                <label id="username-label" class="form-label text-gold bg-main search-label" style="font-size: 14px;"
                                       for="username">Username</label>
                                <input type="text" id="username" class=" bg-main border-1 border-gold text-white p-1 pt-2 pb-2"/>

                            </div>
                            <span id="username-error" style="font-size: 10px;" class="text-end text-danger m-0"></span>
                        </div>
                    </div>
                </div>
                <div class="row m-2">
                    <div class="col-6 d-flex flex-column justify-content-between">
                        <div class="row">
                            <div class="col-12 mb-3">
                                <div class="input-group d-flex flex-column">
                                    <div class="form-outline d-flex flex-column">
                                        <label id="first-name-label" class="form-label text-gold bg-main search-label" style="font-size: 14px;"
                                               for="first-name">First Name</label>
                                        <input type="text" id="first-name" class=" bg-main border-1 border-gold text-white p-1 pt-2 pb-2"/>
                                    </div>
                                    <span id="first-name-error" style="font-size: 10px;" class="text-end text-danger m-0"></span>
                                </div>
                            </div>
                            <div class="col-12 mb-3">
                                <div class="input-group d-flex flex-column">
                                    <div class="form-outline d-flex flex-column">
                                        <label id="email-label" class="form-label text-gold bg-main search-label" style="font-size: 14px;"
                                               for="email">Email Address</label>
                                        <input type="text" id="email" class=" bg-main border-1 border-gold text-white p-1 pt-2 pb-2"/>
                                    </div>
                                    <span id="email-error" style="font-size: 10px;" class="text-end text-danger m-0"></span>
                                </div>
                            </div>
                            <div class="col-12 mb-3">
                                <div class="input-group d-flex flex-column">
                                    <div class="form-outline d-flex flex-column">
                                        <label id="password-label" class="form-label text-gold bg-main search-label" style="font-size: 14px;"
                                               for="password">Password</label>
                                        <input type="password" id="password" class=" bg-main border-1 border-gold text-white p-1 pt-2 pb-2"/>
                                    </div>
                                    <span id="password-error" style="font-size: 10px;" class="text-end text-danger m-0"></span>
                                </div>
                            </div>
                            <div class="col-12 mb-3">
                                <div class="input-group d-flex flex-column">
                                    <div class="form-outline d-flex flex-column">
                                        <label id="phonenumber-label" class="form-label text-gold bg-main search-label" style="font-size: 14px;"
                                               for="phonenumber">Phone Number</label>
                                        <input type="text" id="phonenumber" class="bg-main border-1 border-gold text-white p-1 pt-2 pb-2"/>
                                    </div>
                                    <span id="phonenumber-error" style="font-size: 10px;" class="text-end text-danger m-0"></span>
                                </div>
                            </div>
                            <div class="col-12">
                                <select id="country" name="country" class="text-white rounded-1 border-gold col-6 bg-main mt-2 p-2">
                                    <option class="bg-black border border-gold rounded-2 text-muted option-hover" value="country"
                                      selected>Select country</option>
                                    <option class="bg-black text-white option-hover" value="AF">Afghanistan</option>
                                    <option class="bg-black text-white option-hover" value="AL">Albania</option>
                                    <option class="bg-black text-white option-hover" value="DZ">Algeria</option>
                                    <option class="bg-black text-white option-hover" value="CM">Cameroon</option>
                                    <option class="bg-black text-white option-hover" value="CA">Canada</option>
                                    <option class="bg-black text-white option-hover" value="DJ">Djibouti</option>
                                    <option class="bg-black text-white option-hover" value="EG">Egypt</option>
                                  </select>
                            </div>
                            <span id="country-error" style="font-size: 10px;" class="text-end text-danger m-0"></span>
                        </div>
                    </div>
                    <div class="col-6 d-flex flex-column justify-content-between">
                        <div class="row">
                            <div class="col-12">
                                <div class="input-group d-flex flex-column">
                                    <div class="form-outline d-flex flex-column">
                                        <label id="last-name-label" class="form-label text-gold bg-main search-label" style="font-size: 14px;"
                                               for="last-name">Last Name</label>
                                        <input type="text" id="last-name" class="bg-main border-1 border-gold text-white p-1 pt-2 pb-2"/>
                                    </div>
                                    <span id="last-name-error" style="font-size: 10px;" class="text-end text-danger m-0"></span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="input-group d-flex flex-column">
                                    <div class="form-outline d-flex flex-column">
                                        <label id="credit-label" class="form-label text-gold bg-main search-label" style="font-size: 14px;"
                                               for="credit">Credit</label>
                                        <input type="text" id="credit" name="credit" class="bg-main border-1 border-gold text-white p-1 pt-2 pb-2"/>
                                    </div>
                                    <span id="credit-error" style="font-size: 10px;" class="text-end text-danger m-0"></span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="input-group d-flex flex-column">
                                    <div class="form-outline d-flex flex-column">
                                        <label id="confirm-password-label" class="form-label text-gold bg-main search-label"
                                               for="confirm-password">Confirm Password</label>
                                        <input type="password" id="confirm-password" class="bg-main border-1 border-gold text-white p-1 pt-2 pb-2"/>
                                    </div>
                                    <span id="confirm-password-error" style="font-size: 10px;" class="text-end text-danger m-0"></span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="row">
                                    <div class="date" id="datepicker">
                                        <label id="birth-date-label" class="form-label text-gold bg-main search-label" style="font-size: 14px;"
                                               for="birth-date">Birth Date</label>
                                        <input type="date" class="form-control bg-main border border-gold rounded-2 text-white p-2 pt-2 pb-2"
                                               id="birth-date" />
                                    </div>
                                    <span id="birth-date-error" style="font-size: 10px;" class="text-end text-danger m-0"></span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <button class="btn btn-outline-light text-black btn-gold border-gold w-100  mt-2 p-2" type="button" onclick="editProfile()">Submit</button>
                            </div>
                        </div>
                        </div>
                    </div>
                </div>
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
    <script type="text/javascript" src="../js/home-page.js"></script>
    <script type="text/javascript" src="../js/user-profile.js"></script>
    <script type="text/javascript" src="../js/header.js"></script>
    <script type="text/javascript" src="../js/logout.js"></script>
</body>

</html>