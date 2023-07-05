<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<!-- Boxicons -->
	<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
	<!-- My CSS -->
	<link rel="stylesheet" href="{{url('css/style.css')}}">

	<title>Bake'd</title>
	
<style>
    
.table {
  width: 100%;
  overflow-x: auto;
  margin-bottom: 5rem;
}

table {
  border-collapse: collapse;
  width: 100%;
  border-radius: 30px;
  background-color: #f9f9f9;
  
}

thead th {
  background-color: #eee;
  color: #000000;
  text-align: left;
  
}

th, td {
  padding: 0.5rem;
  border: 1px solid #424242;
  
}

tfoot td {
  text-align: right;
}

</style>
</head>
<body>


	<!-- SIDEBAR -->
	<section id="sidebar">
		<a href="#" class="brand">
			<i class='bx bxs-smile'></i>
			<span class="text">Bake'd</span>
		</a>
		<ul class="side-menu top">
			<li>
				<a href="/index">
					<i class='bx bxs-dashboard' ></i>
					<span class="text">Dashboard</span>
				</a>
			</li>
			
			<li>
				<a href="/products">
					<i class='bx bxs-shopping-bag-alt' ></i>
					<span class="text">Products</span>
				</a>
			</li>
			<li class="active">
				<a href="/analytics">
					<i class='bx bxs-doughnut-chart' ></i>
					<span class="text">Analytics</span>
				</a>
			</li>
			<li>
				<a href="/notification">
					<i class='bx bxs-message-dots' ></i>
					<span class="text">Notification</span>
				</a>
			</li>
			<!--<li>
				<a href="#">
					<i class='bx bxs-group' ></i>
					<span class="text">Team</span>
				</a>
			</li>-->
		</ul>
		<ul class="side-menu">
			<!-- <li>
				<a href="#">
					<i class='bx bxs-cog' ></i>
					<span class="text">Settings</span>
				</a>
			</li> -->
			<li>
				<a href="/logout" class="logout">
					<i class='bx bxs-log-out-circle' ></i>
					<span class="text"  href="/logout">Logout</span>
					
				</a>
			</li>
		</ul>
	</section>
	<!-- SIDEBAR -->



	<!-- CONTENT -->
	<section id="content">
		<!-- NAVBAR -->
		<nav>
			<i class='bx bx-menu' ></i>
			<a href="#" class="nav-link">Categories</a>
			<form action="#">
				<div class="form-input">
					<input type="search" placeholder="Search...">
					<button type="submit" class="search-btn"><i class='bx bx-search' ></i></button>
				</div>
			</form>
			<input type="checkbox" id="switch-mode" hidden>
			<label for="switch-mode" class="switch-mode"></label>
			<a href="/notification" class="notification">
				<i class='bx bxs-bell' ></i>
				<span class="num">4</span>
			</a>
			<a href="#" class="profile">
				<img src="img/pe1.png">
			</a>
		</nav>
		<!-- NAVBAR -->

		<!-- MAIN -->
		<main>
			<div class="head-title">
				<div class="left">
					<h1>Analytics</h1>
					<ul class="breadcrumb">
						<li>
							<a href="#">Analytics</a>
						</li>
						<li><i class='bx bx-chevron-right' ></i></li>
						<li>
							<a class="active" href="#">Home</a>
						</li>
					</ul>
				</div>
				<a href="/cake-menu" class="btn-download">
					<i class='bx bxs-cloud-download' ></i>
					<span class="text">Menu</span>
				</a>
			</div>

			<ul class="box-info">
				<li>
					<i class='bx bxs-calendar-check' ></i>
					<span class="text">
						<h3>Orders So far</h3>
						<p>14</p>
						<p>Compared to last month <p>
						
					</span>
				</li>
				<li>
					<i class='bx bxs-group' ></i>
					<span class="text">
						<h3>Profit</h3>
						<p>32%</p>
						<p>Compared to last month <p>
					</span>
				</li>
				<!-- <li>
					<i class=img src=""></i>
					<span class="text">
					
						
						<p>12,00</p>
						<p>Compared to last month <p>
					</span>
				</li> -->
			</ul>


			<div class="table-data">
				<div class="order">
					<div class="head">
						<h3>Sales Value</h3>
						<p>overview</p>
						<i class='bx bx-search' ></i>
						<i class='bx bx-filter' ></i>
					</div>
					<table>
						<thead>
							<tr>
								
							</tr>
						</thead>
						<tbody>
							<section class="chart">
                                <canvas id="pageViewsChart"></canvas>
                              </section>
                        
					</table>
				</div>
				<div class="todo">
					<div class="head">
						<h3>Revenue Growth</h3>
						<i class='bx bx-plus' ></i>
						<i class='bx bx-filter ' ></i>
					</div>
					<section class="chart">

                        <canvas id="clicksChart"></canvas>
                      </section>
				</div>
			</div>
		  
		  <table id="new-orders-table">
			<thead>
			<br><br>
			</thead>
			<tbody>
			  <section class="table">
        <h2>Top Products</h2>
        <table>
          <thead>
            <tr>
          	<th>Product</th>
              <th>Views</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>Chocolate Cake</td>
              <td>150</td>
            </tr>
            <tr>
              <td>Cookies</td>
              <td>135</td>
            </tr>
            <tr>
              <td>Cheesecake</td>
              <td>120</td>
            </tr>
          </tbody>
        </table>
      </section>
			
			</tbody>
		  </table>
		  


		</main>
		<!-- MAIN -->
	</section>
	<!-- CONTENT -->
	
	

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

	<script src="{{url('js/analytics.js')}}"></script>
</body>
</html>