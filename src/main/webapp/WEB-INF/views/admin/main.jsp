<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.84.0">

<!-- <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/dashboard/"> -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

<title>Spring Hotel 관리자페이지입니다.</title>
<style>

	.container-fluid {
		background-color:RGB(245, 246, 250);
	}
	
	#sale .col {
		background-color:RGBa(255, 255, 255, 0.9);
		border-radius: 5px;
		margin: 20px;
	}
	
	#rev .col {
		background-color:RGBa(255, 255, 255, 0.9);
		border-radius: 5px;
		margin: 20px;
	}
	
	.d-block {
		font-size: 0.7rem;
		color:darkgray;
	}
	li {
		list-style-type: none;
	}
	
	/* -------------------------지점별 버튼------------------------ */
	#btn-seoul {
		color:rgba(103, 36, 54, 1);	
		font-weight:bold;
	}
	#btn-seoul:hover {
		color: rgba(255, 255, 255, 1);
		box-shadow: rgba(103, 36, 54, 1) 0 80px 0px 2px inset;
	}
	#seoul:hover {
		color: rgba(255, 255, 255, 1) !important;
	}
	
	#btn-jeju {
		color:rgba(132, 50, 61, 1);	
		font-weight:bold;
	}
	#btn-jeju:hover {
		color: rgba(255, 255, 255, 1);
		box-shadow: rgba(132, 50, 61, 0.8) 0 80px 0px 2px inset;
	}
	#jeju:hover {
		color: rgba(255, 255, 255, 1) !important;
	}
	
	#btn-busan {
		color:rgba(179, 76, 73, 1);	
		font-weight:bold;
	}
	#btn-busan:hover {
		color: rgba(255, 255, 255, 1);
		box-shadow: rgba(179, 76, 73, 1) 0 80px 0px 2px inset;
	}
	#busan:hover {
		color: rgba(255, 255, 255, 1) !important;
	}
	
	#btn-reung {
		color:rgba(243, 115, 88, 1);
		font-weight:bold;
	}
	#btn-reung:hover {
		color: rgba(255, 255, 255, 1);
		box-shadow: rgba(243, 115, 88, 1) 0 80px 0px 2px inset;
	}
	#reung:hover {
		color: rgba(255, 255, 255, 1) !important;
	}
	
	#btn-gwang {
		color:rgba(255, 173, 104, 1);	
		font-weight:bold;
	}
	#btn-gwang:hover {
		color: rgba(255, 255, 255, 1);
		box-shadow: rgba(255, 173, 104, 1) 0 80px 0px 2px inset;
	}
	#gwang:hover {
		color: rgba(255, 255, 255, 1) !important;
	}
	
</style>
<%-- <link href="${pageContext.request.contextPath}/resources/admincss/dashboard.css" rel="stylesheet"> --%>
</head>
<body>
<c:set var="menu" value="main"/>
<%@ include file="common/nav.jsp" %>

