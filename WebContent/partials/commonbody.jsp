<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.sports.model.vo.UserVO"%>
<!-- 부트스트랩 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

<!-- 팝업창 오픈소스 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<!-- 마우스 이동 감지 스크립트 -->
<script>
document.addEventListener('mousemove', function (e) {
    var dot = document.getElementById('cursor');
    dot.style.left = e.pageX + 'px';
    dot.style.top = e.pageY + 'px';
})
</script>

<!-- 마우스 div요소 -->
<div class="cursor" id="cursor"></div>

<!-- navbar 적용 -->
<jsp:include page="nav.jsp"/>
