<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약페이지</title>
<!-- 공통 링크 로딩 -->
<jsp:include page = 'partials/commonhead.jsp' flush = "false"/>
<!-- 달력 css -->
<jsp:include page = 'css/datepicker.jsp' flush = "false"/>

<!-- Bootstrap Datepicker CSS 설정-->
<link href="css/datepicker.css?v=1.1" rel="stylesheet" type="text/css">
</head>

<body>

	<jsp:include page = 'partials/commonbody.jsp' flush = "false"/>
	<br>
	<br>

 <div class="container mt-6">
        <div class="row">
            <!-- 시설 목록 (왼쪽) -->
            <div class="col-md-8 pr-5">
                <div id="facilityListContainer">
                </div>
            </div>

            <!-- 달력 (오른쪽) -->
            <div class="col-md-4 pl-5">
                <h3>날짜 선택</h3>
                <input type="text" id="datePicker" class="form-control">
                <div id="timeFormContainer" class="mt-3"></div>
            </div>
        </div>
    </div>

	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
	<script>
  
        $(document).ready(function() {
            // 2024년 4월 1일부터 시작했음
            $('#datePicker').datepicker({
                format : 'yyyy-mm-dd',
                startDate : '2024-04-01',
                autoclose : false,
                language : 'ko'
            });

            // 페이지 로드 후 달력 화면 자동 표시
            $('#datePicker').datepicker('show');
        });

        // 달력에서 날짜 선택할 때 이벤트 (ajax 요청하기)
        $('#datePicker').on('changeDate', function(e) {
            var selectDate = e.format('yyyy-mm-dd');
            loadTimeForm(selectDate); // 선택한 날짜에 해당하는 시간 폼 로드
        });

        // 선택한 날짜에 해당하는 시간 폼 로드
        function loadTimeForm(selectedDate) {
            $.ajax({
                url : 'time.jsp', // 날짜 누르면 나타낼 창
                method : 'GET',
                data : {
                    date : selectedDate
                },
                success : function(response) {
                    $('#timeFormContainer').html(response);
                },
                error : function(xhr, status, error) {
                    console.error('Error:', error);
                }
            });
        }

        $(document).on('click', function(event) {
            if (!$(event.target).closest('.datepicker').length) {
                if ($('#datePicker').hasClass('datepicker-open')) {
                    return false;
                } else {
                    $('#datePicker').datepicker('show');
                }
            }
        });

    </script>
    <script>
        $(document).ready(function() {
            // 페이지 로드 시 'list' 를 ajax로 불러옴
            $.ajax({
                url: "list",  
                type: "GET",
                success: function(data){
                    $('#facilityListContainer').html(data);  
                },
                error: function(xhr, status, error) {
                    console.error("Error fetching facilities: ", error);
                }
            });
        });
    </script>
</body>
</html>