<div class="container-fluid">
    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2" style="font-weight:bold;">Spring Hotel Admin</h1>
        <div class="btn-group" role="group" aria-label="Basic mixed styles example">
		  <button type="button" class="btn" id="btn-seoul"><a href="main?location=1" id="seoul" style="text-decoration: none; color:rgba(103, 36, 54, 1); font-weight:bold;">서울점</a></button>
		  <button type="button" class="btn" id="btn-jeju"><a href="main?location=2" id="busan" style="text-decoration: none; color:rgba(103, 36, 54, 1); font-weight:bold;">부산점</a></button>
		  <button type="button" class="btn" id="btn-busan"><a href="main?location=3" id="jeju" style="text-decoration: none; color:rgba(103, 36, 54, 1); font-weight:bold;">제주점</a></button>
		  <button type="button" class="btn" id="btn-reung"><a href="main?location=4" id="reung" style="text-decoration: none; color:rgba(103, 36, 54, 1); font-weight:bold;">강릉점</a></button>
		  <button type="button" class="btn" id="btn-gwang"><a href="main?location=5" id="gwang" style="text-decoration: none; color:rgba(103, 36, 54, 1); font-weight:bold;">광주점</a></button>
		</div>
      </div>
	  <div class="row" id="sale">
	  	<div class="col py-3" id="sale-chart">
	  		<div class="row">
	  			<div class="col-8">
			  		<span style="font-size:1rem; font-weight:bold;">2022년 상반기 지역별 매출</span>
	  			</div>
	  			<div class="col-4 text-end">
			  		<span style="color: darkgray; font-size:0.75rem;">단위 : 만원</span>
	  			</div>
	  		</div>
	  		<div class="row">
		  		<canvas id="bar-chart" style="height:20vh; width:25vw;"></canvas>
		  	</div>
	  	</div>
	  	<div class="col py-3">
	  		<div class="row">
	  			<div class="col-8">
			  		<span style="font-size:1rem; font-weight:bold;">2022년 상반기 ${location.name }점 월별 매출</span>
	  			</div>
	  			<div class="col-4 text-end">
			  		<span style="color: darkgray; font-size:0.75rem;">단위 : 만원</span>
	  			</div>
	  		</div>
	  		<div class="row py-2">
	  			<canvas id="month-sale-chart" style="height:20vh; width:15vw;"></canvas>
	  		</div>
	  	</div>
	  	<div class="col py-3">
	  		<div class="row">
	  			<div class="col-8">
			  		<span style="font-size:1rem; font-weight:bold;">2022년 상반기 ${location.name }점 객실타입별 매출</span>
	  			</div>		
	  		</div>
	  		<div class="row py-4">
	  			<div class="col-4">
	  				<ul>
	  					<li style="margin-bottom:20px; font-size:1.2rem; font-weight:bold; color:#002c1b;">Standard</li>
	  					<li style="margin-bottom:20px; font-size:1.2rem; font-weight:bold; color:#0d4a27;">Executive</li>
	  					<li style="font-size:1.2rem; font-weight:bold; color:#397333">Suite</li>
	  				</ul>
	  			</div>
	  			<div class="col-3">
	  				<ul>
	  					<li style="margin-bottom:32px; font-size:0.9rem; font-weight:bold; position:relative; top:3px; right:40px;">${sale.saleStandard }만원</li>
	  					<li style="margin-bottom:28px; font-size:0.9rem; font-weight:bold; position:relative; right:40px;">${sale.saleExecutive }만원</li>
	  					<li style="font-size:0.9rem; font-weight:bold; position:relative; right:40px;">${sale.saleSuite }만원</li>
	  				</ul>
	  			</div>
	  			<div class="col-2">
	  				<ul>
	  					<li style="margin-bottom:35px; font-size:0.8rem; color:gray; position:relative; top:3px; right:90px;">${sale.standardPer}%</li>
	  					<li style="margin-bottom:30px; font-size:0.8rem; color:gray; position:relative; right:90px;">${sale.executivePer}%</li>
	  					<li style="font-size:0.8rem; color:gray; position:relative; right:90px;">${sale.suitePer}%</li>
	  				</ul>
	  			</div>
	  			<div class="col-3">
	  				<p style="font-size:1.5rem; font-weight:bold; position:relative; top:30px; right:50px; color:#74a63f;" >총매출</p>
	  				<small style="font-size:1rem; font-weight:bold; position:relative; top:30px; right:50px;">${sale.totalSaleByType}만원</small>
	  			</div>
	  		</div>
	  	</div>
	  </div>
	  <div class="row" id="rev">
	  	<div class="col py-3">
	  		<div class="row">
	  			<div class="col-8">
					<span style="font-size:1rem; font-weight:bold;">2022년 상반기 지역별 예약수</span>
				</div>
				<div class="col-4 text-end">
			  		<span style="color: darkgray; font-size:0.75rem;">단위 : 건</span>	  	
			  	</div>
			</div>
			<div class="row p-3">
				<div class="col-5">
			  		<canvas id="doughnut-chart" style="height:15vh; width:18vw; margin-left:-20px;"></canvas>
				</div>
				<div class="col-3">
				</div>
				<div class="col-2 text-end" style="font-size: 0.9rem; font-weight:bold; position:relative; top:6px;">
					<ul>
						<li style="margin-bottom:4px;">${sale.revSeoul}</li>
						<li style="margin-bottom:4px;">${sale.revBusan}</li>
						<li style="margin-bottom:4px;">${sale.revJeju}</li>
						<li style="margin-bottom:4px;">${sale.revGangreung}</li>
						<li>${sale.revGwangju}</li>
					</ul>
				</div>
				<div class="col-2" style="font-size: 0.7rem; color:gray; position:relative; right:35px; top:9px;">
					<ul>
						<li style="margin-bottom:9px;">28%</li>
						<li style="margin-bottom:9px;">28%</li>
						<li style="margin-bottom:9px;">28%</li>
						<li style="margin-bottom:9px;">28%</li>
						<li>28%</li>
					</ul>
				</div>
			</div> 
	  	</div>
	  	<div class="col py-3">
	  		<div class="row">
	  			<div class="col-8">
			  		<span style="font-size:1rem; font-weight:bold;">2022년 상반기 ${location.name }점 월별 예약수</span>
	  			</div>
	  			<div class="col-4 text-end">
			  		<span style="color: darkgray; font-size:0.75rem;">단위 : 건</span>
	  			</div>
	  		</div>
	  		<div class="row py-2">
	  			<canvas id="month-rev-chart" style="height:20vh; width:25vw;"></canvas>
	  		</div>	
	  	</div>
	  	<div class="col py-3">
	  		<div class="row">
	  			<div class="col-9">
			  		<span style="font-size:1rem; font-weight:bold;">2022년 상반기 ${location.name }점 객실타입별 예약수</span>
	  			</div>		
	  		</div>
	  		<div class="row py-4">
	  			<div class="col-4">
	  				<ul>
	  					<li style="margin-bottom:20px; font-size:1.2rem; font-weight:bold; color:#002c1b;">Standard</li>
	  					<li style="margin-bottom:20px; font-size:1.2rem; font-weight:bold; color:#0d4a27;">Executive</li>
	  					<li style="font-size:1.2rem; font-weight:bold; color:#397333">Suite</li>
	  				</ul>
	  			</div>
	  			<div class="col-3">
	  				<ul>
	  					<li style="margin-bottom:32px; font-size:0.9rem; font-weight:bold; position:relative; top:3px; right:40px;">${sale.revStan}건</li>
	  					<li style="margin-bottom:28px; font-size:0.9rem; font-weight:bold; position:relative; right:40px;">${sale.revExec}건</li>
	  					<li style="font-size:0.9rem; font-weight:bold; position:relative; right:40px;">${sale.revSuit}건</li>
	  				</ul>
	  			</div>
	  			<div class="col-2">
	  				<ul>
	  					<li style="margin-bottom:35px; font-size:0.8rem; color:gray; position:relative; top:3px; right:90px;">${sale.revStanPer}%</li>
	  					<li style="margin-bottom:30px; font-size:0.8rem; color:gray; position:relative; right:90px;">${sale.revExecPer}%</li>
	  					<li style="font-size:0.8rem; color:gray; position:relative; right:90px;">${sale.revSuitPer}%</li>
	  				</ul>
	  			</div>
	  			<div class="col-3">
	  				<p style="font-size:1.5rem; font-weight:bold; position:relative; top:30px; right:50px; color:#74a63f;" >총예약</p>
	  				<small style="font-size:1rem; font-weight:bold; position:relative; top:30px; right:50px;">${sale.totalRevByType}건</small>
	  			</div>
	  		</div>
	  	</div>
	  </div>
     
      <h2 style="font-weight: bold;">Impending Reservation</h2>
      <div class="row">
      	<div class="col">
	      <div class="table-responsive">
	      	<h5 style="font-weight: bold;">Room</h5>
	        <table class="table table-striped table-sm">
	          <thead>
	            <tr>
	              <th scope="col">예약번호</th>
	              <th scope="col">객실명</th>
	              <th scope="col">고객명</th>
	              <th scope="col">체크인</th>
	              <th scope="col">지점</th>
	            </tr>
	          </thead>
	          <tbody>
	          <c:forEach var="roomRev" items="${roomRevs}">
	            <tr>
	              <td>${roomRev.no }</td>
	              <td>${roomRev.room.roomCategory.name }</td>
	              <td>${roomRev.user.name }<small class="d-block">${roomRev.user.tel }</small></td>
	              <td><fmt:formatDate value="${roomRev.checkinTime }" pattern="yyyy-MM-dd" /><small class="d-block">${roomRev.optionCheckinTime}</small></td>
	              <td>${roomRev.room.location.name }</td>
	            </tr>
	          </c:forEach>
	          </tbody>
	        </table>
	      </div>
      	</div>
      	<div class="col">
	      <div class="table-responsive">
	      	<h5 style="font-weight: bold;">Dining</h5>
	        <table class="table table-striped table-sm">
	          <thead>
	            <tr>
	              <th scope="col">예약번호</th>
	              <th scope="col">레스토랑명</th>
	              <th scope="col">고객명</th>
	              <th scope="col">방문일</th>
	              <th scope="col">지점</th>
	            </tr>
	          </thead>
	          <tbody>
	          <c:forEach var="rtRev" items="${rtRevs}">
	            <tr>
	              <td>${rtRev.no }</td>
	              <td>${rtRev.dn.dnCategory.name }</td>
	              <td>${rtRev.user.name }<small class="d-block">${rtRev.user.tel }</small></td>
	              <td><fmt:formatDate value="${rtRev.visitDate }" pattern="yyyy-MM-dd" /><small class="d-block">${rtRev.mealTime }</small></td>
	              <td>${rtRev.dn.location.name }</td>
	            </tr>
	          </c:forEach>
	          </tbody>
	        </table>
	      </div>
      	</div>
      </div>
    </main>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.9.1/dist/chart.min.js" integrity="sha256-+8RZJua0aEWg+QVVKg4LEzEEm/8RFez5Tb4JBNiV5xA=" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/admincss/dashboard.js"></script>
