<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>Forms / Elements - NiceAdmin Bootstrap Template</title>
  <meta content="" name="description">
  <meta content="" name="keywords">
  <meta name="csrf-token" content="{{ csrf_token() }}">
  <!-- Favicons -->
  <link href="{{asset('assets/img/favicon.png')}}" rel="icon">
  <link href="{{asset('assets/img/apple-touch-icon.png')}}" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="{{asset('assets/vendor/bootstrap/css/bootstrap.min.css')}}" rel="stylesheet">
  <link href="{{asset('assets/vendor/bootstrap-icons/bootstrap-icons.css')}}" rel="stylesheet">
  <link href="{{asset('assets/vendor/boxicons/css/boxicons.min.css')}}" rel="stylesheet">
  <link href="{{asset('assets/vendor/quill/quill.snow.css')}}" rel="stylesheet">
  <link href="{{asset('assets/vendor/quill/quill.bubble.css')}}" rel="stylesheet">
  <link href="{{asset('assets/vendor/remixicon/remixicon.css')}}" rel="stylesheet">
  <link href="{{asset('assets/vendor/simple-datatables/style.css')}}" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="{{asset('assets/css/style.css')}}" rel="stylesheet">
  <script src="{{asset('assets/vendor/jQuery3.7/jQuery.js')}}"></script>
</head>
<script>
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    // dom


    $(document).ready(function(){
        $("#message").hide();
        function sumdata(){
           var rowCount=$("#tblpro tr").length;
            var total=0;
            var amount=0;
            for(var i=1; i<(rowCount-1);i++){
                amount=$("#tblpro").find("tr").eq(i).find("td").eq(3).children().val();
                total = total+parseFloat(amount);
            }
          $("#txttotal").val(total);
        }
      // for create function in change
            function sumdatagrandtax(){

                var rowCount=$("#tblpro tr").length;
                var totaltax=0
                    var total=0;
                    var amount=0;
                    var dis=$("#txtdicount").val();
                    var valuedis=parseFloat(dis);
                    var datadicounttaxx=$("#txttax").val();
                        var valuedicounttax=parseFloat(datadicounttaxx);
                    for(var i=1; i<(rowCount-1);i++){
                        amount=$("#tblpro").find("tr").eq(i).find("td").eq(3).children().val();
                        total = total+parseFloat(amount);

                    }
                    var txtgrand=(total-(total*valuedis)/100)+valuedicounttax;
            $("#txtgrand").val(txtgrand);
                // alert(total);
                }
        $("#txtbarcode").change(function(){
         var txtuserchang =  $("#txtbarcode").val();
        $.post('/searchproduct', {
                 pushcontroller:txtuserchang
                }, function(result) {
                  //  alert(result);
                 if(result==0){
                    alert("hhh")
                   }
                else{
                        const arrydb=result.split(";");
                        var proid=arrydb[0];
                        var proname=arrydb[1];
                        // new for barcode
                        //var proname="<input type='text' value='' class='txtproid form-control'>";;
                        var txtproid= "<input type='text' class='txtproid form-control'  value='"+proid+"'>";
                       var txtqty= "<input type='text' value='0' class='txtqty form-control'>";
                        var txtcost= "<input type='text' value='0' class='txtcost form-control'>";
                        var txtamount= "<input type='text' value='0' class='txtamount form-control'>"
                            $("#add_row").append('<tr><td>'+txtproid+''+proname+'</td><td>' +txtqty+'</td><td>' +txtcost+'</td><td>' +txtamount+'</td><td><a href="#" class="remove">Remove</a></td></tr>');
                   }
                });
                $("#tblpro").on("change",".txtqty",function(){
                  var current_row=$(this).closest('tr');
                  var qty=current_row.find('td').eq(1).children().val();
                  var cost=current_row.find('td').eq(2).children().val();
                   var Amount =  parseFloat(qty)*parseFloat(cost);
                    current_row.find('td').eq(3).children().val(Amount);
                    sumdata();
                })
                // create event in table in for change
                $("#tblpro").on("change",".txtcost",function(){
                  //  alert("done")
                  var current_row=$(this).closest('tr');
                  var qty=current_row.find('td').eq(1).children().val();
                  var cost=current_row.find('td').eq(2).children().val();
                   var Amount =  parseFloat(qty)*parseFloat(cost);
                   current_row.find('td').eq(3).children().val(Amount);
                 sumdata();
                })
               // create event in change
               $("#txtdicount").change(function(){

            //   var y = parseFloat(x);
            sumdatagrandtax();
              })
              // create change
              $("#txttax").change(function(){
                sumdatagrandtax();
              })
        // // $("#tblpo").on("change",".txtqty", function(){
               // save btn
           $("#btnsave").click(function(){
            var podate=$("#txtpodate").val();
            var txtpocorde=$("#txtpocode").val();
            var txtdicount=$("#txtdicount").val();
            var txttax=$("#txttax").val();
            var txtgrand=  $("#txtgrand").val();
            var txttotal=  $("#txttotal").val();
            var prid=$(".txtproid").map(function(){
                return $(this).val();
            }).get();
            var qty =  $(".txtqty").map(function(){
                return $(this).val();
            }).get();

            var cost =  $(".txtcost").map(function(){
                return $(this).val();
            }).get();
            $.post("/saveproduct",{podate:podate,txtpocorde:txtpocorde,txtdicount:txtdicount,txttax:txttax,txtgrand:txtgrand,txttotal:txttotal,'prid[]':prid,'qty[]':qty,'cost[]':cost}, function(data){
           if(data==1){
                 window.location.href="{{ route('namebacode') }}";
           }
            });
        })
        //     var current_row = $(this).closest('tr');
        })

    })
