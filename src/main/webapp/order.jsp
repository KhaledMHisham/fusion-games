<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
        <!-- <%System.out.println(request.getAttribute("game"));%> -->


        <!DOCTYPE html>
        <html lang="en">
        
        <head>
            <meta http-equiv="content-type" content="text/html; charset=UTF-8">
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
        
            <title>Order Page</title>
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
            <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
            <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.css" rel="stylesheet" />
            <link rel="stylesheet" href="css/order.css" />
        
        </head>
        
        <body>
        
            <section class="h-100 gradient-custom">
                <div class="container py-5 h-100 ">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col-lg-10 col-xl-8">
                            <div class="card" style="border-radius: 10px;">
        
                                <div class="card-body p-4">
        
                                    <div class="card shadow-0 border mb-4 input-label text-gold">
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-md-2 text-gold font-size">
                                                    Order #1
                                                </div>
                                                <br>
                                                <div
                                                    class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                        <div class="me-3 position-relative">
        
                                                            <img src="images/game1.jpg"/>
                                            
                                                          </div>
                                                </div>
                                                <div
                                                    class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                    <p class="text-muted mb-0 small text-gold font-size">
                                                        <strong>${game.getName}</strong>
                                                    </p>
                                                </div>
                                                <div
                                                    class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                    <p class="text-muted mb-0 small text-gold font-size">action</p>
                                                </div>
                                                <div
                                                    class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                    <p class="text-muted mb-0 small text-gold font-size">
                                                        <strong>${order.getCreatedAt}</strong>
                                                    </p>
                                                </div>
                                                <div
                                                class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                <p class="text-muted mb-0 small text-gold font-size">
                                                    <strong>${game.getNetPrice}</strong></p>
                                            </div>
                                            </div>
                                            <br>
                                            <div class="row">
                                                <div class="col-md-2 text-gold">
        
                                                </div>
                                                <div
                                                    class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                        <div class="me-3 position-relative">
        
                                                            <img src="images/sekiro1.jpg"/>
                                            
                                                          </div>
                                                </div>
                                                <div
                                                    class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                    <p class="text-muted mb-0 small text-gold font-size">Sekiro</p>
                                                </div>
                                                <div
                                                    class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                    <p class="text-muted mb-0 small text-gold font-size">epic</p>
                                                </div>
                                                <div
                                                    class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                    <p class="text-muted mb-0 small text-gold font-size">23/9/2023</p>
                                                </div>
                                                <div
                                                    class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                    <p class="text-muted mb-0 small text-gold font-size">$50</p>
                                                </div>
                                            </div>
                                            <hr class="mb-4" style="background-color: #e0e0e0; opacity: 1;">
                                            <div class="row d-flex align-items-center">
        
                                                <div class="col-md-12">
                                                    <div class="d-flex justify-content-around mb-1">
                                                        <p class="text-muted mt-1 mb-0 small ms-xl-5 text-gold">
                                                            Order Status</p>
                                                        <p class="text-muted mt-1 mb-0 small ms-xl-5 text-gold">
                                                            Delivered</p>
                                                        <p class="text-muted mt-1 mb-0 small ms-xl-5 text-gold">
                                                            Total Price</p>
                                                        <p class="text-muted mt-1 mb-0 small ms-xl-5 text-gold">100$
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
        
                 <!-- //////////////////////////////////////////////////////////////////////////////////////////////////////// -->
                                    <div class="card shadow-0 border mb-4 input-label text-gold">
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-md-2 text-gold font-size">
                                                    Order #2
                                                </div>
                                                <br>
                                                <div
                                                    class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                        <div class="me-3 position-relative">
        
                                                            <img src="images/game1.jpg"/>
                                            
                                                          </div>
                                                </div>
                                                <div
                                                    class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                    <p class="text-muted mb-0 small text-gold font-size">
                                                        Game of thrones
                                                    </p>
                                                </div>
                                                <div
                                                    class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                    <p class="text-muted mb-0 small text-gold font-size">action</p>
                                                </div>
                                                <div
                                                    class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                    <p class="text-muted mb-0 small text-gold font-size">
                                                        23/2
                                                    </p>
                                                </div>
                                                <div
                                                class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                <p class="text-muted mb-0 small text-gold font-size">$50</p>
                                            </div>
                                            </div>
                                            <br>
                                            <div class="row">
                                                <div class="col-md-2 text-gold">
        
                                                </div>
                                                <div
                                                    class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                        <div class="me-3 position-relative">
        
                                                            <img src="images/sekiro1.jpg"/>
                                            
                                                          </div>
                                                </div>
                                                <div
                                                    class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                    <p class="text-muted mb-0 small text-gold font-size">Sekiro</p>
                                                </div>
                                                <div
                                                    class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                    <p class="text-muted mb-0 small text-gold font-size">epic</p>
                                                </div>
                                                <div
                                                    class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                    <p class="text-muted mb-0 small text-gold font-size">23/9/2023</p>
                                                </div>
                                                <div
                                                    class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                    <p class="text-muted mb-0 small text-gold font-size">$50</p>
                                                </div>
                                            </div>
                                            <hr class="mb-4" style="background-color: #e0e0e0; opacity: 1;">
                                            <div class="row d-flex align-items-center">
        
                                                <div class="col-md-12">
                                                    <div class="d-flex justify-content-around mb-1">
                                                        <p class="text-muted mt-1 mb-0 small ms-xl-5 text-gold">
                                                            Order Status</p>
                                                        <p class="text-muted mt-1 mb-0 small ms-xl-5 text-gold">
                                                            Delivered</p>
                                                        <p class="text-muted mt-1 mb-0 small ms-xl-5 text-gold">
                                                            Total Price</p>
                                                        <p class="text-muted mt-1 mb-0 small ms-xl-5 text-gold">100$
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
        
                  <!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////  -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        
        </body>
        
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.js"></script>
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
        
        </html>