<script>
$(function () {
	
	// 지역별 매출
	var ctx = document.getElementById('bar-chart'); // node
	var ctx = document.getElementById('bar-chart').getContext('2d'); // 2d context
	var ctx = $('#bar-chart'); // jQuery instance
	var ctx = 'bar-chart'; // element id

	// 월별 매출
	var ctx2 = document.getElementById('month-sale-chart'); // node
	var ctx2 = document.getElementById('month-sale-chart').getContext('2d'); // 2d context
	var ctx2 = $('#month-sale-chart'); // jQuery instance
	var ctx2 = 'month-sale-chart'; // element id
	
	// 지역별 예약수
	var ctx3 = document.getElementById('doughnut-chart'); // node
	var ctx3 = document.getElementById('doughnut-chart').getContext('2d'); // 2d context
	var ctx3 = $('#doughnut-chart'); // jQuery instance
	var ctx3 = 'doughnut-chart'; // element id
	
	// 지역별 예약수
	var ctx4 = document.getElementById('month-rev-chart'); // node
	var ctx4 = document.getElementById('month-rev-chart').getContext('2d'); // 2d context
	var ctx4 = $('#month-rev-chart'); // jQuery instance
	var ctx4 = 'month-rev-chart'; // element id
	
	// 지역별 매출
	var barChart = new Chart(ctx, {
				    type: 'bar',
				    data: {
				      labels: ["서울", "부산", "제주","강릉","광주"],
				      datasets: [
				        { 
				          label: "2022 상반기 지역별 매출",
				          backgroundColor: ["rgba(103, 36, 54, 1)", "rgba(132, 50, 61, 1)", "rgba(179, 76, 73, 1)", "rgba(243, 115, 88, 1)", "rgba(255, 173, 104, 1)"],
				          data: [${sale.saleSeoul}, ${sale.saleBusan}, ${sale.saleJeju},${sale.saleGangreung},${sale.saleGwangju}]
				        }
				      ]
				    },
				    options: {
				      indexAxis: 'y',
			    	  scales: {
			    	      x: {
			    	        grid: {
			    	          display: false,
			    	        }
			    	      },
			    	      y: {
			    	        grid: {
			    	          display: false
			    	        }
			    	      },
			    	  },
				      responsive: false,
				      plugins: {
				    	  legend: { 
				    		  display: false 
				    		  }
				      }
				      /* title: {
				        display: false,
				        text: '2022 상반기 지점별 매출현황'
				      } */
				    }
				}); 
	
	// 월별 매출
	var monthSaleChart = new Chart(ctx2, {
		  type: 'bar',
		  data: {
		    labels: ['01월', '02월', '03월', '04월', '05월', '06월'],
		    datasets: [{ 
		        data: [${sale.saleJan}, ${sale.saleFeb}, ${sale.saleMar}, ${sale.saleApr}, ${sale.saleMay}, ${sale.saleJun}],
		        label: "2022 상반기 월별 매출",
		        backgroundColor: ["#002743", "#00486d", "#00769f", "#00b2d5", "#00fbff", "#003697"], 
		      }]
		  },
		  options: {
		    title: {
		      display: true,
		      text: 'World population per region (in millions)'
		    },
		    plugins: {
		    	  legend: { 
		    		  display: false 
		    		  }
		    },
		    responsive: false,
		    scales: { 
	    	      x: {
	    	        grid: {
	    	          display: false,
	    	        }
	    	      },
	    	      y: {
	    	        grid: {
	    	          display: false
	    	        }
	    	      },	     
	    	  }
		}
	});
	
	// 지역별 예약수
	var doughnutChart = new Chart(ctx3, {
					  type: 'doughnut',
					  data: {
					    labels: ["서울", "제주", "부산", "강릉", "광주"],
					    datasets: [{ 
					        data: [${sale.revSeoul},${sale.revBusan}, ${sale.revJeju}, ${sale.revGangreung}, ${sale.revGwangju}],
					        label: "지점별 예약수",
					        borderColor: "RGBa(220, 220, 220, 0.3)",
					        backgroundColor: ["rgba(103, 36, 54, 1)", "rgba(132, 50, 61, 1)", "rgba(179, 76, 73, 1)", "rgba(243, 115, 88, 1)", "rgba(255, 173, 104, 1)"]
					      }]
					  },
					  options: {
						responsive: false,
					    title: {
					      display: false,
					      text: '매출 증가 추이'  
					    },
					      plugins: {
				    	  legend: { 
				    		  display: true,
				    		  position: 'right',
				    		  labels: {
				    			  	  boxWidth:20,	
					    			  font: {
					    				  size: 15
					    			  }
					    		  }
				    		  },  
				        }, 		    
					  }
					});
	
	// 월별 예약 수
	var monthRevChart = new Chart(ctx4, {
		  type: 'bar',
		  data: {
		    labels: ['01월', '02월', '03월', '04월', '05월', '06월'],
		    datasets: [{ 
		        data: [${sale.revJan},${sale.revFeb},${sale.revMar},${sale.revApr},${sale.revMay},${sale.revJun}],
		        label: "2022 상반기 00지점 월별 예약수",
		        backgroundColor: ["#002743", "#00486d", "#00769f", "#00b2d5", "#00fbff", "#003697"], 
		      }]
		  },
		  options: {
			indexAxis: 'y',
		    title: {
		      display: true,
		      text: 'World population per region (in millions)'
		    },
		    plugins: {
		    	  legend: { 
		    		  display: false 
		    		  }
		    },
		    responsive: false,
		    scales: { 
	    	      x: {
	    	        grid: {
	    	          display: false,
	    	        }
	    	      },
	    	      y: {
	    	        grid: {
	    	          display: false
	    	        }
	    	      },	     
	    	  }
		}
	});
})
</script>
</body>
</html>