</script>
<body>
     <!-- ======= Header ======= -->
     <header id="header" class="header fixed-top d-flex align-items-center">

        <div class="d-flex align-items-center justify-content-between">
            <a href="{{ url('/dashboard') }}" class="logo d-flex align-items-center">
                <img src="assets/img/logo.png" alt="">
                <span class="d-none d-lg-block">NiceAdmin</span>
            </a>
            <i class="bi bi-list toggle-sidebar-btn"></i>
        </div><!-- End Logo -->

        <div class="search-bar">
            <form class="search-form d-flex align-items-center" method="POST" action="#">
                <input type="text" name="query" placeholder="Search" title="Enter search keyword">
                <button type="submit" title="Search"><i class="bi bi-search"></i></button>
            </form>
        </div><!-- End Search Bar -->

        <nav class="header-nav ms-auto">
            <ul class="d-flex align-items-center">
                <li class="nav-item d-block d-lg-none">
                    <a class="nav-link nav-icon search-bar-toggle " href="#">
                        <i class="bi bi-search"></i>
                    </a>
                </li><!-- End Search Icon-->

                <li class="nav-item dropdown">

                    <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
                        <i class="bi bi-bell"></i>
                        <span class="badge bg-primary badge-number">4</span>
                    </a><!-- End Notification Icon -->

                    <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications">
                        <li class="dropdown-header">
                            You have 4 new notifications
                            <a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View all</span></a>
                        </li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>

                        <li class="notification-item">
                            <i class="bi bi-exclamation-circle text-warning"></i>
                            <div>
                                <h4>Lorem Ipsum</h4>
                                <p>Quae dolorem earum veritatis oditseno</p>
                                <p>30 min. ago</p>
                            </div>
                        </li>

                        <li>
                            <hr class="dropdown-divider">
                        </li>

                        <li class="notification-item">
                            <i class="bi bi-x-circle text-danger"></i>
                            <div>
                                <h4>Atque rerum nesciunt</h4>
                                <p>Quae dolorem earum veritatis oditseno</p>
                                <p>1 hr. ago</p>
                            </div>
                        </li>

                        <li>
                            <hr class="dropdown-divider">
                        </li>

                        <li class="notification-item">
                            <i class="bi bi-check-circle text-success"></i>
                            <div>
                                <h4>Sit rerum fuga</h4>
                                <p>Quae dolorem earum veritatis oditseno</p>
                                <p>2 hrs. ago</p>
                            </div>
                        </li>

                        <li>
                            <hr class="dropdown-divider">
                        </li>

                        <li class="notification-item">
                            <i class="bi bi-info-circle text-primary"></i>
                            <div>
                                <h4>Dicta reprehenderit</h4>
                                <p>Quae dolorem earum veritatis oditseno</p>
                                <p>4 hrs. ago</p>
                            </div>
                        </li>

                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li class="dropdown-footer">
                            <a href="#">Show all notifications</a>
                        </li>

                    </ul><!-- End Notification Dropdown Items -->

                </li><!-- End Notification Nav -->

                <li class="nav-item dropdown">

                    <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
                        <i class="bi bi-chat-left-text"></i>
                        <span class="badge bg-success badge-number">3</span>
                    </a><!-- End Messages Icon -->

                    <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow messages">
                        <li class="dropdown-header">
                            You have 3 new messages
                            <a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View all</span></a>
                        </li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>

                        <li class="message-item">
                            <a href="#">
                                <img src="assets/img/messages-1.jpg" alt="" class="rounded-circle">
                                <div>
                                    <h4>Maria Hudson</h4>
                                    <p>Velit asperiores et ducimus soluta repudiandae labore officia est ut...</p>
                                    <p>4 hrs. ago</p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>

                        <li class="message-item">
                            <a href="#">
                                <img src="assets/img/messages-2.jpg" alt="" class="rounded-circle">
                                <div>
                                    <h4>Anna Nelson</h4>
                                    <p>Velit asperiores et ducimus soluta repudiandae labore officia est ut...</p>
                                    <p>6 hrs. ago</p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>

                        <li class="message-item">
                            <a href="#">
                                <img src="assets/img/messages-3.jpg" alt="" class="rounded-circle">
                                <div>
                                    <h4>David Muldon</h4>
                                    <p>Velit asperiores et ducimus soluta repudiandae labore officia est ut...</p>
                                    <p>8 hrs. ago</p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>

                        <li class="dropdown-footer">
                            <a href="#">Show all messages</a>
                        </li>

                    </ul><!-- End Messages Dropdown Items -->

                </li><!-- End Messages Nav -->

                <li class="nav-item dropdown pe-3">

                    <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#"
                        data-bs-toggle="dropdown">
                        @if((Auth::user()->avatar)==null)
                        <img src="/icon/person.png" alt="Profile" class="rounded-circle">
                        @else
                        <img src="/avatars/{{ Auth::user()->avatar }}" alt="Profile" class="rounded-circle">
                        @endif
                        <span class="d-none d-md-block dropdown-toggle ps-2">{{ Auth::user()->name }}</span>
                    </a><!-- End Profile Iamge Icon -->
                    <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
                        <li class="dropdown-header">
                            <h6>{{ Auth::user()->name }}</h6>
                        </li>
                            <hr class="dropdown-divider">
                        </li>

                        <li>
                            <x-dropdown-link :href="route('profile.edit')">
                                {{ __('Profile') }}
                            </x-dropdown-link>
                        </li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>

                        <li>
                            <a class="dropdown-item d-flex align-items-center" href="users-profile.html">
                                <i class="bi bi-gear"></i>
                                <span>Account Settings</span>
                            </a>
                        </li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>

                        <li>

                        </li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>

                        <li>
                            <form method="POST" action="{{ route('logout') }}">
                                @csrf
                                <x-responsive-nav-link :href="route('logout')"
                                    onclick="event.preventDefault();
                                            this.closest('form').submit();">
                                               {{ __('Log Out') }}
                                </x-responsive-nav-link>
                            </form>

                        </li>

                    </ul><!-- End Profile Dropdown Items -->
                </li><!-- End Profile Nav -->

            </ul>
        </nav><!-- End Icons Navigation -->

    </header><!-- End Header -->
    <!-- ======= Sidebar ======= -->
    <aside id="sidebar" class="sidebar">
        <ul class="sidebar-nav" id="sidebar-nav">
            <li class="nav-item">
                <a class="nav-link " href="{{ url('/dashboard') }}">
                    <i class="bi bi-grid"></i>
                    <span>Dashboard</span>
                </a>
            </li><!-- End Dashboard Nav -->
            <li class="nav-item">
                <a class="nav-link collapsed"  href="{{ url('showprodust') }}">
                    <i class="bi bi-eye"></i>
                    <span>View Barcode</span>
                </a>
            </li><!-- End Dashboard Nav -->

            <li class="nav-item">
                <a class="nav-link collapsed" href="{{ url('addprodust') }}">
                    <i class="bi bi-bag-plus"></i>
                    <span>Add Product</span>
                </a>
            </li><!-- End Dashboard Nav -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="{{ url('view') }}">
                    <i class="bi bi-bag-check-fill"></i>
                    <span>view product Barcode</span>
                </a>
            </li><!-- End Dashboard Nav -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="{{ url('barcodeview') }}">
                    <i class="bi bi-joystick"></i>
                    <span>Add Product</span>
                </a>
            </li><!-- End Dashboard Nav -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="{{ url('search') }}">
                    <i class="bi bi-calendar-check-fill"></i>
                    <span>Search Date Report</span>
                </a>
            </li><!-- End Dashboard Nav -->
        </ul>

    </aside><!-- End Sidebar-->

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Add Product</h1>

    </div><!-- End Page Title thon-->
      {{-- new create form in dastase --}}
       <h3>Form Create P.O</h3>
       <div class="container">
        <div class="row">
            <div class="col-3">
                <input type="Date" id="txtpodate" class="form-control">
            </div>
            <div class="col-3">
                <input type="text" id="txtpocode" class="form-control" placeholder="input conde">
            </div>
            <div class="col-3">
                <input type="text" id="txtdicount" class="form-control" placeholder="input dicount">
            </div>
            <div class="col-3">
                <input type="text" id="txttax" class="form-control" placeholder="input tax">
            </div>
        </div>
       </div>
      {{-- new create form in dastase --}}
      {{-- add layou form in  --}}
      <div class="container">
        <div class="row">
            <div class="col-5">
                <input type="text" id="txtbarcode" class="form-control" placeholder="input barcode">
            </div>
        </div>
        <table class="table table-bordered border-primary" id="tblpro">
            <thead>
            <tr>
                <td>Product</td>
                <td>Qty</td>
                <td>Cost</td>
                <td>Amount</td>
                <td>Action</td>
            </tr>
            </thead>
            <tbody id="add_row">
            </tbody>
             <tfoot>
                <tr>
                <td colspan="3" align="right">Total</td>
                <td><input type="text" id="txttotal" class="form-control"></td>
                <td></td>
                </tr>

                </tfoot>
        </table>
                  <table class="table table-bordered border-primary">
                    <tr>
                        <td colspan="4" align="right">Grand Total </td>
                        <td><input type="text" id="txtgrand" class="form-control"></td>
                        <td></td>
                        </tr>
                </table>
                <div class="col-3 offset-5">
                    <button type="button" id="btnsave" class="btn-primary btn">save</button>
                </div>
      </div>
      {{-- end layou form in  --}}


  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">
    <div class="copyright">
      &copy; Copyright <strong><span>NiceAdmin</span></strong>. All Rights Reserved
    </div>
    <div class="credits">
      Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="{{asset('assets/vendor/apexcharts/apexcharts.min.js')}}"></script>
  <script src="{{asset('assets/vendor/bootstrap/js/bootstrap.bundle.min.js')}}"></script>
  <script src="{{asset('assets/vendor/chart.js/chart.umd.js')}}"></script>
  <script src="{{asset('assets/vendor/echarts/echarts.min.js')}}"></script>
  <script src="{{asset('assets/vendor/quill/quill.min.js')}}"></script>
  <script src="{{asset('assets/vendor/simple-datatables/simple-datatables.js')}}"></script>
  <script src="{{asset('assets/vendor/tinymce/tinymce.min.js')}}"></script>
  <script src="{{asset('assets/vendor/php-email-form/validate.js')}}"></script>

  <!-- Template Main JS File -->
  <script src="{{asset('assets/js/main.js')}}"></script>

</body>

</html>
