<%@taglib prefix="c" uri="jakarta.tags.core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
        <!-- <%System.out.println(request.getAttribute("game"));%> -->

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta http-equiv="content-type" content="text/html; charset=UTF-8">
            <meta charset="UTF-8">
            <title>Home page style 3</title>
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
            <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
            <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.css" rel="stylesheet" />
            <link href="css/home-page.css" rel="stylesheet" />
            <link href="css/user-profile.css" rel="stylesheet" />
        </head>

        <body class="bg-black">

            <div class="bg-main p-3 col-lg-8 col-md-8 col-sm-12 rounded-2 d-flex flex-column justify-content-between">
                <div class="row m-2">
                    <div class="col-12">
                        <h3>Account Information</h3>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12 ">
                        <div class="input-group">
                            <div class="form-outline mt-2">
                                <input type="text" id="username" class="form-control text-gold"/>
                                <label id="username-label" class="form-label text-gold bg-main search-label"
                                    for="username">Username</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row m-2">
                    <div class="col-6 d-flex flex-column justify-content-between">
                        <div class="row">
                            <div class="col-12 mb-3">
                                <div class="input-group">
                                    <div class="form-outline">
                                        <input type="text" id="first-name" class="form-control text-gold"/>
                                        <label id="first-name-label" class="form-label text-gold bg-main search-label"
                                            for="first-name">First Name</label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 mb-3">
                                <div class="input-group">
                                    <div class="form-outline">
                                        <input type="text" id="email" class="form-control text-gold"/>
                                        <label id="email-label" class="form-label text-gold bg-main search-label"
                                            for="email">Email Address</label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 mb-3">
                                <div class="input-group">
                                    <div class="form-outline">
                                        <input type="password" id="password" class="form-control text-gold"/>
                                        <label id="password-label" class="form-label text-gold bg-main search-label"
                                            for="password">Password</label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 mb-3">
                                <div class="input-group">
                                    <div class="form-outline">
                                        <input type="text" id="phonenumber" class="form-control text-gold"/>
                                        <label id="phonenumber-label" class="form-label text-gold bg-main search-label"
                                            for="phonenumber">Phone Number</label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 mb-3">
                                <select id="country" name="country" class="text-gold rounded-1 border-gold col-6 bg-main p-2">
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
                                  <span id="country-error" style="font-size: 10px;" class="text-danger"></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 d-flex flex-column justify-content-between .g-col">
                        <div class="row"></div>
                            <div class="col-12 mb-3">
                                <div class="input-group">
                                    <div class="form-outline">
                                        <input type="text" id="last-name" class="form-control text-gold"/>
                                        <label id="last-name-label" class="form-label text-gold bg-main search-label"
                                            for="last-name">Last Name</label>
                                    </div>
                                </div>
                            </div> 
                            <div class="col-12 mb-3">
                                <div class="input-group">
                                    <div class="form-outline">
                                        <input type="text" id="credit" class="form-control text-gold"/>
                                        <label id="credit-label" class="form-label text-gold bg-main search-label"
                                            for="credit">Credit</label>
                                    </div>
                                </div>
                            </div>   
                            <div class="col-12 mb-3">
                                <div class="input-group">
                                    <div class="form-outline">
                                        <input type="password" id="confirm-password" class="form-control text-gold"/>
                                        <label id="confirm-password-label" class="form-label text-gold bg-main search-label"
                                            for="confirm-password">Confirm Password</label>
                                    </div>
                                </div>
                            </div> 
                            <div class="col-12 mb-3">
                                <div class="row">
                                  <div class="input-group date" id="datepicker">
                                    <input type="date" class="form-control bg-main border border-gold rounded-2 text-gold"
                                      id="birth-date" />
                                  </div>
                                </div>
                                <span id="birth-date-error" style="font-size: 10px;" class="text-danger"></span>
                            </div> 
                            <div class="col-12 mb-3">
                                <button class="btn btn-outline-light text-black btn-gold border-gold w-100" type="button" onclick="editProfile()">Submit</button>
                            </div>   
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/solid.min.js"></script>
    <script type="text/javascript" src="js/home-page.js"></script>
    <script type="text/javascript" src="js/order.js"></script>

    
</body>

</html>