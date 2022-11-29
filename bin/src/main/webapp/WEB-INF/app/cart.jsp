<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
    /*Modal Style*/    
    .center {
        margin-top:50px;   
    }

    .modal-header {
        padding-bottom: 5px;
    }

    .modal-footer {
            padding: 0;
        }
        
    .modal-footer .btn-group button {
        height:40px;
        border-top-left-radius : 0;
        border-top-right-radius : 0;
        border: none;
        border-right: 1px solid #ddd;
    }
        
    .modal-footer .btn-group:last-child > button {
        border-right: 0;
    }
}
    </style>
</head>
<body>

<!-- Modal
    ================================================== -->

    <div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">    
      <div class="modal-dialog modal-lg">
        <div class="modal-content">

          <!-- Modal Header -->
          <div class="modal-header">
            <h3 class="modal-title" id="lineModalLabel">회원가입</h3>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
          </div>

          <!-- Modal body -->
          <div class="modal-body"> 
				<section class="jumbotron text-center">
				    <div class="container">
				        <h1 class="jumbotron-heading">E-COMMERCE CART</h1>
				     </div>
				</section>
				
				<div class="container mb-4">
				    <div class="row">
				        <div class="col-12">
				            <div class="table-responsive">
				                <table class="table table-striped">
				                    <thead>
				                        <tr>
				                            <th scope="col"> </th>
				                            <th scope="col">Product</th>
				                            <th scope="col">Available</th>
				                            <th scope="col" class="text-center">Quantity</th>
				                            <th scope="col" class="text-right">Price</th>
				                            <th> </th>
				                        </tr>
				                    </thead>
				                    <tbody>
				                        <tr>
				                            <td><img src="https://dummyimage.com/50x50/55595c/fff" /> </td>
				                            <td>Product Name Dada</td>
				                            <td>In stock</td>
				                            <td><input class="form-control" type="text" value="1" /></td>
				                            <td class="text-right">124,90 €</td>
				                            <td class="text-right"><button class="btn btn-sm btn-danger"><i class="fa fa-trash"></i> </button> </td>
				                        </tr>
				                        <tr>
				                            <td><img src="https://dummyimage.com/50x50/55595c/fff" /> </td>
				                            <td>Product Name Toto</td>
				                            <td>In stock</td>
				                            <td><input class="form-control" type="text" value="1" /></td>
				                            <td class="text-right">33,90 €</td>
				                            <td class="text-right"><button class="btn btn-sm btn-danger"><i class="fa fa-trash"></i> </button> </td>
				                        </tr>
				                        <tr>
				                            <td><img src="https://dummyimage.com/50x50/55595c/fff" /> </td>
				                            <td>Product Name Titi</td>
				                            <td>In stock</td>
				                            <td><input class="form-control" type="text" value="1" /></td>
				                            <td class="text-right">70,00 €</td>
				                            <td class="text-right"><button class="btn btn-sm btn-danger"><i class="fa fa-trash"></i> </button> </td>
				                        </tr>
				                        <tr>
				                            <td></td>
				                            <td></td>
				                            <td></td>
				                            <td></td>
				                            <td>Sub-Total</td>
				                            <td class="text-right">255,90 €</td>
				                        </tr>
				                        <tr>
				                            <td></td>
				                            <td></td>
				                            <td></td>
				                            <td></td>
				                            <td>Shipping</td>
				                            <td class="text-right">6,90 €</td>
				                        </tr>
				                        <tr>
				                            <td></td>
				                            <td></td>
				                            <td></td>
				                            <td></td>
				                            <td><strong>Total</strong></td>
				                            <td class="text-right"><strong>346,90 €</strong></td>
				                        </tr>
				                    </tbody>
				                </table>
				            </div>
				        </div>
				        <div class="col mb-2">
				            <div class="row">
				                <div class="col-sm-12  col-md-6">
				                    <button class="btn btn-block btn-light">Continue Shopping</button>
				                </div>
				                <div class="col-sm-12 col-md-6 text-right">
				                    <button class="btn btn-lg btn-block btn-success text-uppercase">Checkout</button>
				                </div>
				            </div>
				        </div>
				    </div>
				</div>
            </div>                           
                   
          <!-- Modal footer -->
         </div>
        </div>
      </div>
</body>
</html>